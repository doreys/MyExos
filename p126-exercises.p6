#!/usr/bin/env perl6  

use v6;

# Program: p126-exercises.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-09_03:19:47

my $str="az 12345678900 rrterter";

say ~$0 if $str ~~ /(\d\d\d\d\d\d\d\d\d\d)/;
say ~$0 if $str ~~ /(\d ** 10)/;
say ~$/ if $str ~~ /\d ** 10/;
