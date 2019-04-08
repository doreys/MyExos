#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : test_enum_sub.p6
* Creation Date : Tue Jan  8 22:01:00 2019
* Last Modified : Thu Jan 10 20:58:15 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

enum Name(oui=>0,non=>1);

say 0.WHAT;

sub T(Name $v){ $v }
say T(oui);
say T(0);


# ------------------------------------------------------
#`[
	Résultats:

macbook-pro-de-sdo:tp6 sdo$ ./test_enum_sub.p6
oui
Type check failed in binding to parameter '$v'; expected Name but got Int (0)
  in sub T at ./test_enum_sub.p6 line 22
  in block <unit> at ./test_enum_sub.p6 line 24

]
# ------------------------------------------------------
