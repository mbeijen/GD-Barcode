use Test2::V0;

use GD::Barcode;
use GD::Barcode::Code39;
use GD::Barcode::NW7;

my @cases = (
    [ 'Code39',         sub { GD::Barcode::Code39->new('*12345*') } ],
    [ 'COOP2of5',       sub { GD::Barcode->new( 'COOP2of5',       '123' ) } ],
    [ 'EAN13',          sub { GD::Barcode->new( 'EAN13',          '123456789012' ) } ],
    [ 'EAN8',           sub { GD::Barcode->new( 'EAN8',           '1234567' ) } ],
    [ 'IATA2of5',       sub { GD::Barcode->new( 'IATA2of5',       '123456789' ) } ],
    [ 'Industrial2of5', sub { GD::Barcode->new( 'Industrial2of5', '123' ) } ],
    [ 'ITF',            sub { GD::Barcode->new( 'ITF',            '1001234500001' ) } ],
    [ 'Matrix2of5',     sub { GD::Barcode->new( 'Matrix2of5',     '123456784' ) } ],
    [ 'NW7',            sub { GD::Barcode::NW7->new('12:AB::CD') } ],
    [ 'UPCA',           sub { GD::Barcode->new( 'UPCA',           '72527273070' ) } ],
    [ 'UPCE',           sub { GD::Barcode->new( 'UPCE',           '1234567' ) } ],
);

my $has_gd = eval { require GD; 1 };

for my $case (@cases) {
    my ( $type, $ctor ) = @$case;
    my $barcode = $ctor->();
    ok( defined $barcode, "$type constructor returns object" );
    next unless defined $barcode;

    my $ok = eval {
        my $img = $barcode->plot( NoText => 1 );
        ok( defined $img, "$type plot(NoText=>1) returns image" );
        ok( $img->can('png'), "$type image responds to png" );
        1;
    };

    if ($has_gd) {
        ok( $ok, "$type plot(NoText=>1) succeeds when GD is available" )
          or diag $@;
    }
    else {
        ok( !$ok, "$type plot(NoText=>1) fails cleanly when GD is missing" );
        like( $@, qr/Can't locate GD\.pm/, "$type reports missing GD module" );
    }
}

done_testing;
