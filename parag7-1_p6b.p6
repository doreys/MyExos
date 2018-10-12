#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag7-1_p6b.p6
* Creation Date : Fri Oct 12 19:37:19 2018
* Last Modified : Fri Oct 12 19:37:41 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

my @a = <a b c>;
my $x = @a;
say $x[2];          # c
say (~2).WHAT;      # (Str)
say +@a;            # 3
if @a < 10 { say "petit tableau"; }
