#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p6bp2.5.0.p6
* Creation Date : Tue Dec 18 13:24:34 2018
* Last Modified : Tue Dec 18 13:27:00 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

my @integers = 1..*; for @integers -> $i {

	say $i;

	last if $i % 17 == 0;

}
