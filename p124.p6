#!/usr/bin/env perl6  

use v6;

# Program: p124.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-09_01:12:51

say "Matched $/" if "A12B34D50" ~~ /(\D) {say ~$0} \d\d$/;
say "-" x 10;
say "Matched $/" if "A12B34D50" ~~ /(\D) (\d\d) {say ~$0,"-", ~$1} $/;
say "-" x 10;
