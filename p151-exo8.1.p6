#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p151-exo8.1.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-26_17:46:59


for "./words.txt".IO.lines -> $word {
	print "$word  ";
	say  has-no-e($word) ; 
}

sub has-no-e(Str $word){
	return True unless defined index $word,"e" ; 
	return False ; 
}
