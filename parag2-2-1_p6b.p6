#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag2-2-1_p6b.p6
* Creation Date : Fri Oct  5 13:51:15 2018
* Last Modified : Fri Oct  5 13:51:27 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

# commentaire uniligne, le compilateur ignore le code de cette ligne

my $pi #`{
Commentaire multiligne:
Ce commentaire est ouvert avec une accolade ouvrante.
Il faut le fermer avec une accolade fermante.
Si on l'avait ouvert avec un crochet ouvrant,
il faudrait le fermer avec un
crochet fermant. } = 3.14159;
say "Pi is: $pi";
