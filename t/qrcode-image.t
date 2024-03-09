use Test2::V0;
use Test2::Require::Module 'GD';

use GD::Barcode::QRcode;
use File::Temp qw(tempfile);
use File::stat;

my $qrcode = GD::Barcode::QRcode->new('1234567', {ModuleSize => 20, ECC => 'M'});
ok($qrcode, 'QRcode');

my ($fh, $filename) = tempfile();
binmode $fh;
print $fh $qrcode->plot->png;
close $fh;

my $filesize = stat($filename)->size;
ok($filesize > 0, 'PNG file is not empty');

unlink $filename or diag "Could not unlink $filename: $!";

done_testing();
