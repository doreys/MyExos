#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p1-1-2_p3_UtilisationDeLObjetReconnu.p6
* Creation Date : Sat Jan 19 11:37:42 2019
* Last Modified : Sat Jan 19 11:38:20 2019
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

     };
