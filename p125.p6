#!/usr/bin/env perl6  

use v6;

# Program: p125.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-10_16:20:56

my $str = "abcdef";

my_print /ab || abcde /; # abcdef ~~ /ab || abcde /   ----> True ----- Matched ab
my_print /abcde || ab /; # abcdef ~~ /abcde || ab /   ----> True ----- Matched abcde
my_print /ab | abcde /;  # abcdef ~~ /ab | abcde /    ----> True ----- Matched abcde
my_print /abcde | ab /;  # abcdef ~~ /abcde | ab /    ----> True ----- Matched abcde
my_print /ab | bcde /;   # abcdef ~~ /ab | bcde /     ----> True ----- Matched ab
my_print /a | bc /;      # abcdef ~~ /a | bc /        ----> True ----- Matched a
my_print / a || bc/;     # abcdef ~~ / a || bc/       ----> True ----- Matched a
my_print / (a || b) c/;  # abcdef ~~ / (a || b) c/    ----> True ----- Matched bc
my_print / [a || b ] c /;# abcdef ~~ / [a || b ] c /  ----> True ----- Matched bc
my_print / ab+ /;        # abcdef ~~ / a b+ /         ----> True ----- Matched ab
my_print / ac+ /;        # abcdef ~~ / a c+ /         ----> False ----- Didn't matched in abcdef
my_print /(ab)+/;        # abcdef ~~ /(ab)+/          ----> True ----- Matched ab
my_print /[ab]+/;        # abcdef ~~ /[a b]+/         ----> True ----- Matched ab
my_print / (a || b)+/;   # abcdef ~~ / (a || b)+/     ----> True ----- Matched ab

sub my_print($reg){
	print "$str \~\~ ",$reg.gist;
	print " ----> ";
	print so $str ~~ $reg;
	say " ----- Matched $/" if $str ~~ $reg;
	say " ----- Didn't matched in $str" if $str !~~ $reg;
}
