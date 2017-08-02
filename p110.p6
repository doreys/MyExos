#!/usr/bin/env perl6  

use v6;

# Program: p110.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-02_18:33:16

my $string="Banana";
my $str=$string.comb;
say $string;
say $str," ", $str.chars," ",$str[1];
say index "banana","na";
say $str.index("na");
say rindex "banana","na";
