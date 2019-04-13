#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag6-1-1-ex2_p6b.p6
* Creation Date : Thu Oct 11 23:55:10 2018
* Last Modified : Thu Oct 11 23:57:37 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class Foo {
    method !private($toto) {
        return "Reçu le param $toto";
    }

    method publique {
        say self!private("foo");
    }
}
my Foo $x .= new;
$x.publique;  # imprime "Reçu le param foo"
