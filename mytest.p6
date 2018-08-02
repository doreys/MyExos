#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : mytest.p6
* Creation Date : Thu Aug  2 14:18:20 2018
* Last Modified : Thu Aug  2 14:18:59 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

role Frais-bancaire { method retire (Rat $retrait) { say "Solde $.solde insuffisant pour retrait de $retrait" and return -1 if $retrait > $.solde;
say "Retrait avec frais"; $.solde -= $retrait + 0.50; # 0,50: frais (codé en dur) return $.solde;
} } class Compte-avec-frais is Compte does Frais-bancaire {};
