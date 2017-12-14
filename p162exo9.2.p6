#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p162exo9.2.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-12-14_16:49:45

my @nums1=[1,2,3,4];
say @nums;
say cumul-sum(@nums1);

sub cumul-sum(@nums){
	my $re=0;
	my @r=();
	for @nums -> $i {
		$re+=$i;
		@r.push($re);
	}
	return @r;
}

my @AoA = [[1, 2], [3], [4, 5, 6]];
sub nested-sum (@array) {
my $sum;
for @array -> $item {
for $item.flat -> $nested_item {
$sum += $nested_item;
}
}
return $sum
}
say nested-sum @AoA;  # -> 21
