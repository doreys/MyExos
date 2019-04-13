#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : newTestRegexp.p6
* Creation Date : Sat Oct 13 20:11:45 2018
* Last Modified : Sat Oct 13 20:22:10 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

if 'abc' ~~ /(a) b (c)/ {
    say "0: $0; 1: $1";             # OUTPUT: «0: a; 1: c␤»
}

if 'abc' ~~ /(a) b (c)/ {
    say $/.list.join: ', '  # OUTPUT: «a, c␤»
}

if 'abc' ~~ /(a(b)) (c)/ {
    say "$/[0]"; # doit afficher ab contenu premiere parenthèse externe
    say "$/[0][0]"; # doit afficher b contenu premiere parenthèse dans premiere parenthèse
    say "$/[1]"; # doit afficher c contenu seconde parenthèse externe
    say $/.list.join: ', '  # OUTPUT: «a, c␤»
}
