#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag2-2-2-p6b.p6
* Creation Date : Fri Oct  5 21:04:21 2018
* Last Modified : Fri Oct  5 21:04:43 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

my $scalaire = 6;
my @tableau = 1, 2, 3;
say "Perl $scalaire";         # imprime: 'Perl 6'
say "Un @tableau[]";          # imprime: 'Un 1 2 3'
say "@tableau[1]";            # imprime: '2'
say "Code: { $scalaire * 2 }" # imprime: 'Code: 12'
