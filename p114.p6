#!/usr/bin/env perl6  

use v6;

# Program: p114.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-03_22:11:18

say "-" x 6;
say "I have a dream".words.perl;
say "-" x 6;
say "I have a dream".words;
say "-" x 6;
.say for "I have a dream".words;
say "-" x 6;
say "I have a dream".words.join("|");
say join "+", words "I have a dream";
