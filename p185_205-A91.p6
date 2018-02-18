#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p185_205-A91.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2018-02-18_13:17:29

my @a=1,42,43,44,145;

for @a -> $value {
	say $value;
	given $value {

		when 0..9 { say "One digit"}

		when 10..99 { say "Two digits"; proceed if $_ == 42;}

		when 42 { say "The response to the ultimate question"}

		when /^\d**3$/ { say "Three digits" }

		default { say "More than three digits" }

	}
}

