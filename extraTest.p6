#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : extraTest.p6
* Creation Date : Mon Oct 15 03:16:11 2018
* Last Modified : Mon Oct 15 03:32:59 2018
* Email Address : sdo@MacBook-Pro-de-SDO.local
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

my @tableau = 1, (2, 3), 4;
#[1 (2 3) 4]
say @tableau.elems;
#3

my @tableau2 = <a b c> Z <1 2 3>;
for @tableau2 -> $paire {
    say "premier: $paire[0]  second: $paire[1]"
}
my @tableau3 = <a b c> Z <1 2 3>.flat;
say @tableau3;
