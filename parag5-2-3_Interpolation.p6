#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag5-2-3_Interpolation.p6
* Creation Date : Wed Oct 10 15:59:49 2018
* Last Modified : Wed Oct 10 16:10:50 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
	New set of tests...
		macbook-pro-de-sdo:tp6 sdo$ ./parag5-2-3_Interpolation.p6
			2
			[toto titi]
			[toto titi]
			1
]
# ------------------------------------------------------

sub a($scalaire1, @liste, $scalaire2) {
    say $scalaire2;
    say @liste;
    say @liste[];
    say $scalaire1;
}

my @liste = "toto", "titi";
a(1, @liste, 2); # imprime 2
