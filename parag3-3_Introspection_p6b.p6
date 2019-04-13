#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag3-3_Introspection_p6b.p6
* Creation Date : Sat Oct  6 22:18:41 2018
* Last Modified : Sat Oct  6 22:21:13 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

my Int $x = 4;  # $x ne peut prendre que des valeurs numériques
say "foo".WHAT;     # Str() ou (Str)
if $x ~~ Int {
    say 'La variable $x contient un entier';
}
