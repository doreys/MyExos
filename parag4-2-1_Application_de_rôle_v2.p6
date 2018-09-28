#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag4-2-1_Application_de_rôle_v2.p6
* Creation Date : Fri Sep 28 21:55:34 2018
* Last Modified : Fri Sep 28 21:58:10 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

role Taurin {
    has Bool $.castré = False;
    method mène {
        # Mène votre taurillon au vétérinaire pour le châtrer
        $!castré = True;
        return self;
    }
}
role Menable {
    has Real $.direction;
    method mène (Real $d = 0) {
        $!direction += $d;
    }
}
class Taurus does Taurin does Menable {
    method mène ($direction?) {
        self.Menable::mène($direction?)
    }
}
