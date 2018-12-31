#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p5-2-3_p6b-p2_eager.p6
* Creation Date : Mon Dec 31 14:10:37 2018
* Last Modified : Mon Dec 31 14:34:57 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

# my @list = eager map { $bloc_ayant_des_effets_de_bord }, @list;

multi sub postfix:<!>(Int $x) {

	 my $factorielle = 1;

	  $factorielle *= $_ for 2..$x;

	   return $factorielle;

   }

   say 5!; # imprime 120
