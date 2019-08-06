# Color [![Build Status](https://secure.travis-ci.org/plicease/Color.png)](http://travis-ci.org/plicease/Color)

Example module using FFI::Platypus + FFI::Build

# SYNOPSIS

    my $color = Color::FFI->new(255,255,255);
    $color->set_green(75);
    $color->set_blue(100);
    say "red is ", $color->get_red;
    say "green is ", $color->get_green;
    say "blue is ", $color->get_blue;

# DESCRIPTION

This module is an example of how to bundle C code with Perl using
[FFI::Build](https://metacpan.org/pod/FFI::Build) and [FFI::Platypus](https://metacpan.org/pod/FFI::Platypus).  Please see [FFI::Platypus::Bundle](https://metacpan.org/pod/FFI::Platypus::Bundle)
for complete details on how to do this.

This example class represents a color as stored in 8-bit red, green
and blue values.

# CONSTRUCTOR

## new

To create an instance of this class, you can use new, and provide the
red, green and blue values.

    my $color = Color::FFI->new(0x7f,0xff,0x00);
    my $red = Color::FFI->red;
    my $green = Color::FFI->green;
    my $blue = Color::FFI->blue;

# METHODS

## get\_red

    my $red = $color->get_red;

Return the red color channel as an 8-bit value.

## set\_red

    $color->set_red($red);

Sets the red color channel as an 8-bit value.

## get\_green

    my $green = $color->get_green;

Return the green color channel as an 8-bit value.

## set\_green

    $color->set_green($green);

Sets the green color channel as an 8-bit value.

## get\_blue

    my $blue = $color->get_blue;

Return the blue color channel as an 8-bit value.

## set\_blue

    $color->set_blue($blue);

Sets the blue color channel as an 8-bit value.

## to\_string

    my $string = $color->to_string;
    my $string = "$color";

This method returns a stringified version of the color object.
It will also be used if the object is interpolated into a string
automatically.

# CAVEATS

It's just an example for testing, it isn't really useful for
anything.

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2019 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
