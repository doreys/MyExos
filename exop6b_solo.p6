#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : exop6b_solo.p6
* Creation Date : Mon Feb  4 11:58:27 2019
* Last Modified : Mon Feb  4 12:04:39 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------


say ~$/ if 'a+b' ~~ m:s/a '+' b/;
say ~$/ if 'ab' ~~ m:s/a b/;
