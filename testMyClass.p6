#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : testMyClass.p6
* Creation Date : Fri Jul  6 16:29:40 2018
* Last Modified : Fri Jul  6 17:22:38 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class P {
	has $.p = 1 ;
	has $!k = 1 ;

	method print() { say $!p ~ " " ~ $!k; }
	method increase() { $!p++;$!k++;}
}

my $f = P.new( p => 2, k => 4);

$f.print(); 
$f.increase(); 
$f.print(); 
#say $f.p;
#say $f.print();
