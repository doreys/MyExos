#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : RoleCompositionAndCodeReuse.p6
* Creation Date : Sat Jul 21 17:16:59 2018
* Last Modified : Sat Jul 21 17:24:23 2018
* Email Address : sdo@MBP-de-SDO
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

role Drawable {
        has $.color is rw;
	method draw { ... }  # Please note that the ellipsis ... used in the code above is meant here to represent some code that is left to your implementation
}

class Figure {
	method area { ... } # Please note that the ellipsis ... used in the code above is meant here to represent some code that is left to your implementation
}

class Rectangle is Figure does Drawable {
	has $.width;
	has $.height;

	method area {
	    $!width * $!height;
	}
	method draw() {
	    for 1..$.height {
		say 'x' x $.width;
	    }
	} 
}
Rectangle.new(width => 10, height => 4).draw;

