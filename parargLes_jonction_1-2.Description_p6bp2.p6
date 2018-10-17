#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parargLes_jonction_1-2.Description_p6bp2.p6
* Creation Date : Tue Oct 16 21:30:52 2018
* Last Modified : Wed Oct 17 21:54:50 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
	Test 1:
		macbook-pro-de-sdo:tp6 sdo$ ./parargLes_jonction_1-2.Description_p6bp2.p6
					$x vaut soit 3 soit 4
					any(9, 10, 11)
					any(True, False)
					any(True, False)
					True
	Test 2:
		macbook-pro-de-sdo:tp6 sdo$ ./parargLes_jonction_1-2.Description_p6bp2.p6
					$x vaut soit 3 soit 4
					any(9, 10, 11)
					any(True, False)
					any(True, False)
					one(True, False)
					all(True, False)
					True

]
# ------------------------------------------------------

my $x = 4;
if $x == 3|4 {
    say '$x vaut soit 3 soit 4'
}
say ((2|3|4)+7);       # équivalent à 9|10|11 ou any(9, 10, 11)

say 25 == (25 | 42);    # OUTPUT: «any(True, False)␤» – Junction
say 25 == any(25 , 42);    # OUTPUT: «any(True, False)␤» – Junction
say 25 == one(25 , 42);    # OUTPUT: 
say 25 == all(25 , 42);    # OUTPUT: 
say 25 ~~ (25 | 42);    # OUTPUT: «True␤»             – Bool



#`{{{
my Junction $jour_semaine = any <lundi mardi mercredi
                            jeudi vendredi samedi dimanche>
if $jour eq $jour_semaine {
    say "Rendez-vous $jour à 20 h pour dîner";
}
}}}

my $j = 1|2;
if 3 == ($j + 1) {
    say 'yes ',$j,' ',$j+1;
}
