#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p133-153_431.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-29_12:51:54

my $require="aeiou";
# $require="ready";

for "./words.txt".IO.lines -> $word {
	say "$word use ($require) "  if uses-all($word , $require); #,"    "
#	, uses-all2($word , $require);
}

sub uses-only(Str $word, Str $available){
	for 0..$word.chars - 1 -> $idx {
		my $letter = substr $word, $idx, 1;
		return False unless defined index $available, $letter;
	}
	True;
}

sub uses-all ($word,$required){
	return uses-only $required, $word;
}

sub uses-all2 ($word,$required){
	return uses-only $word,$required;
}
