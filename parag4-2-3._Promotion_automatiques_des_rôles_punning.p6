#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag4-2-3._Promotion_automatiques_des_rôles_punning.p6
* Creation Date : Sat Sep 29 12:44:42 2018
* Last Modified : Sat Sep 29 12:45:03 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

role Point {
    has $.x;
    has $.y;
    method abs { sqrt($.x * $.x + $.y * $.y) }
}
say Point.new(x => 6, y => 8).abs;
