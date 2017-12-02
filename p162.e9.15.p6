#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p162.e9.15.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-11-28_13:10:17

my @AoA=[[1,2],[3],[4,5,6]];
say nested-sum(@AoA);

sub nested-sum(Array @AoA){
	my $all=0;
	for @AoA-> $l {
		for $l->$v {
			$all+=$l[$v];
		}
	}
	return $all;
}
