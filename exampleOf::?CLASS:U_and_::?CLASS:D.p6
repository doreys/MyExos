#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : exampleOf::?CLASS:U_and_::?CLASS:D.p6
* Creation Date : Wed Oct  3 00:38:16 2018
* Last Modified : Wed Oct  3 00:38:42 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class C {
    multi method f(::?CLASS:U:) { say "class method"  }
    multi method f(::?CLASS:D:) { say "object method" }
}
C.f;       # OUTPUT: «class method␤»
C.new.f;   # OUTPUT: «object method␤»
