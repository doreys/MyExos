#!/usr/bin/env perl6

use v6.c;

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
