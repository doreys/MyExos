#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p9-2_p6b-p2.p6
* Creation Date : Sat Jan 12 11:45:09 2019
* Last Modified : Sat Jan 12 12:00:07 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------


enum Day <Mon Tue Wed Thu Fri Sat Sun>;
my $today=Fri;

if $today ~~ Day::Fri {

	 say "Dieu merci, c'est vendredi!";

 }

 if $today.does(Fri) { 
	 say "Dieu merci, c'est vendredi!";
 }
