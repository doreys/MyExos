#!/usr/bin/env perl6  

use v6;

# Program: p127-exo2.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-09_23:08:05

my $string = "Ask not what your country can do for you - " ~
	" ask what you can do for your country. (JFK)";

say $string;
say ~$/ if $string ~~ m:i!<< (<[aeiou]> \w*)!;
#say ~$0 if $string ~~ /:i \W (<[aeiou]> \w*)/;
say ~$/ if $string ~~ /:i << (<[aeiou]> \w*)/;
