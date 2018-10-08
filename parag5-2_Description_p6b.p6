#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag5-2_Description_p6b.p6
* Creation Date : Mon Oct  8 13:12:58 2018
* Last Modified : Mon Oct  8 13:19:52 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

sub essaie-de-modifier($toto) {
    # Oui, les traits d'union sont permis dans le nom des fonctions
    $toto = 2;       # interdit
}

my $x = 2;
sub modifie($toto is rw) {
    $toto = 0;       # autorisé
}
modifie($x); say $x; # imprime: 0

sub quox($toto is copy){
    $toto = 3;
}
quox($x); say $x     # à nouveau 0

sub fonction1($x, $y?) {
    if $y.defined {
        say "Le second paramètre a été fourni et défini";
    }
}

sub fonction2($x, $y = 2 * $x) {
    # ...
}
