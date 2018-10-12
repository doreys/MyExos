#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag6-1-3_p6b.p6
* Creation Date : Fri Oct 12 19:05:41 2018
* Last Modified : Fri Oct 12 19:06:13 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class Bar { }
class Foo is Bar { }
my Bar $x = Foo.new();   # ok, car Foo ~~ Bar
