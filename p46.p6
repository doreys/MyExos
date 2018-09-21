#!/usr/bin/env perl6
#
use v6.c;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p46.p6
* Creation Date : Mon Jul 30 21:33:45 2018
* Last Modified : Sat Sep  8 02:09:37 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------


sub plus-three_1(Int $number is copy){ say "++" ~ $number; $number+= 3; say $number; say "-------------"; }
#sub plus-three_2(Int $number){ say "--" ~ $number; $number+= 3; say $number; say "-------------"; }
sub plus-three_3(Int $number is rw){ say "--" ~ $number; $number+= 3; say $number; say "-------------"; }
my $value = 5 ;
say plus-three_1 $value;
#say plus-three_2 $value;
say plus-three_3 $value;
say $value;
