#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag6-1-1_p6b.p6
* Creation Date : Thu Oct 11 23:49:07 2018
* Last Modified : Thu Oct 11 23:49:36 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class SomeClass {
    # ces 2 méthodes ne font rien d'autre que retourner l'invocateur
    method foo {
        return self;
    }
    method bar(SomeClass $s: ) {
        return $s;
    }
}
my SomeClass $x .= new;
$x.foo;          # même chose que $x
$x.bar;          # pareil
$x.foo.bar ;     # idem
