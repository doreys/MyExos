#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : distanceBetween2Pt.p6
* Creation Date : Mon Jun  4 18:41:24 2018
* Last Modified : Tue Jun 26 22:00:18 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose : 12.4 Creating Methods
* As an exercise, you could write a method called distance_between_points that takes two points as 
* arguments and returns the distance between them using the Pythagorean theo- rem.
]
# ------------------------------------------------------

class Point2D {
        has Numeric $.abscissa;
        has Numeric $.ordinate;
        method coordinates {        # accessor to both x and y
            return (self.abscissa, self.ordinate)
	}
        method distance2center {
            (self.abscissa ** 2 + self.ordinate ** 2) ** 0.5
        }
        method polar-coordinates {
            my $radius = self.distance2center;
            my $theta = atan2 self.ordinate, self.abscissa;
            return $radius, $theta;
	} 
	method distance_between_points(Point2D $np) {
		return ((self.abscissa + $np.abscissa) ** 2 + (self.ordinate + $np.ordinate) ** 2) ** 0.5; 
	} 
} 

my $point =  Point2D.new(
    abscissa => 4,
    ordinate => 3
);

my $np =  Point2D.new(
    abscissa => 5,
    ordinate => 4
);

say $point.WHAT; #148966
say $point.isa(Point2D) # test
say $point.abscissa;# 123+
#say $point.coordinates; # -> (4 3)
#say $point.distance2center; # -> 5
#say $point.polar-coordinates; # -> (5 0.643501108793284)
#say $point.distance_between_points($np);
