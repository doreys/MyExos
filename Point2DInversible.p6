#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : Point2DInversible.p6
* Creation Date : Fri Sep 14 23:14:48 2018
* Last Modified : Fri Sep 14 23:24:46 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class Point2D {
    has $.x;
    has $.y;

    submethod BUILD(:$!x, :$!y) {
        say "Initialise Point2D";
    }
}

class Point2DInversible is Point2D {
    submethod BUILD() {
        say "Initialise Point2DInversible";
    }
    method inverse {
        self.new(x => - $.x, y => - $.y);
    }
}

my $pt_inv =  Point2DInversible.new(x => 1, y => 2); # call Point2DInversible -> Point2DInversible::BUILD -> { Point2D -> print info of BUILD PointZD} -> print info of BUILD Point2DInversible (1)
say $pt_inv.inverse.perl; # (1) call method reverse then with .perl of class
say $pt_inv.^mro; # 
