#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p11-2-5_p6b-p2_lesPseudosPacketages.p6
* Creation Date : Sun Jan 13 16:08:18 2019
* Last Modified : Sun Jan 13 16:08:50 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

my $x = 3;
{
    my $x = 10;
    say $x;             # imprime 10
    say $OUTER::x;      # imprime 3
    say OUTER::<$x>     # imprime 3
}
