#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p6b-p3-5-1-1_description.p6
* Creation Date : Sun Jun  2 20:27:25 2019
* Last Modified : Sun Jun  2 20:27:43 2019
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
