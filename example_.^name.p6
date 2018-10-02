#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : example_.^name.p6
* Creation Date : Wed Oct  3 00:48:02 2018
* Last Modified : Wed Oct  3 00:48:21 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class Foo {
    method greet($me: $person) {
        say "Hi, I am $me.^name(), nice to meet you, $person";
    }
}
Foo.new.greet("Bob");    # OUTPUT: «Hi, I am Foo, nice to meet you, Bob␤» 
