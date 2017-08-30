#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p137-exo8.8.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-30_17:09:25

sub is-palindrome($number,$start,$len){
	my $substring = substr $number, $start,$len;

	return $substring eq flip $substring;
}

sub check($num){
	return (
		is-palindrome($num    ,2,4)     and
		is-palindrome($num + 1,1,5) and
		is-palindrome($num + 2,1,4) and
		is-palindrome($num + 3,0,6) 
	);
}

sub check2($num){
	# Checkswether the integer num has the properties described
	$num     ~~ /^..(.)(.)$1$0/ and
	$num + 1 ~~ /^.(.)(.).$1$0/ and
	$num + 2 ~~ /^.(.)(.)$1$0/ and
	$num + 3 ~~ /^(.)(.)(.)$2$1$0/; 
}

say 'The following are the possible odometer readings:';
for 1e5..1e6 -> $number {
	(say "sol 1:",$number) if check $number;
	(say "sol 2:",$number) if check2 $number;
}

# ThinkPerl6Training sdo$ ./p137-exo8.8.p6
# The following are the possible odometer readings:
# sol 1:198888
# sol 2:198888
# sol 1:199999
# sol 2:199999
