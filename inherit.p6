#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : inherit.p6
* Creation Date : Thu Jul 19 12:40:46 2018
* Last Modified : Thu Jul 19 22:59:01 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class A {
	has $.b;
	method n($getClassName:) { $getClassName.^name() }
}

class B is A {
	has $.b;
	method p{ A.b,self.b}
}

say B.new(A.b=>1,b=>2).p;
