#!/usr/bin/env perl6  

use v6;

# Program: p137-exo7-3_Answer.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-23_16:15:49

sub rotate-one-letter(Str $letter, Int $shift){
	my $upper-end = 'Z'.ord; # Last uppercase letter
	my $lower-end = 'z'.ord; # Last lowercase letter

	my $rotated-ord = $letter.ord + $shift;
	if $letter ~~ /<[a..z]>/ { # lowercase
		$rotated-ord -= 26 if $rotated-ord > $lower-end;
	} elsif $letter ~~ /<[A..Z]>/ { # uppercase
		$rotated-ord -= 26 if $rotated-ord > $upper-end;
	} else {
		return $letter;
	}
	return $rotated-ord.chr;
}

sub rotate-one-word(Str $word, Int $shift is copy){
	$shift = $shift % 26;
	$shift = 26 + $shift if $shift < 0;
	my $rotated-word = "";
	for 0..$word.chars - 1 {
		$rotated-word ~= rotate-one-letter substr($word, $_, 1), $shift;
	}
	return $rotated-word;
}

sub rot13 (Str $word){
	return rotate-one-word $word, 13;
}

say rotate-one-word "ABDCabcd", 25;
say rotate-one-word "cheer", 7;
say rotate-one-word "melon", -10;

say rot13("Fbzr cebsnavgl");
