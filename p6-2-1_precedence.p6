#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p6-2-1_precedence.p6
* Creation Date : Tue Jan  1 23:02:42 2019
* Last Modified : Tue Jan  1 23:03:20 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

multi sub infix:<double_somme> (Int $x, Int $y) is equiv(&infix:<+>) {
     2 * ($x + $y)
}
say 4 double_somme 5;      # imprime 18

multi sub infix:«3s» (Int $x, Int $y) is equiv(&infix:<*>) {
     3 * ($x + $y)
}
say 9 3s 5;               # imprime 42
