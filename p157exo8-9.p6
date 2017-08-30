#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p157exo8-9.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-30_18:12:01

my $gmas = 74 ; # gran mother age start
my $c = 0;
for 15..$gmas -> $age {
	my $td=sprintf "%02d",$age;
	my $mga=flip "$age"; # my grama age reversed
	if $mga <= 37  {
		$c++;
		say "$c. ok ",$mga," ",$td ;
	}
	$gmas--;
}
