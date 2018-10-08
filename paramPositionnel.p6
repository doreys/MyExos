#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : paramPositionnel.p6
* Creation Date : Tue Oct  9 00:23:03 2018
* Last Modified : Tue Oct  9 00:29:50 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
	Transformer param de sorte qu'il utilise une autre forme de paramètres només
]
# ------------------------------------------------------

multi sub param (:$Un, :$Deux, :$Trois) {
  say ("  Parametre Un : $Un.");
  say ("  Parametre Deux : $Deux.");
  say ("  Parametre Trois : $Trois.");
}
multi sub param (:chiffre1($Un), :chiffre2($Deux), :chiffre3($Trois)) {
  say ("  Parametre Un : $Un.");
  say ("  Parametre Deux : $Deux.");
  say ("  Parametre Trois : $Trois.");
}
say "Premier appel.";
param(Un => 1, Deux => 2, Trois => 3);
say "Second appel.";
param(Un => 1, Trois => 3, Deux => 2);
say "Troisieme appel.";
param(chiffre1 => 5, chiffre3 => 4, chiffre2 => 2);
