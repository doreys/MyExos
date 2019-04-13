#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p6bp2-4-4-3_L_opérateur_croix.p6
* Creation Date : Mon Dec 17 21:01:55 2018
* Last Modified : Mon Dec 17 21:03:16 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

my @a = 1, 2;
my @b = 3, 4;
my @c = @a X @b;  # (1,3), (1,4), (2,3), (2,4)
say @c;

@a = 3, 4;
@b = 6, 8;
say @a X* @b;    # imprime 18 24 24 32
