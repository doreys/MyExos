#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag2-3.Remarques.p6
* Creation Date : Fri Oct  5 23:32:33 2018
* Last Modified : Fri Oct  5 23:42:56 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

my @a = qw / 1 2 3 4/;  # ERRONÉ: espace après l'opérateur qw
#say @a [2]; # erreur (espace entre l'identifiant et l'indice)
#say @a[2]; # OK, pas d'espace en trop
#my @a = qw / 1 2 3 4/;
say @a\ [2]; # pas d'erreur
