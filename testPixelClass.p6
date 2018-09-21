#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : testPixelClass.p6
* Creation Date : Wed Jul  4 17:27:31 2018
* Last Modified : Thu Jul 19 02:19:03 2018
* Email Address : sdo@macbook-pro-de-sdo.home
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

class Pixel is Point2D {
        has %.color is rw;

        method change_color(%hue) {
            self.color = %hue
        }
        method change_color2(Int $red, Int $green, Int $blue) {
            # signature using positional parameters
            self.color = (red => $red, green => $green, blue => $blue)
        }
}

my $point = Point2D.new(
		abscissa => 3,
		ordinate => 4
	);

say $point.WHAT; # -> (Point2D)
say $point.isa(Point2D) ; # -> True      <---------------------- erreur ; manquant
say $point.abscissa; # -> 3

# --------------------------------------------------
my $pix = Pixel.new(
			color => {:red(195), :green(110), :blue(70),},
			abscissa => 3,
			ordinate => 4);
say "Original colors: ", $pix.color;

#`[
$pix.change_color({:red(195), :green(110), :blue(70),});
say "Modified colors: ", $pix.color;
say "New pixel caracteristics:";
printf "\tAbscissa: %.2f\n\tOrdinate: %.2f\n\tColors: R: %d, G: %d, B: %d\n",
	$pix.abscissa, $pix.ordinate,$pix.color<red>, $pix.color{"green"}, $pix.color{"blue"};
$pix.change_color2(90, 180, 30);  # positional args
say "New colors: \tR: {$pix.color<red>}, G: {$pix.color<green>}, B: {$pix.color<blue>} ";
]
