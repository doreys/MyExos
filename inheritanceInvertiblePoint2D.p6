#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : inheritanceInvertiblePoint2D.p6
* Creation Date : Sun Jul  8 04:27:21 2018
* Last Modified : Sun Jul  8 04:29:38 2018
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
    has $.x;
    has $.y;

    submethod BUILD(:$!x, :$!y) {
        say "Initializing Point2D";
    }
}

class InvertiblePoint2D is Point2D {
    submethod BUILD() {
        say "Initializing InvertiblePoint2D";
    }
    method invert {
        self.new(x => - $.x, y => - $.y);
    }
}

say InvertiblePoint2D.new(x => 1, y => 2);
