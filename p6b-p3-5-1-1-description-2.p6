#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p6b-p3-5-1-1-description-2.p6
* Creation Date : Sat Jun  8 20:48:22 2019
* Last Modified : Sat Jun  8 20:54:41 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

my @nums=1,3,5,9;

say $c;

say "true" if [<] 1, 3, 5, 9;      # "true"

if    [==] @nums { say "Tous les nombres de @nums sont identiques" }
elsif [<]  @nums { say "le tableau @nums est dans un ordre ascendant strict" }
elsif [<=] @nums { say "le tableau @nums est dans un ordre ascendant"}
