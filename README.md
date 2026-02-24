# GD::Barcode

Create barcode images with GD

## Synopsis

*Example: CGI*

```perl
use GD::Barcode::UPCE;
binmode(STDOUT);
print "Content-Type: image/png\n\n";
print GD::Barcode->new('EAN13', '123456789012')->plot->png;
```

*With Error Check*

```perl
my $oGdBar = GD::Barcode->new('EAN13', '12345678901');
die $GD::Barcode::errStr unless($oGdBar);     # Invalid Length
$oGdBar->plot->png;
```

## Description

GD::Barcode is a subclass of GD and allows you to create barcode images with GD.
This module is based on "Generate Barcode Ver 1.02 By Shisei Hanai 97/08/22".

From version 1.14, you can use this module even without GD (except the plot
method).

### new

```perl
$oGdBar = GD::Barcode->new($sType, $sTxt);
```

Constructor. Creates a `GD::Barcode::$sType` object for `$sTxt`.

### plot()

```perl
$oGd = $oGdBar->plot(Height => $iHeight, NoText => 0 | 1);
```

Creates a GD object with barcode image for the `$sTxt` specified in the `new`
method. `$iHeight` is the height of the image. If `NoText` is 1, the image has
no text representation of `$sTxt`.

**Example:**

```perl
my $oGdB = GD::Barcode->new('EAN13', '123456789012');
my $oGD = $oGdB->plot(NoText=>1, Height => 20);
# $oGD is a GD image with Height=>20 pixels, with no text.
```

### barcode()

```perl
$sPtn = $oGdBar->barcode();
```

Returns a barcode pattern as a string with '1' and '0'. '1' means black, '0'
means white.

**Example:**

```perl
my $oGdB = GD::Barcode->new('UPCE', '123456');
my $sPtn = $oGdB->barcode();
```

### $errStr

```perl
$GD::Barcode::errStr
```

Contains error messages.

### $text

```perl
$oGdBar->{text}
```

Contains the barcode text based on `$sTxt` specified in the `new` method.

## Contributing

For information about code formatting, git hooks, and testing, see
[DEVELOPING.md](DEVELOPING.md).

## Author

Kawai Takanori GCD00051@nifty.ne.jp

## Copyright

The GD::Barcode module is Copyright (c) 2000 Kawai Takanori. Japan. All rights
reserved.

You may distribute under the terms of either the GNU General Public License or
the Artistic License, as specified in the Perl README file.

## See Also

- [GD](https://metacpan.org/pod/GD)
- GD::Barcode subclasses
