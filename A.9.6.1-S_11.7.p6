#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 May 2018)
# Program: A.9.6.1-S_11.7.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2018-05-07_15:02:03

my %freq ;
%freq{$_}++ for grep {/<[a..z]>/},map {.lc},"2147-0.txt".IO.lines.comb;

say "$_.keys:\t$_.values" for %freq;

# -----------------
# correction 

my %frequencies;
%frequencies{$_}++ for grep {/<[a..z]>/}, map {.lc}, "2147-0.txt".IO.lines.comb;
my $total_count = [+] values %frequencies;
say "$_ :\t%frequencies{$_} \t", sprintf "%5.2f", %frequencies{$_}*100/$total_count for reverse sort {%frequencies{$_}}, %frequencies.keys;

