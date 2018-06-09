#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p12.4.p6
* Creation Date : Sat Jun  9 17:02:20 2018
* Last Modified : Sat Jun  9 17:12:52 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose : Chapter12. Classes and Objects § 12.4
]
# ------------------------------------------------------
#

class Point2D-mutable {
        has Numeric $.abscissa is rw;
        has Numeric $.ordinate is rw;
        # perhaps the same accessors as in the class definition above

        method new-ordinate (Numeric $ord) {
            self.ordinate = $ord;
	} 

	method coordinates {        # accessor to both x and y
            return ($.abscissa, $.ordinate)
	}

	method distance2center {
            (self.abscissa ** 2 + self.ordinate ** 2) ** 0.5
        }

        method polar-coordinates {
            my $radius = self.distance2center;
            my $theta = atan2 self.ordinate, self.abscissa;
            return $radius, $theta;
	}
}
# Creating the Point2D-mutable object:
my $point = Point2D-mutable.new(abscissa => 3, ordinate => 4);
given $point {
    say .coordinates; # -> (4 3)
    say .distance2center; # -> 5
    .polar-coordinates.say; # -> (5 0.643501108793284)
}
say $point;  # -> Point2D-mutable.new(abscissa => 3, ordinate => 4)
# Modifying the ordinate:
$point.new-ordinate(6);
say $point;  # -> Point2D-mutable.new(abscissa => 3, ordinate => 6)

