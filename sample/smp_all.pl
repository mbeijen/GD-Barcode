use strict;
use GD::Barcode;

my $oGdBar;
#1)EAN13
#1.1 NORMAL
print "=======================\nEAN13: NORMAL\n";
$oGdBar = GD::Barcode->new('EAN13', '123456789012');
print "PTN:", $oGdBar->{text}, ":" ,$oGdBar->barcode, "\n";
open(OUT, '>EAN13.png');
print OUT $oGdBar->plot->png;
close OUT;
undef $oGdBar;

#1.2 Error
print "EAN13: ERROR\n";
$oGdBar = GD::Barcode->new('EAN13', '12345678901');
print "ERROR:", $GD::Barcode::errStr, "\n";
undef $oGdBar;

#2)EAN8
#2.1 NORMAL
print "=======================\nEAN8: NORMAL\n";
$oGdBar = GD::Barcode->new('EAN8', '1234567');
print "PTN:", $oGdBar->{text}, ":" ,$oGdBar->barcode, "\n";
open(OUT, '>EAN8.png');
print OUT $oGdBar->plot->png;
close OUT;
undef $oGdBar;

#2.2 Error
print "EAN8: ERROR\n";
$oGdBar = GD::Barcode->new('EAN8', 'A1234567');
print "ERROR:", $GD::Barcode::errStr, "\n";
undef $oGdBar;

#3)UPC-A
#3.1 NORMAL
print "=======================\nUPCA: NORMAL\n";
$oGdBar = GD::Barcode->new('UPCA', '12345678901');
print "PTN:", $oGdBar->{text}, ":" ,$oGdBar->barcode, "\n";
open(OUT, '>UPCA.png');
print OUT $oGdBar->plot->png;
close OUT;
undef $oGdBar;

#3.2 Error
print "UPCA: ERROR\n";
$oGdBar = GD::Barcode->new('UPCA','12345678901132');
print "ERROR:", $GD::Barcode::errStr, "\n";
undef $oGdBar;

#4)UPC-E
#4.1 NORMAL
print "=======================\nUPCE: NORMAL\n";
$oGdBar = GD::Barcode->new('UPCE', '1234567');
print "PTN:", $oGdBar->{text}, ":" ,$oGdBar->barcode, "\n";
open(OUT, '>UPCE.png');
print OUT $oGdBar->plot->png;
close OUT;
undef $oGdBar;

#4.2 Error
print "UPCE: ERROR\n";
$oGdBar = GD::Barcode->new('UPCE', '123456788');
print "ERROR:", $GD::Barcode::errStr, "\n";
undef $oGdBar;

#5)NW7
#5.1 NORMAL
print "=======================\nNW7: NORMAL\n";
$oGdBar = GD::Barcode->new('NW7', '12345678');
print "PTN:", $oGdBar->{text}, ":" ,$oGdBar->barcode, "\n";
open(OUT, '>NW7.png');
print OUT $oGdBar->plot->png;
close OUT;
undef $oGdBar;

#5.2 Error
print "NW7: ERROR\n";
$oGdBar = GD::Barcode->new('NW7', 'NW7ERROR');
print "ERROR:", $GD::Barcode::errStr, "\n";
undef $oGdBar;

#6)CODE-39
#6.1 NORMAL
print "=======================\nCode39: NORMAL\n";
$oGdBar = GD::Barcode->new('Code39', '*123456789012*');
print "PTN:", $oGdBar->{text}, ":" ,$oGdBar->barcode, "\n";
open(OUT, '>Code39.png');
print OUT $oGdBar->plot->png;
close OUT;
undef $oGdBar;

#6.2 Error
print "Code39: ERROR\n";
$oGdBar = GD::Barcode->new('Code39', '*12345678901;*');
print "ERROR:", $GD::Barcode::errStr, "\n";
undef $oGdBar;

#7)ITF(Interleaved 2 of 5)
#7.1 NORMAL
print "=======================\nITF: NORMAL\n";
$oGdBar = GD::Barcode->new('ITF', '0123456789');
print "PTN:", $oGdBar->{text}, ":" ,$oGdBar->barcode, "\n";
open(OUT, '>ITF.png');
print OUT $oGdBar->plot->png;
close OUT;
undef $oGdBar;

#7.2 Error
print "ITF: ERROR\n";
$oGdBar = GD::Barcode->new('ITF', '123456788A');
print "ERROR:", $GD::Barcode::errStr, "\n";
undef $oGdBar;
