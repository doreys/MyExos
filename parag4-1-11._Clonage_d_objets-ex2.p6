#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag4-1-11._Clonage_d_objets-ex2.p6
* Creation Date : Wed Sep 26 13:50:35 2018
* Last Modified : Wed Sep 26 13:55:25 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class A {
    has $.a;
    #...
    method clone {
        nextwith(:a($.a.clone))
    }
}

class B is A {
    has $.b;
    #...
    method clone {
        my $obj = callsame;
        $obj.b = $!b.clone(:seed($obj.a.generate_seed));
        $obj
    }
}
