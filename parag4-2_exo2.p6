#!/usr/bin/env perl6

use v6 ;
use MONKEY-SEE-NO-EVAL;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag4-2_exo2.p6
* Creation Date : Thu Sep 27 22:44:34 2018
* Last Modified : Fri Sep 28 00:57:47 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
	try to write gist for Point class.
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

    method gist(){
	    "x: $!x, y: $!y"
    }
}
my $p = Point.new(:x(1), :y(2));
say $p;
my $sérialisé = $p.sérialise;      # méthode fournie par le rôle
say "sérialisé:",$sérialisé;
my $clone-de-p = Point.désérialise($sérialisé);
say "clone de p:",$clone-de-p;
