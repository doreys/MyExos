#!/usr/bin/env perl6  

use v6;

# Program: p124-Alternation.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-09_01:56:05

my $string = "red";
say 'Is a JPEG color' if $string ~~ /^ [red | green | blue] $/;
say "-" x 10;
say ~$/ if "abcdef" ~~ /ab || abcde/;
say "-" x 10;
say ~$/ if "abcdef" ~~ /ab | abcde/;
say "-" x 10;
say ~$/ if "abcdef" ~~ /ab | bcde/;
