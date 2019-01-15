#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p6b-p3_parag-1-1-1.p6
* Creation Date : Tue Jan 15 11:43:36 2019
* Last Modified : Tue Jan 15 23:38:53 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------


my $x = 'Abcd';

say $x; # Foocd

$x ~~ s:ii/^../foo/;

say $x; # Foocd

$x = 'ABC';

$x ~~ s:ii/^../foo/;

say $x # FOOC et non FOO
