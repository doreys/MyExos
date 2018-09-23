#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag_4-1-8.test.Subméthodes.p6
* Creation Date : Sun Sep 23 02:14:34 2018
* Last Modified : Sun Sep 23 04:45:10 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
	check file methodCall.p6
	In this tet we overload the method gist

	Illustrate the meaning of submethod BUILD and inheritance (reverse mro).
		Initialise Point2D
		Initialise Point2DInversible
		Initialise Point2D
		Initialise Point2DInversible
		Point2DInversible.new(x => -1, y => -2)
]
# ------------------------------------------------------
#
class Point2D {
    has $.x;
    has $.y;

    submethod BUILD(:$x, :$y) {
        say "Initialise Point2D";
	$!x := $x;
	$!y := $y;
    }
    method gist(){
	    "x: $!x,y: $!y";
    }
}

class Point2DInversible is Point2D {
    submethod BUILD() {
        say "Initialise Point2DInversible";
    }
    method inverse {
        self.new(x => - $.x, y => - $.y);
    }
    method gist {
	"totot " ~ self.Point2D::gist()
    }
}
my $pt_inv =  Point2DInversible.new(x => 1, y => 2);
say $pt_inv.inverse.perl;
say $pt_inv; 
