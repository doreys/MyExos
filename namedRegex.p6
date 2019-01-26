#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : namedRegex.p6
* Creation Date : Sat Jan 26 22:02:06 2019
* Last Modified : Sat Jan 26 22:08:00 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
True
False
True
｢Tokens won't backtrack, which makes them fail q｣
｢Tokens won't backtrack, which makes them fail q｣
 0 => ｢Tokens won't backtrack, which makes them fail q｣
]
# ------------------------------------------------------

my regex works-but-slow { .+ q }
my token fails-but-fast { .+ q }
my $s = 'Tokens won\'t backtrack, which makes them fail quicker!';
say so $s ~~ &works-but-slow; # OUTPUT: «True␤»
say so $s ~~ &fails-but-fast; # OUTPUT: «False␤»
                              # the entire string get taken by the .+
say so $s ~~ m/(.+ q)/;
say $0;
say $s ~~ m/(.+ q)/;
