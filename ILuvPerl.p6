#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : ILuvPerl.p6
* Creation Date : Tue Sep 25 00:05:24 2018
* Last Modified : Tue Sep 25 00:07:04 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

grammar Parser {
    rule  TOP  { I <love> <lang> }
    token love { '♥' | love }
    token lang { < Perl Rust Go Python Ruby > }
}

say Parser.parse: 'I ♥ Perl';
# OUTPUT: ｢I ♥ Perl｣ love => ｢♥｣ lang => ｢Perl｣

say Parser.parse: 'I love Rust';
# OUTPUT: ｢I love Rust｣ love => ｢love｣ lang => ｢Rust｣
