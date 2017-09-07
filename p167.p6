#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p167.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-09-06_15:47:39

sub my-shift1(@array){
	my @result = splice @array,0,1;
	return @result[0];
}


sub my-shift2(@array){
	die "Cannot m-shift from an empty array" unless @array ; 
	my @result = splice @array,0,1;
	return @result[0];
}

sub my-shift3(@array where @array>0){
	my @result = splice @array,0,1;
	return @result[0];
}


my @letters = 'a'..'j' ; 
say @letters ; 
my $letter = my-shift1 @letters;
say $letter;
say @letters ; 
$letter = my-shift2 @letters;
say $letter;
say @letters ; 
$letter = my-shift3 @letters;
say $letter;
say @letters ; 
