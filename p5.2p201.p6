#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p5.2p201.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2018-01-27_18:10:42

say A(3,4);

sub A(Int $m,Int $n){
	say '$n+1='~$n+1 if $m==0;
	return $n+1 if $m==0;
	say "A($m-1,1)" if $n==0;
	return A($m-1,1) if $n==0;
	say "A($m-1,A($m,$n-1))";
	return A($m-1,A($m,$n-1));
}
