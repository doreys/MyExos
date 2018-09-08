#!/usr/bin/env perl6

use v6.c;


# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p102.p6
* Creation Date : Mon Jul 30 21:33:45 2018
* Last Modified : Sat Sep  8 02:06:01 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

sub gcd(Int $dd,Int $dr){
	say 'dividende:',$dd,' diviseur:',$dr;
	my $r = $dd div $dr;
	my $t = $dd - ($r * $dr);
	gcd($dr,$t) if $t != 0;
	say $dr if $t == 0;
}

gcd(108,30);
