#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : ConstructingObjectWithPrivateAttribute.p6
* Creation Date : Sun Jul 22 23:49:00 2018
* Last Modified : Mon Jul 23 00:42:07 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class Point3D { 
	has $.x; 
	has $.y; 
	has $!z; 
	
	submethod BUILD (:$!x, :$!y, :$!z) {
		say "Initialization"; 
		$!x := $!x; 
		$!y := $!y; 
		$!z := $!z; 
	}

	method get { 
		return ($!x, $!y, $!z); 
	} 
}; 

my $a = Point3D.new(x => 23, y => 42, z => 2); 

say $_ for $a.get;

