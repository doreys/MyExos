#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : PointClassInheritance.p6
* Creation Date : Fri Jul  6 15:17:16 2018
* Last Modified : Fri Jul  6 16:29:27 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
		https://docs.perl6.org/language/classtut
]
# ------------------------------------------------------

class Point {
    has Int $.x;
    has Int $.y;
}

class Rectangle {
    has Point $.lower;
    has Point $.upper;

    method area() returns Int {
        ($!upper.x - $!lower.x) * ( $!upper.y - $!lower.y);
    }
}

# Create a new Rectangle from two Points
my $r = Rectangle.new(lower => Point.new(x => 0, y => 0),
                      upper => Point.new(x => 10, y => 10));

say $r.area(); # OUTPUT: «100␤»
