#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p137exo8.3.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-31_01:03:27


say 'diff #instances';
check_diffs();
say 'daughter  mother';
num_instances(18, True);

sub are_reversed(Int $i, Int $j) {
	# $j (mother's age) will always be 2 digits
	return $j eq flip sprintf '%02d', $i; # format $i on 2 digits
}

sub num_instances (Int $diff, Bool $flag) {
	# computes and counts all possibilities for one age difference
	my $daughter = 0;
	my $count = 0;
	while True {
		my $mother = $daughter + $diff;
		if are_reversed($daughter, $mother) or are_reversed($daughter, $mother+1) {
			$count++;
			printf "%02d\t%d\n", $daughter, $mother if $flag;
		}
		last if $mother > 99;
		$daughter++;
	}
	return $count;
}

sub check_diffs () {
	# enumerates all possible age differences
	for 15..75 -> $diff {
		my $nb_cases = num_instances $diff, False;
		say "$diff   $nb_cases" if $nb_cases > 0;
	}
}
