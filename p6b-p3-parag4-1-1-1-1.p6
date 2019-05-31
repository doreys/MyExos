#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p6b-p3-parag4-1-1-1-1.p6
* Creation Date : Fri May 31 22:49:16 2019
* Last Modified : Fri May 31 22:49:38 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

my $gourmandise = "miel";
my @liste = Q :w :s/lait toast $gourmandise barres\nobliques\tinverses\nbizarres/;
say @liste[*-1];     # imprime : barres\nobliques\tinverses\nbizarres
say @liste[2];       # imprime : miel
