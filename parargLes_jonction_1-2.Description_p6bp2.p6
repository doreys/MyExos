#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parargLes_jonction_1-2.Description_p6bp2.p6
* Creation Date : Tue Oct 16 21:30:52 2018
* Last Modified : Tue Oct 16 21:49:16 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

my $x = 4;
if $x == 3|4 {
    say '$x vaut soit 3 soit 4'
}
say ((2|3|4)+7)       # équivalent à 9|10|11 ou any(9, 10, 11)

#`{{{
my Junction $jour_semaine = any <lundi mardi mercredi
                            jeudi vendredi samedi dimanche>
if $jour eq $jour_semaine {
    say "Rendez-vous $jour à 20 h pour dîner";
}
}}}
