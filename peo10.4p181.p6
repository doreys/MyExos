#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: peo10.4p181.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2018-02-11_15:40:31

sub rotate-one-letter (Str $letter, Int $shift) {

	my $last = 'z'.ord; # last lower-case letter

	my $rotated-ord = $letter.ord + $shift;

	if $letter ~~ /<[a..z]>/ {

		$rotated-ord -= 26 if $rotated-ord > $last;

	} else {

		return $letter;

	}

	return $rotated-ord.chr;

}

sub rotate-one-word (Str $word, Int $shift) {

	my $rotated-word = "";

	for 0..$word.chars - 1 {

		$rotated-word ~= rotate-one-letter substr($word, $_, 1), $shift;

	}

	return $rotated-word;

}

my %words = map { $_ => 1}, 'words.txt'.IO.lines;

for %words.keys -> $string {

	for 1..13 -> $shift {

		my $rotated = rotate-one-word $string, $shift;

		say " $string and $rotated are shifted by $shift"

		if %words{$rotated}:exists;

	}

}

