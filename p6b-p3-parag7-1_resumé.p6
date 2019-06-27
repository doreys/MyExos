#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p6b-p3-parag7-1_resumé.p6
* Creation Date : Thu Jun 27 13:37:51 2019
* Last Modified : Thu Jun 27 13:37:59 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

try {
    die "Oh non";

    CATCH {
        say "Il y a eu une erreur: $!";     # $! vaut "Oh non"
    }
}
