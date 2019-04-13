#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : ConstrainingReturnTypes.p6
* Creation Date : Mon Mar  4 20:47:22 2019
* Last Modified : Mon Mar  4 21:08:43 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

# The code below will not compile
sub foo(Str $name  --> Str) { say "Hello, $name" } # Valid
my $value = foo("hello");
#say $value;
