#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag4-1-11._Clonage_d_objets.p6
* Creation Date : Wed Sep 26 13:50:35 2018
* Last Modified : Wed Sep 26 13:50:55 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class Point2D {
    has ($.x, $.y);
    multi method gist(Point2D:D:) {
        "Point($.x, $.y)";
    }
}

my $p = Point2D.new(x => 2, y => 3);

say $p;                     # Point(2, 3)
say $p.clone(y => -5);      # Point(2, -5)
