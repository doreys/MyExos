#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p6b-p3-5-1-1-description-4.p6
* Creation Date : Sat Jun  8 21:50:28 2019
* Last Modified : Sat Jun  8 21:51:54 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

say [\~] 'a' .. 'd';     # <a ab abc abcd>
say [\**] 1..3;         # 3, 2**3, 1**(2**3), soit 3, 8, 1
say [~] [\**] 1..3;     # "381"
say [\~] [\**] 1..3;     # "3 38 381"
