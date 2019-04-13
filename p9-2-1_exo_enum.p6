#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p9-2-1_exo_enum.p6
* Creation Date : Thu Jan 10 11:04:16 2019
* Last Modified : Thu Jan 10 11:05:15 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

enum Jour ('lun', 'mar', 'mer', 'jeu', 'ven', 'sam', 'dim');

my $x = "aujourd'hui" but Jour::mar;

say $x; # imprime aujourd'hui

say $x.Jour; # imprime mar
