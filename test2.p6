#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: test2.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2018-04-05_06:29:16


say "ok" if "xtotooooo" ≤ "ztyty";
multi sub infix:<≤> (Str $s1,Str $s2){
	#say "* $s1 ->"~$s1.comb.elems; say "* $s2 ->"~$s2.comb.elems;
	#say "$s1 ---->" ~ $s1.chars ~ "  **** " ~ $s1[1..2];
	for 0..($s1.chars,$s2.chars).min -1 -> $a { 
		return False if $s1.substr($a,1) gt $s2.substr($a,1);
	}
	return True;
}
