use Test2::V0 -no_srand => 1;
use Color;
use Data::Dumper qw( Dumper );

subtest 'basic' => sub {

  my $color = Color->new(1,2,3);
  isa_ok $color, 'Color';

  note Dumper( $color );

  undef $color;

  ok 'did not crash on DESTROY';

};

subtest 'components' => sub {

  my $color = Color->new( 10, 20, 30 );

  is $color->get_red, 10;
  is $color->get_green, 20;
  is $color->get_blue, 30;

  $color->set_red(40);
  $color->set_green(50);
  $color->set_blue(60);

  is $color->get_red, 40;
  is $color->get_green, 50;
  is $color->get_blue, 60;

};

subtest 'stringification' => sub {

  my $color = Color->new( 0xff, 0x7f, 0x11 );

  is $color->to_string, "[ ff, 7f, 11 ]";
  is "$color", "[ ff, 7f, 11 ]";
  note "color = $color";

};

done_testing
