#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag7-2-1.LeContexteDarbre_p6b.p6
* Creation Date : Fri Oct 12 19:53:38 2018
* Last Modified : Fri Oct 12 21:05:45 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
	macbook-pro-de-sdo:tp6 sdo$ ./parag7-2-1.LeContexteDarbre_p6b.p6
		a 1b 2c 3
		[((a 1) (b 2) (c 3))]

	Nouvelles valeurs nouveaux tests
		macbook-pro-de-sdo:tp6 sdo$ ./parag7-2-1.LeContexteDarbre_p6b.p6
			a 2b 2c 3
			[((a 5) (b 2) (c 3))]
			premier: a 5  second: b 2

]
# ------------------------------------------------------

my @a = <a b c> Z <2 2 3>;
say @a.join;         # imprime : a1b2c3
my @t = (<a b c> Z <5 2 3>).tree;
say @t.elems;

for @t -> @paire {
	say "premier: @paire[0]  second: @paire[1]";
}
