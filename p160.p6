#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p160.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-31_02:33:39

print "$_ " for 1, 3, 5, 9, "\n";

say ( 1, 3, 5, 7, 9).WHAT;

my @odd_digits = 1, 3, 5, 7, 9;
say @odd_digits.WHAT;

my @single_digit_numbers = 0..9;
say @single_digit_numbers;

my @weekdays = <mon tue wed thu fri>;
my @weekend = <sat sun>;
