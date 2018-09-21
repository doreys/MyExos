#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: cumul-sum-20180412.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2018-04-12_17:31:47

my @num=[1,2,3,4];
say cumul-sum(@num);

sub cumul-sum(@num){
	my @res;
	#@res[0]=0;
	for 1..@num.elems-1 -> $k {
		@res[$k-1] = [+] @num[0..$k];
	}
	return @res;
}
