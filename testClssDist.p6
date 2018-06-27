#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : testClssDist.p6
* Creation Date : Tue Jun 26 22:02:04 2018
* Last Modified : Wed Jun 27 03:16:46 2018
* Email Address : sdo@MacBook-Pro-de-SDO.local
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
12.2 Programmer-Defined Types
]
# ------------------------------------------------------
#

class Point2D {
        has $.abscissa;              # "x" value
        has $.ordinate;              # "y" value
}

my $point = Point2D.new(
		abscissa => 3,
		ordinate => 4
	);
say $point.WHAT; # -> (Point2D)
say $point.isa(Point2D) ; # -> True      <---------------------- erreur ; manquant
say $point.abscissa; # -> 3

