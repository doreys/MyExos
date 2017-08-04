#!/usr/bin/env perl6  

use v6;

# Program: p118.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-04_22:56:48

say "-" x 10;
say "Matched" if "abcdef" ~~ / bc.e /;
say "-" x 10;
say ~$/ if "abcdef" ~~ / bc.e /;
say "-" x 10;
say $/ if "abcdef" ~~ / bc.e /;
say "-" x 10;
say $/ if "abcabcdef" ~~ / bc.e /; # example of backtracking
