#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p130-150_431-8.4.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-28_22:49:57


test("ready") ;

sub test(Str $letters){
	for "./words.txt".IO.lines -> $word {
		say "$word ($letters) " if use-only($word,$letters);
	}
}

sub use-only(Str $word is copy,Str $letters){
	#say ">$word";
	for $letters.comb -> $letter {
#		say "===>$letter";
		$word  ~~ s:g/$letter/\#/;
	}
#	say "+$word";
	return False if $word ~~ m:i/ <[a..z]> /;
	return True ;
}
