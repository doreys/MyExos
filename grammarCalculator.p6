#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : grammarCalculator.p6
* Creation Date : Tue Oct 16 03:05:22 2018
* Last Modified : Tue Oct 16 03:10:00 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

grammar Calculator {
    token TOP { [ <add> | <sub> ] }
    rule  add { <num> '+' <num> }
    rule  sub { <num> '-' <num> }
    token num { \d+ }
}
 
class Calculations {
    method TOP ($/) { make $<add> ?? $<add>.made !! $<sub>.made; }
    method add ($/) { make [+] $<num>; }
    method sub ($/) { make [-] $<num>; }
}
 
say Calculator.parse('2 + 3', actions => Calculations).made;
 
# OUTPUT: «5␤» 
