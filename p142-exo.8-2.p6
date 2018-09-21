#!/usr/bin/env perl6  

use v6 ; 

# Program: p142-exo.8-2.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-24_23:13:10

my Int $nl = 0 ; 
my Int $ct = 0 ; 

for "./words.txt".IO.lines -> $word {
	$nl++;
	$ct++ if has-no-e $word ;
}
say "$ct over $nl do not own a 'e' letter witch makes ",$ct*100/$nl,'%';

sub has-no-e(Str $str){
	return True if $str !~~ m:i/e/;
	return False;
}
