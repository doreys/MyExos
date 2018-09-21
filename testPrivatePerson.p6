#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : testPrivatePerson.p6
* Creation Date : Mon Sep  3 13:19:42 2018
* Last Modified : Mon Sep  3 20:37:40 2018
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
	has $!my-private ;
	
	submethod BUILD(:$!my-private) { 
		say "initialisation of A"; 
	}

	method set_my-private(Str $s){
		$!my-private = $s;
	}

	method gist {
		"this is the content of $!my-private";
	}
};

class B {
	has A $!a_field;

	submethod BUILD(:$!a_field){
		say "initialisation of B"; 
	}

	method gist {
		"this is B " ~ $!a_field.gist;
	}
}

my $a = A.new(my-private => "totototototo");
say $a;
$a.set_my-private("tututu");
say $a;

my $b = B.new(a_field => $a);
say $b;

