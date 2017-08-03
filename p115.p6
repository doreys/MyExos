#!/usr/bin/env perl6  

use v6;

# Program: p115.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-03_23:14:27

my $index = 0;
my $fruit = "banana";
while $index < $fruit.chars {
	my $letter = substr $fruit, $index, 1;
	say $letter;
	$index++;
}

say "-" x 10;

for $fruit.comb -> $v {
	say $v;
}

say "-" x 10;

my $fr=$fruit.comb;

for 0..$fruit.chars-1 -> $l {
	say $fr[$l];
}

say "-" x 10;

for 0..$fruit.chars-1 -> $l {
	say substr $fruit,$l,1;
}
