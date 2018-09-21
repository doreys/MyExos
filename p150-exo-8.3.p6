#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p150-exo-8.3.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-26_13:15:08

say "Enter a series of letters:";
my $sofl=$*IN.get;

for "./words.txt".IO.lines -> $one_word {
	say "		avoid($sofl) --->$one_word ", avoids($one_word,$sofl), " ", avoids2($one_word,$sofl); 
}

sub avoids(Str $word,Str $sofl){
	return False if $word ~~ / <-[$sofl]> /;
	return True;
}

sub avoids2(Str $word,Str $sofl){
	return True if $word ~~ / <[$sofl]> /;
	return False;
}
