#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag5-2-3_Interpolation_p6b.p6
* Creation Date : Wed Oct 10 15:59:49 2018
* Last Modified : Wed Oct 10 23:25:50 2018
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

	New set of tests...
		macbook-pro-de-sdo:tp6 sdo$ ./parag5-2-3_Interpolation.p6
			2
			[toto titi]
			[toto titi]
			1
			cdefgh

	New set of tests...
		macbook-pro-de-sdo:tp6 sdo$ ./parag5-2-3_Interpolation.p6
			2
			[toto titi]
			[toto titi]
			1
			cdefgh
			[1 4]
			14
			bcde
			bcde

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

my @indexes = 1, 4;
say "abcdefgh".substr(@indexes); # pas ce que l'on veut


say @indexes;
say |@indexes;
say "abcdefgh".substr(|@indexes); # imprime bcde
say "abcdefgh".substr(1, 4);      # même chose
