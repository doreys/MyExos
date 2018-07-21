#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : PixelPoint2D.p6
* Creation Date : Sat Jul 21 20:27:19 2018
* Last Modified : Sat Jul 21 21:16:54 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

# Paragraphe 12.4
#
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


# Paragraphe 12.7.1
#
 class Pixel is Point2D {
        has %.color is rw;

        method change_color(%hue) {
		#self!color = %hue; # marche si on met . à la place de !
            self.color = %hue; # marche si on met . à la place de !
        }

        method change_color2(Int $red, Int $green, Int $blue) {
            # signature using positional parameters
	    # self!color = (red => $red, green => $green, blue => $blue); # marche si on met . à la place de !
            self.color = (red => $red, green => $green, blue => $blue); # marche si on met . à la place de !
        }
}

my %h=(red=>6,green=>7,blue=>8);
my Pixel $pix=Pixel.new(abscissa => 1,ordinate => 2,color=>%h);


say "Original colors: ", $pix.color;
$pix.change_color({:red(195), :green(110), :blue(70),});
say "Modified colors: ", $pix.color;
say "New pixel caracteristics:";
printf "\tAbscissa: %.2f\n\tOrdinate: %.2f\n\tColors: R: %d, G: %d, B: %d\n",
										   $pix.abscissa, $pix.ordinate,
										   $pix.color<red>, $pix.color{"green"}, $pix.color{"blue"};
$pix.change_color2(90, 180, 30);  # positional args
say "New colors:
\tR: {$pix.color<red>}, G: {$pix.color<green>}, B: {$pix.color<blue>} ";

