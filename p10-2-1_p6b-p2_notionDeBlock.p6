#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p10-fci.p6
* Creation Date : Sun Jan 13 15:20:00 2019
* Last Modified : Sun Jan 13 15:20:12 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

sub fonction {
    for 1..10 -> $x {
        say $x;
        return if $x == 5;
    }
    say 15;
}
fonction(); # imprime les chiffres de 1 à 5, mais n'imprime pas 15
