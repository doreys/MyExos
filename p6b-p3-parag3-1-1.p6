#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p6b-p3-parag3-1-1.p6
* Creation Date : Thu May 30 21:38:21 2019
* Last Modified : Thu May 30 21:38:33 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

subset Nb_pair of Int where { $_ % 2 == 0 }
# Nb_pair peut maintenant être utilisé comme n'importe quel autre nom de type

my Nb_pair $x = 2;
my Nb_pair $y = 3; # erreur de type
