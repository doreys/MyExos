#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : MyClass.p6
* Creation Date : Mon Sep 24 23:48:38 2018
* Last Modified : Mon Sep 24 23:50:58 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
	Illustrate the use of BUILDALL
	Illustrate the use of bless
]
# ------------------------------------------------------

class Point {
    has $.x;
    has $.y;
    method new($x, $y) {
        self.bless(:$x, :$y);
    }
}

class MyClass {
    method BUILDALL(|) {
        # initial things here

        callsame;   # call the parent classes (or default) BUILDALL

        # you can do final checks here.

        self # return the fully built object
    }
}
