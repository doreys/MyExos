#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : ParentP6O.p6
* Creation Date : Thu Sep 13 22:04:00 2018
* Last Modified : Mon Sep 24 14:02:37 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class Parent {
    method farfouille {
        say "méthode farfouille de la classe mère"
    }
}

class Enfant is Parent {
    method farfouille {
        say "Appel de la méthode farfouille de la classe fille";
	self.Parent::farfouille;
    }
}

my Parent $test;
$test = Enfant.new;
$test.farfouille;   # appelle la méthode farfouille de la classe fille
# affiche :  Appel de la méthode farfouille de la classe fille
