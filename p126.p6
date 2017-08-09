#!/usr/bin/env perl6  

use v6;

# Program: p126.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-09_03:16:03

say "Word count = ",$/.elems if "I have a dream" ~~ m:g/ \w+/;
say ~$/[3];
