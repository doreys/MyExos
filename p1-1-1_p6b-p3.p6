#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p1-1-1_p6b-p3.p6
* Creation Date : Sun Mar 10 12:22:16 2019
* Last Modified : Sun Mar 10 12:28:45 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

my $x = 'Abcd';
$x ~~ s:ii/^../foo/;
say $x;                     # Foocd
$x = 'ABC';
$x ~~ s:ii/^../foo/;
say $x                      # FOO
