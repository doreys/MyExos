#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p6b-p2_5-2-1_paresse.p6
* Creation Date : Sun Dec 30 14:02:13 2018
* Last Modified : Sun Dec 30 14:16:07 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------
my @list = gather {

 for 1..10 {

	  do_some_computation($_);

   }

}

sub do_some_computation($x) {

    take $x * ($x + 1);

}

print " ", @list[$_] for 1..7; # imprime 6 12 20 30 42 56 72

# Liste infinie paresseuse :

my $list = lazy gather {
			    #
	for 1..Inf {
		do_some_computation($_);
	}
	#
}
#
#    À not
