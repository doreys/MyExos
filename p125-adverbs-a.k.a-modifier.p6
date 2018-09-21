#!/usr/bin/env perl6  

use v6;

# Program: ./p125-adverbs-a.k.a-modifier.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-09_03:01:48

say 'AB' ~~ /ab/;
say so 'AB' ~~ /ab/;
say so 'AB' ~~ /:i Ab/;
say so 'AB' ~~ m:i/ Ab/;
say so 'AB' ~~ / A :i b/;
say so 'aB' ~~ / A :i b/;
