#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p8-2_p6b-p2_description.p6
* Creation Date : Wed Jan  2 21:36:38 2019
* Last Modified : Wed Jan  2 21:36:55 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------


my $block = { say "$^c $^a $^b" };
$block(1, 2, 3);          # imprime :  3 1 2


