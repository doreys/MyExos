#!/usr/bin/env perl6  

use v6 ; 

# Program: p141.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-24_15:46:35

spurt "./hello2.txt","line added\n" ; 
spurt "./hello2.txt","line added\n",:append ; 
my $data = slurp "./hello2.txt" ; 
say $data ; 
