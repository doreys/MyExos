#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p162e9.3.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-12-15_00:45:09

my @nums = 1, 2, 3, 4;
chop-it(@nums);
say @nums;

sub chop-it(@nu){
	@nu.pop();
	@nu.shift();
}
