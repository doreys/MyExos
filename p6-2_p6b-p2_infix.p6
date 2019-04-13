#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p6-2_p6b-p2_infix.p6
* Creation Date : Mon Dec 31 14:38:43 2018
* Last Modified : Mon Dec 31 14:44:52 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

multi sub prefix:<%> (Int $x) { # opérateur double

	 2 * $x;

 }

 say % 35; # imprime 70

 multi sub prefix:<deux_fois> (Int $x) {

	  2 * $x;

  }

  say deux_fois 35; # imprime 70
