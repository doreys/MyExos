#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: parag11.15.1-list-datastructure.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2018-04-25_10:22:13

sub add-to-stack (Pair $stack-top, $item) {
	my $new-pair = $item => $stack-top;
	return $new-pair;
}

sub take-from-stack (Pair $stack-top) {
	my $new-top = $stack-top.value;
	return $stack-top.key, $new-top;
}

sub create-stack ($item) {
	return $item => Nil;
}

my $stack = create-stack (0);
for 1..5 -> $item {
	$stack = add-to-stack($stack, $item);
}
say "The stack is: ", $stack.perl;
for 1..5 {
	my $value;
	($value, $stack) = take-from-stack($stack);
	say "$value -- ", $stack;
}

