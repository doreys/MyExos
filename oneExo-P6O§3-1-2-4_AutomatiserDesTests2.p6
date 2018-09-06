#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : oneExo-P6O§3-1-2-4_AutomatiserDesTests2.p6
* Creation Date : Fri Sep  7 00:29:21 2018
* Last Modified : Fri Sep  7 01:24:02 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
	1..18
	ok 1 - Test with the address 1 with the constructor ok
	*************>1  1
	ok 2 - test on address number 1 ok
	ok 3 - Test with the address 2 with the constructor ok
	*************>2  2
	ok 4 - test on address number 2 ok
	ok 5 - Test with the address 3 with the constructor ok
	*************>3  3
	ok 6 - test on address number 3 ok
	ok 7 - Test with the address 4 with the constructor ok
	*************>4  4
	ok 8 - test on address number 4 ok
	ok 9 - Test with the address 5 with the constructor ok
	*************>5  5
	ok 10 - test on address number 5 ok
	ok 11 - Test with the address 6 with the constructor ok
	*************>6  6
	ok 12 - test on address number 6 ok
	ok 13 - Test with the address 7 with the constructor ok
	*************>7  7
	ok 14 - test on address number 7 ok
	ok 15 - Test with the address 8 with the constructor ok
	*************>8  8
	ok 16 - test on address number 8 ok
	ok 17 - Test with the address 9 with the constructor ok
	*************>9  9
	ok 18 - test on address number 9 ok
]
# ------------------------------------------------------

use Test; # We can do test with this module in P6

plan 18; # This instruction tells that we will do 1 test

subset NuméroFormat of Str where /^\d+ \s* [ter|bis]?$/;
subset NumString of Str where /^<[\d\s]>+$/;

class Address {
	has NuméroFormat $.numéro;
	has Str $.voie;
	has NumString $.code-postal;
	has Str $.commune;

	method sérialise {
		"\t$.numéro $.voie\n" ~
		"\t$.code-postal $.commune";
	}
}

my %address ;
for 1..9 -> $num {
	%address{$num} = Address.new( numéro => "$num",
				    voie => "rue des Fours à pain",
				    code-postal => "69007",
				    commune => "Lyon"
				  ); 
	isa-ok %address{$num}, Address, "Test with the address $num with the constructor ok";
	say "*************>"~%address{$num}.numéro~"  $num";
	ok %address{$num}.numéro eq $num, "test on address number $num ok";
	#say "Adresse $_ :\n", @address[$_].sérialise for 1..5 ;
}


