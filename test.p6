#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: test.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2018-03-13_22:17:05
# ⇐ ≥ → ⇐≤
#
#

say "ok" if 4≥2; # ctrl k >=
say "ok" if 1≤2; # ctrl k =<
#say "ok" if "xtotooooo" ≤ "ztyty";

#say "hello";
my %word-list = map { $_ => 1 }, "words.txt".IO.lines ;
say $_ for  "emma.txt".IO.lines;
for "words.txt".IO.lines -> $l {
	say "----->$l";
}
