#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : newTestMovablePintClass.p6
* Creation Date : Sun Jul  8 04:06:00 2018
* Last Modified : Sun Jul  8 04:26:49 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
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
}


class Pixel is Point2D {
        has %.color is rw;

        method change_color(%hue) {
            self!color = %hue
        }

        method change_color2(Int $red, Int $green, Int $blue) {
            # signature using positional parameters
            self!color = (red => $red, green => $green, blue => $blue)
        }
}

#`[
class MovablePoint is Point2D {
        has Numeric $.abscissa is rw;
        has Numeric $.ordinate is rw;

        method move (Numeric $x, Numeric $y) {
            $.abscissa += $x;
            $.ordinate += $y;
	} 
}


my $point = MovablePoint.new(
				abscissa => 6,
				ordinate => 7,
			);

say "Coordinates : ", $point.coordinates;
say "Distance to origin: ", $point.distance2center.round(0.01);
printf "%s: radius = %.4f, theta (rad) = %.4f\n",
"Polar coordinates", $point.polar-coordinates;
say "--> Moving the point.";
$point.move(4, 5);
say "New coordinates: ", $point.coordinates;
say "Distance to origin: ", $point.distance2center.round(0.01);
printf "%s: radius = %.4f, theta (rad) = %.4f\n",
"Polar coordinates", $point.polar-coordinates;
]
