#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p162-182.e9.1.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-12-05_15:56:49

my @AoA = [[1, 2], [3], [4, 5, 6]];

say nested-sum1(@AoA); # -> 21
say nested-sum2(@AoA); # -> 21

sub  nested-sum1(@AoA) {
#	say @AoA;
	my $res=0;

	for @AoA -> $o {
		my @r=@$o;
		for @r -> $p {
			$res+=$p;
		}
	}
	return $res;
}

sub  nested-sum2(@AoA) {
	for @AoA.flat -> $i {
		say $i;
	}
}
