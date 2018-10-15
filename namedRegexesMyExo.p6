#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : namedRegexesMyExo.p6
* Creation Date : Tue Oct 16 00:13:17 2018
* Last Modified : Tue Oct 16 00:35:09 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
	Accepts theses operations:
		1+2
		1 + 2
	Results:
	macbook-pro-de-sdo:tp6 sdo$ ./namedRegexesMyExo.p6
				True
				False
				True
]
# ------------------------------------------------------

my regex myInteger { \d+ }

say so "1+2" ~~ m/<myInteger> \+ <myInteger>/;
say so "1+2" ~~ m/<myInteger> \s+ \+ \s+ <myInteger>/;
say so "1 + 2" ~~ m/<myInteger> \s+ \+ \s+ <myInteger>/;
