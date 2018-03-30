#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p376-11.10-constructing-new-operators.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2018-03-30_17:01:47

sub postfix:<!> (Int $n) {

	fail "The operand is not a positive integer" if $n < 0;

	[*] 2..$n

}

use Test;

plan 5;

dies-ok {(-1)!}, "Factorial fails for -1";

eval-dies-ok "(2.5)!", "Factorial fails for 2.5";

ok 0! == 1, "Factorial 0";

ok 1! == 1, "Factorial 1";

ok 5! == 120, "Factorial of a larger integer";

done-testing;

