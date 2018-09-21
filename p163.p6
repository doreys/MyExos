#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p163.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-31_03:31:25

my @list = <a b c d a f g h> ; 
say @list , " unique filter  ---> ",@list.unique ; 
my @even1 = 0, 2, 4, 6, 8 ; 
my @even2 = reverse 8, 6, 4, 2, 0 ; 

say @even1 eqv @even2 ; # same items, structurally the same

say <1 2 3 4 5> eqv 1..5 ; # same items, structurally different

say <1 2 3 4 5> ~~ 1..5 ; # same items, True

my @array = 1..5 ; # same items, True

say <1 2 3 4 5> ~~ @array ; # same elements, True

say <1 2 3 4 5 6> ~~ @array ; # not the same elements

say <1 2 3 4 5> == <5 6 7 8 9> ; # compares the numbers of items
