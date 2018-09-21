#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p187_207-exemple.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2018-02-19_12:03:56


sub my-log($number, $base = e) { # e is a predefined constant
				 # $base is an optional parameter
	
	 return log($number) / log($base);
	
 }

say my-log(4); # Natural log (base e) -> 1.38629436111989
say my-log(32, 2); # Log (base 2) -> 5
say my-log(100, 10); # Log (base 10) -> 2

