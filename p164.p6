#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p164.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-31_21:51:08

my @numbers = <2 4 6 7> ; 
say @numbers ; 
push @numbers,8,9 ; 
say @numbers ; 
unshift @numbers,0,1 ; 
say @numbers ; 
my $num = shift @numbers ; 
say @numbers," removed ",$num ; 
$num = pop @numbers ; 
say @numbers," removed ",$num ; 
@numbers.push(4,8) ; 
say @numbers ; 
say @numbers , " unique filter used ------> ", @numbers.unique , "         squish filter used ---> ", @numbers.squish ; 
my @add-array = 8, 10 ; 
@numbers.push(@add-array) ; 
say @numbers ; 
my $rem = @numbers.pop ; 
say @numbers ," partremoved ----->", $rem ; 
my @numb = <2 4 6 7> ; 
say @numb ; 
@numb.push(@add-array);
say @numb ; 
@numb.push(|@add-array);
say @numb ; 
