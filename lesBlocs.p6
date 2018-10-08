#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : lesBlocs.p6
* Creation Date : Mon Oct  8 16:28:21 2018
* Last Modified : Mon Oct  8 16:28:41 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

my $x = -> $a, $b { say "Argument 1 : $a - Argument 2: $b"; }
$x(10, 20);
$x(3.14159265, 2.71828183);
$x("Un", "Deux");
