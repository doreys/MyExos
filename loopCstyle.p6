#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : loopCstyle.p6
* Creation Date : Sun Jan 27 01:49:50 2019
* Last Modified : Sun Jan 27 01:50:51 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

loop (my $x = 2; $x < 100; $x = $x**2) {
    say $x;
}
