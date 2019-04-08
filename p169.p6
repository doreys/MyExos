#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p169.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-09-29_11:25:28

my @letters = 'a'..'e' ; 
say @letters.kv ; 

for @letters.kv -> $a,$b {
	say "$a -> $b" ; 
}
say "-" x 6 ;
for @letters {
	say $^a-letter ; 
}
