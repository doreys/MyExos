#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : par12.5-RectangleClass.p6
* Creation Date : Sat Jun  9 17:16:39 2018
* Last Modified : Sat Jun  9 17:21:28 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose : Imagine you are designing a class to represent rectangles. What attributes would 
you use to specify the location and size of a rectangle? You can ignore angle; to keep things 
simple, assume that the rectangle’s edges are either vertical or horizontal.
There are at least two possibilities:
• You could specify one corner of the rectangle (or the center), the width, and the height.
• You could specify two opposing corners.

]
# ------------------------------------------------------


class Point2D {
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

class Rectangle {
        has Numeric $.width;
        has Numeric $.height;
        has Point2D $.corner;
# lower left vertex
        method area { return $.width * $.height }
        method top-left { $.corner.abscissa, $.corner.ordinate + $.height; }
        # other methods, e.g. for other corners' coordinates, center, etc.
}
