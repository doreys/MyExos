#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: bisect.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2018-01-19_02:48:36

use lib ".";  # tells Perl to look for modules in the current dir
use BisectSearch;
my @array = 'a'..'m';

for < a f w e q ab ce g > -> $search {
	my $result = bisect $search, @array;
	if $result == -1 {
		say "did not find $search";
	} else {
		say "found $search : item # $result";
	}
}
