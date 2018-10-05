#!/usr/bin/env perl6


# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : class.p6
* Creation Date : Mon Jul 30 21:33:45 2018
* Last Modified : Sat Sep  8 02:03:17 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------


# Perl 6 version 
use v6.c;

class Foo { has $.i is rw };
   
for 1..1_000_000 -> $i {
	my $obj = Foo.new;
	$obj.i = $i;
}




# Perl 6 version 

use v6.c;

class A {
	has $!x;
	method show-x {
		say $!x;
	}
}
A.new(x => 5).show-x;
