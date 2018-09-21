#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : inher.p6
* Creation Date : Mon Jul 16 22:56:35 2018
* Last Modified : Tue Jul 17 08:41:35 2018
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
            %!color = %hue
        }
        method change_color2(Int $red, Int $green, Int $blue) {
            # signature using positional parameters
            %!color = (red => $red, green => $green, blue => $blue)
        }
}

my $pix = Pixel.new(
			Point2D{abscissa=>5,ordinate=>9},
			(red => 1,green => 2, blue => 3)
	);

#
#`[
say "Original colors: ", $pix.color;
$pix.change_color({:red(195), :green(110), :blue(70),});
say "Modified colors: ", $pix.color;
say "New pixel caracteristics:";
printf "\tAbscissa: %.2f\n\tOrdinate: %.2f\n\tColors: R: %d, G: %d, B: %d\n",
           $pix.abscissa, $pix.ordinate,
           $pix.color<red>, $pix.color{"green"}, $pix.color{"blue"};
]
