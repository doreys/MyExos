#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : testIsaCigilWhat.p6
* Creation Date : Thu Sep 13 01:11:31 2018
* Last Modified : Thu Sep 13 01:17:53 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

sub f(Int $x) {
    if $x.WHAT === Int {
        say 'Vous avez passé un Int';
    }
    else {
        say 'Vous avez passé un sous-type de Int';
    }
    say "Isa";
    if $x.isa(Int) {
        say 'Vous avez passé un Int';
    }
    else {
        say 'Vous avez passé un sous-type de Int';
    }
}

f(12);

my Int $i = 5;
say "Compatible avec réel" if $i ~~ Real; # Int est sous-type de Real
# -> "Compatible avec réel" (Int hérite des méthodes de Real)
