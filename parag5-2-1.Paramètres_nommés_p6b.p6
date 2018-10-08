#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag5-2-1.Paramètres_nommés_p6b.p6
* Creation Date : Mon Oct  8 14:02:49 2018
* Last Modified : Mon Oct  8 14:05:27 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

multi sub aire(:$largeur, :$hauteur) {
    return $largeur * $hauteur;
}
multi sub aire(:largeur($l), :hauteur($h)){
    return $l * $h;
}
say aire(largeur => 2,  hauteur => 3); # imprime 6
say aire(largeur => 2, hauteur => 3);
say aire(hauteur => 3, largeur => 2 ); # même chose
say aire(:hauteur(3),  :largeur(2));    # idem
