#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag4-2.p6
* Creation Date : Thu Sep 27 22:44:34 2018
* Last Modified : Thu Sep 27 22:44:46 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

role Sérialisable {
    method sérialise() {
        self.perl;        # forme très primitive de sérialisation
    }
    method désérialise($buffer) {
        EVAL $buffer;     # opération inverse de .perl
    }
}

class Point does Sérialisable {
    has $.x;
    has $.y;
}
my $p = Point.new(:x(1), :y(2));
my $sérialisé = $p.sérialise;      # méthode fournie par le rôle
my $clone-de-p = Point.désérialise($sérialisé);
say $clone-de-p.x;        # -> 1
