#!/usr/bin/env perl6

use v6.c;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p3.6-print-speech.p6
* Creation Date : Mon Jul 30 21:33:45 2018
* Last Modified : Sat Sep  8 02:08:31 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------


sub print-speech(){
	say "Let freedom ring from the prodigious hilltops of New Hampshire.";
	say "Let freedom ring from the mighty mountains of New York.";
}

sub print-twice($value){
	say $value;
	say $value
}

sub repeat-speech(){
	print-speech();
	print-speech();
}

sub contact_twice($part1,$part2){
	my $concatenation =$part1 ~ $part2;
	print-twice($concatenation);
}

repeat-speech();
print-twice("Let freedom ring");
print-twice("Let freedom ringssssss" x 3);
print-twice(42);
contact_twice("part1","part2");
