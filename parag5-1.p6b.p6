#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag5-1.p6b.p6
* Creation Date : Mon Oct  8 11:34:19 2018
* Last Modified : Mon Oct  8 11:35:18 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

# sub sans signature, à la Perl 5
sub imprime_arguments {
    say "Arguments:";
    for @_ {
        say "\t$_";
    }
}

# Signature avec une arité et des types immuables:
sub distance(Int $x1, Int $y1, Int $x2, Int $y2) {
    return sqrt ($x2-$x1)**2 + ($y2-$y1)**2;
}
say distance(3, 5, 0, 1);

# Arguments par défaut
sub logarithme($nombre, $base = 2.7183) {
    return log($nombre) / log($base)
}
say logarithme(4);       # Utilise le second argument par défaut
say logarithme(4, 2);    # Second argument explicite

# arguments nommés
sub fais_le(:$quand, :$quoi) {
    say "doing $quoi at $quand";
}
fais_le(quoi => 'machin', quand => 'tout de suite');  # fait machin tout de suite
fais_le(:quand<midi>, :quoi('bidule')); # 'fait bidule à midi'
# illégal: fais_le("truc", "now")
