#!/usr/bin/env perl6 

use v6.c;


# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : testClass.p6
* Creation Date : Mon Jul 30 21:33:45 2018
* Last Modified : Sat Sep  8 01:59:59 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class Hello {
	has $.mo;

	method mprint(){
		say "--->$.mo\n";
		return;
	}
}

my $u = Hello.new(mo => "hello");
$u.mprint();
