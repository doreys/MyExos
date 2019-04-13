#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : ParamNomé.p6
* Creation Date : Thu Oct 11 01:22:33 2018
* Last Modified : Thu Oct 11 01:24:01 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

sub param (:$Un, :$Deux, :$Trois) {
  say ("  Parametre Un : $Un.");
  say ("  Parametre Deux : $Deux.");
  say ("  Parametre Trois : $Trois.");
}
say "Premier appel.";
param(Un => 1, Deux => 2, Trois => 3);
say "Second appel.";
param(Un => 1, Trois => 3, Deux => 2);
