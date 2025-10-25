package GD::Barcode;
use parent qw(Exporter);
use strict;
use warnings;

use vars qw( @ISA $errStr);
use parent qw(Exporter);
our $VERSION = '2.02';

sub new {
    my ( $sClass, $sType, $sTxt, $rhPrm ) = @_;
    my $oThis = {};
    my $module = "GD::Barcode::$sType";
    eval "require $module;";
    if ($@) {
        $errStr = "Can't load $sType : $@";
        return;
    }
    bless $oThis, $module;
    return if ( $errStr = $oThis->init( $sTxt, $rhPrm ) );
    return $oThis;
}

sub barPtn {
    my ( $bar, $table ) = @_;
    my $sRes;

    $sRes = '';
    foreach my $sWk ( split( //, $bar ) ) {
        $sRes .= $table->{$sWk};
    }
    return $sRes;
}

sub dumpCode {
    my ($sCode) = @_;
    my ( $sRes, $sClr );

    #Init
    $sRes = '';
    $sClr = '1';    # 1: Black, 0:White

    foreach my $sWk ( split( //, $sCode ) ) {
        $sRes .= ( $sWk eq '1' ) ? $sClr x 3 : $sClr;    #3 times or Normal
        $sClr = ( $sClr eq '0' ) ? '1' : '0';
    }
    return $sRes;
}

sub plot {
    my ( $sBarcode, $iWidth, $iHeight, $fH, $iStart ) = @_;

    #Create Image
    my ( $gdNew, $cWhite, $cBlack );
    eval {
        $gdNew = GD::Image->new( $iWidth, $iHeight );
        $cWhite = $gdNew->colorAllocate( 255, 255, 255 );
        $cBlack = $gdNew->colorAllocate( 0,   0,   0 );
        $gdNew->filledRectangle( 0, 0, $iWidth, $iHeight, $cWhite );

        my $iPos = $iStart;
        foreach my $cWk ( split( //, $sBarcode ) ) {
            if ( $cWk eq '0' ) {
                $gdNew->line( $iPos, 0, $iPos, $iHeight - $fH, $cWhite );
            }
            elsif ( $cWk eq 'G' ) {
                $gdNew->line( $iPos, 0, $iPos, $iHeight - 2 * ( $fH / 3 ),
                    $cBlack );
            }
            else {    #$cWk eq "1" etc.
                $gdNew->line( $iPos, 0, $iPos, $iHeight - $fH, $cBlack );
            }
            $iPos++;
        }
    };
    return ( $gdNew, $cBlack );
}
1;
__END__


=head1 NAME

GD::Barcode - Create barcode image with GD

=head1 SYNOPSIS

I<ex. CGI>

  use GD::Barcode::UPCE;
  binmode(STDOUT);
  print "Content-Type: image/png\n\n";
  print GD::Barcode->new('EAN13', '123456789012')->plot->png;

I<with Error Check>

  my $oGdBar = GD::Barcode->new('EAN13', '12345678901');
  die $GD::Barcode::errStr unless($oGdBar);     #Invalid Length
  $oGdBar->plot->png;

=head1 DESCRIPTION

GD::Barcode is a subclass of GD and allows you to create barcode image with GD.
This module based on "Generate Barcode Ver 1.02 By Shisei Hanai 97/08/22".

From 1.14, you can use this module even if no GD (except plot method).


=head2 new

I<$oGdBar> = GD::Barcode::UPCE->new(I<$sType>, I<$sTxt>);

Constructor.
Creates a GD::Barcode::I<$sType> object for I<$sTxt>.

=head2 plot()

I<$oGd> = $oGdBar->plot([Height => I<$iHeight>, NoText => I<0 | 1>]);

creates GD object with barcode image for the I<$sTxt> specified at L</new> method.
I<$iHeight> is height of the image. If I<NoText> is 1, the image has no text image of I<$sTxt>.

 ex.
  my $oGdB = GD::Barcode->new('EAN13', '123456789012');
  my $oGD = $oGdB->plot(NoText=>1, Height => 20);
  # $sGD is a GD image with Height=>20 pixels, with no text.

=head2 barcode()

I<$sPtn> = $oGdBar->barcode();

returns a barcode pattern in string with '1' and '0'.
'1' means black, '0' means white.

 ex.
  my $oGdB = GD::Barcode->new('UPCE', '123456789012');
  my $sPtn = $oGdB->barcode();
  # $sPtn = '';

=head2 $errStr

$GD::Barcode::errStr

has error message.

=head2 $text

$oGdBar->{$text}

has barcode text based on I<$sTxt> specified in L</new> method.

=head1 AUTHOR

Kawai Takanori GCD00051@nifty.ne.jp

=head1 COPYRIGHT

The GD::Barcode module is Copyright (c) 2000 Kawai Takanori. Japan.
All rights reserved.

You may distribute under the terms of either the GNU General Public
License or the Artistic License, as specified in the Perl README file.

=head1 SEE ALSO

GD GD::Barcode subclasses

=cut
