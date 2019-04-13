#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag4-2-1_p6b.p6
* Creation Date : Sat Oct  6 23:39:16 2018
* Last Modified : Sat Oct  6 23:46:05 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

my $mouton = 42;
my $reponse = 42;
if $mouton == 0 {
    say "Comme on s'ennuie";
} elsif $mouton == 1 {
    say "Un mouton solitaire";
} else {
    say "Un troupeau, super!";
}

say "Vous avez gagné!" if $mouton == 42;
say "Vous avez gagné!" if $reponse == 42;

my $c = my $d = my $e = 10;
say "Vrai" if $c == $d == $e;  # imprime Vrai
say "Vrai" if 13 > $c > 7;     # imprime Vrai
