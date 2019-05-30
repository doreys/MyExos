#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p6b-p3-parag3-1.p6
* Creation Date : Thu May 30 21:31:48 2019
* Last Modified : Thu May 30 21:36:38 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

subset Squares of Real where { .sqrt.Int**2 == $_ };

multi sub square_root(Squares $x --> Int) {
    return $x.sqrt.Int;
}
multi sub square_root(Real $x --> Real) {
    return $x.sqrt;
}
