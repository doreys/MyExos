#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag6-1-2.Attributs_p6b.p6
* Creation Date : Fri Oct 12 00:30:59 2018
* Last Modified : Fri Oct 12 00:36:22 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class SomeClass {
    has $!a;
    has $.b;
    has $.c is rw;

    method set_stuff {
        $!a = 1;    # OK, écriture dans l'attribut depuis la classe
        $!b = 2;    # idem
        $.b = 3;    # ERREUR, ne peut écrire sur un accesseur RO
    }

    method do_stuff {
        # on peut utiliser le nom public ou le nom privé
        # $!b et $.b sont vraiment la même chose
        return $!a + $!b + $!c;
    }
}
my $x = SomeClass.new;
#say $x.a;       # ERREUR!
say $x.b;       # OK
$x.b = 2;       # ERREUR!
$x.c = 3;       # OK
#say $x.a;       # ERREUR!
say $x.b;       # OK
