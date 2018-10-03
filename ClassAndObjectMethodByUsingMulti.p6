#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : ClassAndObjectMethodByUsingMulti.p6
* Creation Date : Wed Oct  3 22:02:40 2018
* Last Modified : Wed Oct  3 22:05:22 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class B {
	multi method f(::?CLASS:U:){ say "Class method"; }
	multi method f(::?CLASS:D:){ say "Object method"; }
}

B.f;
B.new.f;
