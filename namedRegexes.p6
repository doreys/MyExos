#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : namedRegexes.p6
* Creation Date : Tue Oct 16 00:11:21 2018
* Last Modified : Tue Oct 16 00:48:05 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

my regex number { \d+ [ \. \d+ ]? }

say so "32.51" ~~ &number;                         # OUTPUT: «True␤»
say so "15 + 4.5" ~~ /<number>\s* '+' \s*<number>/ ;# OUTPUT: «True␤»


my regex works-but-slow { .+ q }
my token fails-but-fast { .+ q }
my $s = 'Tokens won\'t backtrack, which makes them fail quicker!';
say so $s ~~ &works-but-slow; # OUTPUT: «True␤»
say so $s ~~ &fails-but-fast; # OUTPUT: «False␤»
                              # the entire string get taken by the .+

my token tok-a { .* d  };
my token tok-b { .* d | bd };
say so "bd" ~~ &tok-a;        # OUTPUT: «False␤»
say so "bd" ~~ &tok-b;        # OUTPUT: «True␤»
