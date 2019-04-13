#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : regexes.p6
* Creation Date : Sat Oct 13 19:58:13 2018
* Last Modified : Sat Oct 13 20:09:52 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
	Le test n'est pas sur l'expression réguliere mais sur ce qu'il y a entre simple cot '
	Résultat obtenu:
		my $str =  'number 42';
		Test 1: un seul espace aprés number
			if $str ~~ m/'number ' (\d+)/

		Test 2: deux espaces aprés number
			if $str ~~ m/'number  ' (\d+)/
		
		Résultat attendu:
			doit afficher le chiffre aprés number.

		Résultat obtenu:
			macbook-pro-de-sdo:tp6 sdo$ ./regexes.p6
					----------------------------------
					test 1
					The number is 42
					The number is 42
					----------------------------------
					test 2
					----------------------------------

]
# ------------------------------------------------------

my $str =  'number 42';
say "----------------------------------";
say "test 1";
if $str ~~ /'number ' (\d+) / {
    say "The number is $0";         # OUTPUT: The number is 42 
    # or 
    say "The number is $/[0]";      # OUTPUT: The number is 42 
}
say "----------------------------------";
say "test 2";
if $str ~~ /'number  ' (\d+) / {
    say "The number is $0";         # OUTPUT: The number is 42 
    # or 
    say "The number is $/[0]";      # OUTPUT: The number is 42 
}
say "----------------------------------";
