#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag4-2-1_Application_de_rôle.p6
* Creation Date : Fri Sep 28 21:50:22 2018
* Last Modified : Fri Sep 28 21:50:37 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class Taureau {
    has Bool $.castré = False;
    method mène {
        # Mène votre taurillon au vétérinaire pour le châtrer
        $!castré = True;
        return self;
    }
}
class Automobile {
    has $.direction;
    method mène ($!direction) { }
}
class Taurus is Taureau is Automobile { }

my $t = Taurus.new;
$t.mène; # Castre $t
