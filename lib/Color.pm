package Color;

use strict;
use warnings;
use 5.008001;
use FFI::Platypus 0.95;
use overload ();

# ABSTRACT: Example module using FFI::Platypus + FFI::Build
# VERSION

=head1 SYNOPSIS

 my $color = Color::FFI->new(255,255,255);
 $color->set_green(75);
 $color->set_blue(100);
 say "red is ", $color->get_red;
 say "green is ", $color->get_green;
 say "blue is ", $color->get_blue;

=head1 DESCRIPTION

This module is an example of how to bundle C code with Perl using
L<FFI::Build> and L<FFI::Platypus>.  Please see L<FFI::Platypus::Bundle>
for complete details on how to do this.

This example class represents a color as stored in 8-bit red, green
and blue values.

=head1 CONSTRUCTOR

=head2 new

To create an instance of this class, you can use new, and provide the
red, green and blue values.

 my $color = Color::FFI->new(0x7f,0xff,0x00);
 my $red = Color::FFI->red;
 my $green = Color::FFI->green;
 my $blue = Color::FFI->blue;

=head1 METHODS

=head2 get_red

 my $red = $color->get_red;

Return the red color channel as an 8-bit value.

=head2 set_red

 $color->set_red($red);

Sets the red color channel as an 8-bit value.

=head2 get_green

 my $green = $color->get_green;

Return the green color channel as an 8-bit value.

=head2 set_green

 $color->set_green($green);

Sets the green color channel as an 8-bit value.

=head2 get_blue

 my $blue = $color->get_blue;

Return the blue color channel as an 8-bit value.

=head2 set_blue

 $color->set_blue($blue);

Sets the blue color channel as an 8-bit value.

=head2 to_string

 my $string = $color->to_string;
 my $string = "$color";

This method returns a stringified version of the color object.
It will also be used if the object is interpolated into a string
automatically.

=head1 CAVEATS

It's just an example for testing, it isn't really useful for
anything.

=cut

{
  my $ffi = FFI::Platypus->new( api => 1, experimental => 1 );
  $ffi->bundle;
  $ffi->type( 'object(Color)' => 'color_t' );
  $ffi->mangler( sub {
    my $name = shift;
    $name =~ s/^/color__/;
    $name;
  });

  $ffi->attach( new => [ 'string', 'uint8', 'uint8', 'uint8' ] => 'color_t' );
  $ffi->attach( DESTROY => [ 'color_t' ] => 'void' );

  foreach my $color (qw( red green blue ))
  {
    $ffi->attach( "get_$color" => [ 'color_t' ] => 'uint8' );
    $ffi->attach( "set_$color" => [ 'color_t', 'uint8' ] => 'void' );
  }

  $ffi->attach( to_string => ['color_t'] => 'string' );

  overload->import(
    '""' => \&to_string,
    'bool' => sub { 1 },
    'fallback' => 1,
  );
}

1;

