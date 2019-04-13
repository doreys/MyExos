#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p11-2-2_p6b-p2_porteeLexicale.p6
* Creation Date : Sun Jan 13 15:28:46 2019
* Last Modified : Sun Jan 13 15:29:03 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

use v6;

my @liste = 1..10;
while my $i = shift @liste {
    last if $i > 4;
    say "La valeur du compteur dans la boucle est $i";
}
say "Valeur du compteur hors de la boucle: $i";


