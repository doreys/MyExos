#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p1-1-p6b-p3_lesRegexLeRetour.p6
* Creation Date : Sun Jan 13 17:17:18 2019
* Last Modified : Sun Jan 13 17:28:57 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------
#

# reconnaissance normale:

if 'abc' ~~ m/../ {

say $/; # ab

}

# reconnaissance avec le modificateur implicite :sigspace

if 'ab cd ef' ~~ ms/ (..) ** 2 / {

say $0[1]; # cd

}

# substitution avec le modificateur :sigspace

my $x = "abc defg";

$x ~~ ss/c d/x y/; # ou : $x ~~ s:s:samespace/c d/x y/;

say $x; # abx yefg
