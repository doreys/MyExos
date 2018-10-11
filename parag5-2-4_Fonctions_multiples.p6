#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag5-2-4_Fonctions_multiples.p6
* Creation Date : Wed Oct 10 23:42:50 2018
* Last Modified : Thu Oct 11 23:12:30 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

multi sub my_substr($str) { ... }                          # 1
multi sub my_substr($str, $start) { ... }                  # 2
multi sub my_substr($str, $start, $end) { ... }            # 3
multi sub my_substr($str, $start, $end, $subst) { ... }    # 4

multi sub util(Str $s) { say "Utilisation de la chaîne $s"  }
multi sub util(Int $i) { say "Utilisation de l'entier $i" }

util("x");      # Utilisation de la chaîne x
util(2);        # Utilisation de l'entier 2
