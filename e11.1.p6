#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: e11.1.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2018-02-19_17:45:33

my @words=();

my @lin= 'mess.txt'.IO.lines;

for @lin <-> $lines {
	$lines = $lines.lc;
	@words.append($lines.split(/' '|';'|'.'|','|':'|'('|')'/));
}
say $_ for @words;
