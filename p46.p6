#!/usr/bin/env perl6
#
use v6.c;

sub plus-three_1(Int $number is copy){ say "++" ~ $number; $number+= 3; say $number; say "-------------"; }
#sub plus-three_2(Int $number){ say "--" ~ $number; $number+= 3; say $number; say "-------------"; }
sub plus-three_3(Int $number is rw){ say "--" ~ $number; $number+= 3; say $number; say "-------------"; }
my $value = 5 ;
say plus-three_1 $value;
#say plus-three_2 $value;
say plus-three_3 $value;
say $value;
