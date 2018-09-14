#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : testClassPoint.p6
* Creation Date : Fri Sep 14 23:31:56 2018
* Last Modified : Fri Sep 14 23:48:16 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
	Trying to catch an error when accessing a private method.
	The test is "try to access z which is private in the class". 
	As a result an error is raised because it cannot be found (declared has private). The trick is to
	put the whole stuff in a try block ence catch an error. Like I don't know yet what kind of error 
	is raised I put default when error is catched. Then I print my own message.

		macbook-pro-de-sdo:tp6 sdo$ ./testClassPoint.p6
		x: 1
		y: 2
		x: 1 ; y: 2 ; z: 1
		error catched
		x: 5
		y: 10
]
# ------------------------------------------------------

class Point {
    has $.x;
    has $.y = 2 * $!x;   # valeur par défaut de $y si non spécifiée
    has $!z = 1;

    method gist {
	    "x: $!x ; y: $!y ; z: $!z";
    }
}

my $p = Point.new( z => 9,x => 1, y => 2);
#             ^^^ méthode héritée de la classe Mu
say "x: ", $p.x;    # -> x: 1
say "y: ", $p.y;    # -> y: 2
say $p;
try {
	say $p.z;
	CATCH {
		default { say "error catched"; }
	}

}

my $p2 = Point.new( x => 5 );
# la valeur sert à calculer $y si l'argument $y n'est pas fourni
# value for y.
say "x: ", $p2.x;   # -> x: 5
say "y: ", $p2.y;   # -> y: 10
