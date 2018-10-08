#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag4-2-2_BoucleDoublyPointyBlock.p6
* Creation Date : Mon Oct  8 10:56:36 2018
* Last Modified : Mon Oct  8 11:14:54 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

say "début";
my @l=1..10;
for @l <-> $impair,$pair {
	#	say "$impair, $pair";
	say "$impair {{++$impair}}, $pair {{++$pair}}";
}
say $_ for @l;

