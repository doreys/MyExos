#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p174-exo.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-10-09_23:38:01

my @numbers = 1..10 ; 
my @list = map {$_ ** 2},@numbers ; 
say @numbers ; 
say @list ; 
my @perfect_square = grep { my $sq = $_.sqrt ; $sq == $sq.Int } , 3, 9, 8, 16 ;
say @perfect_square ;
