#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p167-exo-anwsers.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-09-13_20:56:38

sub my-pop (@array where @array > 0) {
	say "---->",@array.end ; 
	my @result = splice @array, @array.end, 1;
	return @result[0];
}

my @letters = 'a'..'j';
my $letter = my-pop @letters;
say $letter;             # -> j
say @letters;            # -> [a b c d e f g h i]

