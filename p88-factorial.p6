#!/usr/bin/env perl6

use v6.c;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p88-factorial.p6
* Creation Date : Mon Jul 30 21:33:45 2018
* Last Modified : Sat Sep  8 02:11:59 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------


sub factorial-v1(Int $n where $n >= 0){
	return 1 if $n == 0;
	return $n * factorial-v1 $n -1;
}

subset Non-neg of Int where { $_ >= 0 }

sub factorial-v2(Non-neg $n){
	return 1 if $n == 0;
	return $n * factorial-v2 $n -1;
}

say factorial-v1 3;
say factorial-v2 3;
