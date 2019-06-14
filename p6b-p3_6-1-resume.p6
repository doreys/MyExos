#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p6b-p3_6-1-resume.p6
* Creation Date : Fri Jun 14 18:19:39 2019
* Last Modified : Fri Jun 14 18:21:07 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

for <a b> X 1..3 -> $a, $b {
    print "$a: $b   ";
}
# imprime: a: 1  a: 2  a: 3  b: 1  b: 2  b: 3
say "";

.say for <a b c> X 1, 2;
# imprime: a 1 a 2 b 1 b 2 c 1 c 2
# (avec chaque élément à la ligne)
