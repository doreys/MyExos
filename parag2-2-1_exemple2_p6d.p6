#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag2-2-1_exemple2_p6d.p6
* Creation Date : Fri Oct  5 15:22:49 2018
* Last Modified : Fri Oct  5 15:24:15 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

my $pi #`{{{
Commentaire multiligne:
Ce commentaire est ouvert avec 3 accolades ouvrantes.
Il faut le fermer avec trois accolades fermantes }.
 }}} = 3.14159;
say "Pi is: $pi";

my $e #`{[
Commentaire multiligne:
Ce commentaire est ouvert avec une accolade {
et un crochet.
Il faut le fermer avec un crochet fermant ]
et une accolade fermante }.
 Ainsi: ]} = 2.71828;
say "e vaut: $e";

my $nb_or = #`({
Autre commentaire multiligne.
On a ouvert avec une parenthese ( et une
accolade {, on ferme avec une accolade }
et une parenthese ), comme suit: }) 1.618;
say "Le nombre d'or est: $nb_or";
