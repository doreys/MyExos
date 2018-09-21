#!/usr/bin/env perl6  

use v6 ; 

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : testPair.p6
* Creation Date : Tue May 15 00:10:38 2018
* Last Modified : Tue May 29 00:51:13 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* Purpose : test done on sort function to complete Huffman coding (which is not over yet)
*    go to this file Huffman-Coding.p6
]
# ------------------------------------------------------

# Book: Think Perl 6 (pdf v0.5.3 May 2018)
# Program: testPair.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2018-05-15_00:10:38


my %t = A => "100", C => "110", E => "101", H => "11110" , N => "11111", R => "1110" , O => "0111" , T => "0110", M => "00"; 
say %t;
#my %u = E => "101";
#my %o = H => "11110";
#say order_by_value(%o,%u);
for reverse %t.pairs.sort: { 
			my $va=$^a.value;
			my $vb=$^b.value ; 
			if $va.chars == $vb.chars {
				 $va cmp $vb;
			}
			if $va.chars < $vb.chars {
				! $va cmp $vb;
			}
			if $va.chars > $vb.chars {
				! $va cmp $vb;
			}
		} -> $pair { 
	say $pair;
}
say %t;

