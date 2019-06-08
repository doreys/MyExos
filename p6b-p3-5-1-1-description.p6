#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p6b-p3-5-1-1-description.p6
* Creation Date : Sat Jun  8 20:48:22 2019
* Last Modified : Sat Jun  8 20:55:45 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

sub fact(Int $x){
    [*] 1..$x; # NB: espace nécessaire entre '[*]' et liste de valeurs
}
my $c = fact(10);     # 3628800
say $c;
