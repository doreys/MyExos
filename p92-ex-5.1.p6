#!/usr/bin/env perl6

use v6.c;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p92-ex-5.1.p6
* Creation Date : Mon Jul 30 21:33:45 2018
* Last Modified : Sat Sep  8 02:12:27 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------


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
