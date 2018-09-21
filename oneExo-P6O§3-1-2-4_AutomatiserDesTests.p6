#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : oneExo-P6O§3-1-2-4_AutomatiserDesTests.p6
* Creation Date : Fri Sep  7 00:29:21 2018
* Last Modified : Fri Sep  7 00:38:09 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
	First run:
		$ ./oneExo-P6O§3-1-2-4_AutomatiserDesTests.p6
		1..1
		ok 1 - test for multiplication 2 by 2


	Second run:
		$ ./oneExo-P6O§3-1-2-4_AutomatiserDesTests.p6
		1..1
		ok 1 - test for multiplication 2 by 2
		not ok 2 - test for multiplication 2 by 3
		# Failed test 'test for multiplication 2 by 3'
		# at ./oneExo-P6O§3-1-2-4_AutomatiserDesTests.p6 line 25
		# Looks like you planned 1 test, but ran 2
		# Looks like you failed 1 test of 2

]
# ------------------------------------------------------

use Test; # We can do test with this module in P6

plan 2; # This instruction tells that we will do 1 test

ok 2 * 2 == 4, "test for multiplication 2 by 2";
ok 2 * 3 == 4, "test for multiplication 2 by 3";

