#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : newPoint.p6
* Creation Date : Thu Sep 13 22:15:17 2018
* Last Modified : Fri Sep 14 00:18:21 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
	on peut aussi redéfinir la méthode new avec ses propres paramètres positionnels.
]
# ------------------------------------------------------

class Point {
    has $.x;
    has $.y = 2 * $!x;   # valeur par défaut de $y si non spécifiée

    method new($x, $y) {
            self.bless(:$x, :$y);
    }
}

my $p = Point.new( x => 1, y => 2);
#             ^^^ méthode héritée de la classe Mu
say "x: ", $p.x;    # -> x: 1
say "y: ", $p.y;    # -> y: 2

my $p2 = Point.new( x => 5 );
# la valeur sert à calculer $y si l'argument $y n'est pas fourni
# value for y.
say "x: ", $p2.x;   # -> x: 5
say "y: ", $p2.y;   # -> y: 10
