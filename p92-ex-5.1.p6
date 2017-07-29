#!/usr/bin/env perl6

use v6.c;

sub b(Int $z){
	my $prod= a($z,$z);
	say $z, " " , $prod;
	return $prod;
}

sub a(Int $x is copy, Int $y){
	$x++;
	return $x * $y;
}

sub c(Int $x, Int $y, Int $z){
	my $total = $x + $y + $z;
	my $square = b($total) ** 2 ;
	return $square;
}

my $x = 1;
my $y = $x + 1;
say c($x, $y + 3, $x + $y);
