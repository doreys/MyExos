#!/usr/bin/env perl6

use v6.c;

sub compare(Int $x, Int $y){
	return 1 if $x > $y;
	return 0 if $x == $y;
	return -1 if $x < $y;
}

say compare 12,2;
