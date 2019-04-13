#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag3-2-Description_p6b.p6
* Creation Date : Sat Oct  6 21:58:39 2018
* Last Modified : Sat Oct  6 22:16:36 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
illustration des erreurs on ne s'attend pas à ce que cela marche.
]
# ------------------------------------------------------

my Numeric $x = 3.4;  # $x ne peut prendre que des valeurs numériques
my Int @a = 1, 2, 3;  # tableau d'entiers
@a[1] = 1.1;          # ERREUR: "Type check failed in assignment..."
say @a;
$x = "toto"           # ERREUR: "Type check failed in assignment..."
