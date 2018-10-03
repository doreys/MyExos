#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : type-constrain-examples.p6
* Creation Date : Wed Oct  3 21:20:50 2018
* Last Modified : Wed Oct  3 21:22:26 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
results gotten:
	Type check failed in binding to parameter '$n'; expected Positive-integer but got Rat (2.5)
	  in sub divisors at ./type-constrain-examples.p6 line 21
	  in block <unit> at ./type-constrain-examples.p6 line 22
]
# ------------------------------------------------------

subset Positive-integer of Int where * > 0;
sub divisors(Positive-integer $n) { $_ if $n %% $_ for 1..$n };
divisors 2.5; # ERROR «Type check failed in binding to parameter '$n'; expected Positive-integer but got Rat (2.5) $n)»
divisors -3; # ERROR: «Constraint type check failed in binding to parameter '$n'; expected Positive-integer but got Int (-3)»
