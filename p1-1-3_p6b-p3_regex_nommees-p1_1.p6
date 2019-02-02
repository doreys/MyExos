#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p1-1-3_p6b-p3_regex_nommees-p1_1.p6
* Creation Date : Sat Feb  2 16:00:56 2019
* Last Modified : Sat Feb  2 16:05:02 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
	taken from https://docs.perl6.org/language/regexes to understand regex.

	prints: 
		｢abc｣
		Match
		/.+/
		Regex
]
# ------------------------------------------------------


my $match;
$_ = "abc";
$match = m/.+/; say $match; say $match.^name; # OUTPUT: «｢abc｣␤Match␤»
$match =  /.+/; say $match; say $match.^name; # OUTPUT: «/.+/␤Regex␤»
