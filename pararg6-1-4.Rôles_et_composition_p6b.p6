#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : pararg6-1-4.Rôles_et_composition_p6b.p6
* Creation Date : Fri Oct 12 19:08:30 2018
* Last Modified : Fri Oct 12 19:09:59 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

role Dessinable {
    has $.couleur is rw;
    method dessiner { ... }
}
class Forme {
    method aire { ... }
}

class Rectangle is Forme does Dessinable {
    has $.largeur;
    has $.hauteur;
    method aire {
        $!largeur * $!hauteur;
    }
    method dessiner() {
        for 1..$.hauteur {
            say 'x' x $.largeur;
        }
    }
}

Rectangle.new(largeur => 8, hauteur => 3).dessiner;
