use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME         => 'GD::Barcode',
    VERSION_FROM => 'lib/GD/Barcode.pm',
    ABSTRACT_FROM     => 'lib/GD/Barcode.pm',
    PREREQ_PM => {
        Exporter => 0,
    },
    INSTALLDIRS        => 'perl',
    LICENSE            => 'perl',
    AUTHOR             => 'Kawai Takanori <GCD00051@nifty.ne.jp>',
    "test" => {
        "TESTS" => "t/*.t"
    },
    META_MERGE => {
        resources => {
            repository => 'https://github.com/mbeijen/GD-Barcode',
            bugtracker => 'https://github.com/mbeijen/GD-Barcode/issues',
        },
    },
);
