use strict;
use GD::Barcode::EAN8;
use GD::Barcode::EAN13;
use GD::Barcode::UPCA;
use GD::Barcode::UPCE;
use GD::Barcode::NW7;
use GD::Barcode::Code39;

my $oGdBar;
#1)EAN13
#1.1 NORMAL
print "=======================\nEAN13: NORMAL\n";
$oGdBar = GD::Barcode::EAN13->new('123456789012');
print "PTN:", $oGdBar->{text}, ":" ,$oGdBar->barcode, "\n";
open(OUT, '>EAN13.png');
print OUT $oGdBar->plot->png;
close OUT;
undef $oGdBar;

#1.2 Error
print "EAN13: ERROR\n";
$oGdBar = GD::Barcode::EAN13->new('12345678901');
print "ERROR:", $GD::Barcode::EAN13::errStr, "\n";
undef $oGdBar;

#2)EAN8
#2.1 NORMAL
print "=======================\nEAN8: NORMAL\n";
$oGdBar = GD::Barcode::EAN8->new('1234567');
print "PTN:", $oGdBar->{text}, ":" ,$oGdBar->barcode, "\n";
open(OUT, '>EAN8.png');
print OUT $oGdBar->plot->png;
close OUT;
undef $oGdBar;

#2.2 Error
print "EAN8: ERROR\n";
$oGdBar = GD::Barcode::EAN8->new('A1234567');
print "ERROR:", $GD::Barcode::EAN8::errStr, "\n";
undef $oGdBar;

#3)UPC-A
#3.1 NORMAL
print "=======================\nUPCA: NORMAL\n";
$oGdBar = GD::Barcode::UPCA->new('12345678901');
print "PTN:", $oGdBar->{text}, ":" ,$oGdBar->barcode, "\n";
open(OUT, '>UPCA.png');
print OUT $oGdBar->plot->png;
close OUT;
undef $oGdBar;

#3.2 Error
print "UPCA: ERROR\n";
$oGdBar = GD::Barcode::UPCA->new('12345678901132');
print "ERROR:", $GD::Barcode::UPCA::errStr, "\n";
undef $oGdBar;

#4)UPC-E
#4.1 NORMAL
print "=======================\nUPCE: NORMAL\n";
$oGdBar = GD::Barcode::UPCE->new('1234567');
print "PTN:", $oGdBar->{text}, ":" ,$oGdBar->barcode, "\n";
open(OUT, '>UPCE.png');
print OUT $oGdBar->plot->png;
close OUT;
undef $oGdBar;

#4.2 Error
print "UPCE: ERROR\n";
$oGdBar = GD::Barcode::UPCE->new('123456788');
print "ERROR:", $GD::Barcode::UPCE::errStr, "\n";
undef $oGdBar;

#5)NW7
#5.1 NORMAL
print "=======================\nNW7: NORMAL\n";
$oGdBar = GD::Barcode::NW7->new('12345678');
print "PTN:", $oGdBar->{text}, ":" ,$oGdBar->barcode, "\n";
open(OUT, '>NW7.png');
print OUT $oGdBar->plot->png;
close OUT;
undef $oGdBar;

#5.2 Error
print "NW7: ERROR\n";
$oGdBar = GD::Barcode::NW7->new('NW7ERROR');
print "ERROR:", $GD::Barcode::NW7::errStr, "\n";
undef $oGdBar;

#6)CODE-39
#6.1 NORMAL
print "=======================\nCode39: NORMAL\n";
$oGdBar = GD::Barcode::Code39->new('*123456789012*');
print "PTN:", $oGdBar->{text}, ":" ,$oGdBar->barcode, "\n";
open(OUT, '>Code39.png');
print OUT $oGdBar->plot->png;
close OUT;
undef $oGdBar;

#6.2 Error
print "Code39: ERROR\n";
$oGdBar = GD::Barcode::Code39->new('*12345678901;*');
print "ERROR:", $GD::Barcode::Code39::errStr, "\n";
undef $oGdBar;
