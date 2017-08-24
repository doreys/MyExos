#!/usr/bin/env perl6  

use v6 ; 

# Program: p142-exo.8-1.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-24_19:03:41

my $data = "./words.txt".IO.slurp ; 
for "./words.txt".IO.lines -> $w {
	say "---->", $w , " ", $w.chars if $w.chars > 20;
}
