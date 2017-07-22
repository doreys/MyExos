#!/usr/bin/env perl6

use v6.c;

sub right-justify($input-string){
	return ' ' x (70 - $input-string.chars) ~ $input-string;
}

say right-justify("hello world");
