#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p162.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-31_03:02:53

my @even-digits = 0,2,4,6,8 ; 
say @even-digits ; 
my @small-even_digits = @even-digits[0..2] ; 
say @small-even_digits ; 
my @min-max-even-digits = @even-digits[0,4] ; 
say @min-max-even-digits ; 
my @reverse-small-even_digits = @even-digits[reverse 0..2] ; 
say @reverse-small-even_digits ; 
my @reverse-small-even_digits2 = reverse @even-digits[0..2] ; 
say @reverse-small-even_digits2 ; 
my @even-digits2 = 0,2,2,6,8 ; 
@even-digits2[2] = 4 ; 
say @even-digits2 ; 
my @odds = 1, 3, 5 ; 
@odds[3] = 7 ; 
say @odds ; 
my @nums = 1..5 ; 
say @nums ; 
say @nums.elems ; 
say elems @nums ; 
say @nums.end ; 
