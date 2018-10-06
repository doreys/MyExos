#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag3-1.Exemples_p6b.p6
* Creation Date : Sat Oct  6 21:52:44 2018
* Last Modified : Sat Oct  6 21:53:20 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

my Int $x = 3;
say $x.WHAT;        # 'Int()' ou (Int)

# vérification d'un type:
if $x ~~ Int {
    say '$x contient un entier'
}
$x = "toto";        # erreur!
