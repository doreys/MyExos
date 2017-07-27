#!/usr/bin/env perl6

use v6.c;

sub factorial-v1(Int $n where $n >= 0){
	return 1 if $n == 0;
	return $n * factorial-v1 $n -1;
}

subset Non-neg of Int where { $_ >= 0 }

sub factorial-v2(Non-neg $n){
	return 1 if $n == 0;
	return $n * factorial-v2 $n -1;
}

say factorial-v1 3;
say factorial-v2 3;
