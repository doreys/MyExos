#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag8-2-2._L_objet_reconnu_p6b.p6
* Creation Date : Sat Oct 13 09:39:14 2018
* Last Modified : Sat Oct 13 22:04:38 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

if 'abcdefg' ~~ m/(.(.)) (e | bla ) $<foo> = (.) / {
    say $/[0][0];           # d
    say $/[0];              # cd
    say "----------------------------------";
    say $/{ 'foo' };              # f
    say "----------------------------------";
    say $/[1];              # e
    say $/<foo>             # f
}
