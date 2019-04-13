#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag2-2-3-p6b.p6
* Creation Date : Fri Oct  5 21:10:04 2018
* Last Modified : Fri Oct  5 21:10:54 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

my @a = 5, 1, 2;# les parenthèses ne sont plus nécessaires
say @a[0];      # Oui, ça commence avec une @
say @a[0, 2];   # les tranches de tableau fonctionnent comme en Perl 5
my @b = @a.sort;
@b.elems;                   # nombre d'éléments
if @b > 2 { say "yes" }     # fonctionne toujours
@b.end;                     # indice du dernier élément. Remplace $#b
my @c = @b.map({$_ * 2 });  # Oui, map est aussi une méthode.
