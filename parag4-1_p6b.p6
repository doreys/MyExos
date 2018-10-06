#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag4-1_p6b.p6
* Creation Date : Sat Oct  6 23:28:45 2018
* Last Modified : Sat Oct  6 23:28:58 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

if $pourcent > 100  {
    say "drôle d'arithmétique";
}
for 1..3 {
    # utilise $_ comme variable de boucle
    say 2 * $_;
}
for 1..3 -> $x {
    # variable de boucle explicite
    say 2 * $x;
}

while $chose.is_wrong {
    $chose.essaie_de_corriger;
}

die "Access denied" unless $password eq "Secret";
