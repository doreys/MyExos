#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : testFacultativeParameter.p6
* Creation Date : Mon Oct  8 23:26:57 2018
* Last Modified : Mon Oct  8 23:38:40 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
		1*2=2
		1
		4*3=12
]
# ------------------------------------------------------

multi sub a($a,$b){ "$a*$b={{$a*$b}}";}
multi sub a($a,$b?){ (defined $b) ?? "$a*$b={{$a*$b}}"!!"$a";}
multi sub b($a,$c?=3){ (defined $c) ?? "$a*$c={{$a*$c}}"!!"$a";}

say a(1,2);
say a(1);
say b(4);
