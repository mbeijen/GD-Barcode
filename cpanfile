requires 'Exporter', '0';
requires 'parent', '0';

on test => sub {
    requires 'Test2::V0', '0.000060';
    recommends 'GD', '0';
    recommends 'Business::ISBN', '3.007';
};

feature 'plot', 'Generate barcode image files' => sub{
    requires 'GD', '0';
};
