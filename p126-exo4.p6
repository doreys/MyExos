#!/usr/bin/env perl6  

use v6;

# Program: p126-exo4.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-09_21:16:45

my $str = "The greatest thing you'll never learn " ~
	"is just to love and be loved in return. " ~
	"(Nature boy, Nat King Cole)";

say "$str  ----->$/" if $str ~~ /\W(a\w+)\W/;
say "$str  ----->$/" if $str ~~ /(\w +)/;
say ~$0 if $str ~~ /(\w +)/;
say ~$0 if $str ~~ /(\w+)/;
