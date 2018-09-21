#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p166.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-09-02_00:16:42

my @fruit = <apple banana pear cherry pineapple orange> ; 
say @fruit ; # [apple banana pear cherry pineapple orange>]
my $removed = @fruit[2]:delete ; 
say $removed ; # -> pear
say @fruit ; # [apple banana (Any) cherry pineapple orange>]

my @digits = < 1 2 3 6 5 4 7 8 9> ; 
@digits[2..4] = 4, 5, 6 ; 
say @digits ; # -> [1 2 4 5 6 4 7 8 9]
my @replacement = 3,4,5;
@digits = < 1 2 3 6 5 4 7 8 9> ; 
my @out_array = splice @digits,3,3,@replacement ; 
say @out_array ; 
say @digits ; # -> [1 2 4 5 6 4 7 8 9]
