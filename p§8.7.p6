#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p§8.7.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-29_22:09:57

my $w="xxyyzz";

for "./words.txt".IO.lines -> $w {
	f3dcl($w);
}

# find three double consecutive letters 
sub f3dcl(Str $w){
	say "ok $0 in $w" if $w ~~ /((.)$0 (.)$1 (.)$2)/;
}
