#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag6-1.Résumé_p6b.p6
* Creation Date : Thu Oct 11 23:29:13 2018
* Last Modified : Thu Oct 11 23:30:32 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class Forme {
    method aire { ... }    # littéralement trois points '...'
    has $.couleur is rw;
}

class Rectangle is Forme {
    has $.largeur;
    has $.hauteur;

    method aire {
        $!largeur * $!hauteur;
    }
}

my $x = Rectangle.new(
        largeur   => 30.0,
        hauteur  => 20.0,
        couleur  => 'noir',
    );
say $x.aire;            # imprime 600
say $x.couleur;         # imprime 'noir'
$x.couleur = 'bleu';
