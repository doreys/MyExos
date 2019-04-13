#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : multi_ou_doube.p6
* Creation Date : Tue Jan  1 23:52:24 2019
* Last Modified : Tue Jan  1 23:57:08 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------


sub MAIN ( Int :$nombre_1, Int :$nombre_2 = 2) {
    my $result = $nombre_1 * $nombre_2;
    say $result;
}
