#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p6b-p3_p1-1-1_paragraphealternative.p6
* Creation Date : Sun Mar 10 13:21:11 2019
* Last Modified : Sun Mar 10 13:22:41 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

if 'abcdef' ~~ / de / {
say ~$/; # de
say $/.prematch; # abc
say $/.postmatch; # f
say $/.from; # 3
say $/.to; # 5
}
