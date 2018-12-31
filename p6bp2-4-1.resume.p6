#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p6bp2-4-1.resume.p6
* Creation Date : Mon Dec 17 13:20:53 2018
* Last Modified : Mon Dec 17 13:26:20 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

# opérateurs binaires (bit à bit)
# note: 5 vaut 0b0101 et 3 vaut 0b0011
say 5   +| 3;       # 7 (0b111)
say 5   +^ 3;       # 6 (0b110)
say 5   +& 3;       # 1 (0b001)
say "b" ~| "d";     # 'f'

# Concaténation de chaînes de caractères
say 'a' ~ 'b';      # 'ab'

# tests de fichiers
if '/etc/passwd'.path ~~ :e { say "le fichier existe" }

# répétition
say 'a' x 3;        # 'aaa'
say 'a' xx 3;       # 'a', 'a', 'a'

# opérateur conditionnel ternaire
my ($a, $b) = 2, 2;
say $a == $b ?? 2 * $a !! $b - $a; # imprime 4

# comparaisons en chaîne
my $angle = 1.41;
if 0 <= $angle < 2 * pi { ... }
