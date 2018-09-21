#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p161.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-31_02:50:22

my @heterogeneous-array = 1,2.3,pi,"str",(1, 2, 4);
say @heterogeneous-array;
say @heterogeneous-array.WHAT;
say @heterogeneous-array.elems;
for @heterogeneous-array -> $v {
	say $v, " " , $v.WHAT ; 
}
say <sat sun>[1];
my @weekdays = <mon tue wed thu fri>;
say "The third day is @weekdays[2]";
