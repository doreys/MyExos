#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p165-stack-implentation.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-09-01_18:05:02

sub put-in-a-stack(@stack,$new_item){
	push @stack,$new_item ; 
}

sub take-from-stack(@stack){
	my $item = pop @stack ; 
	return $item ; 
}

my @a-stack = 1, 2, 3,4, 5 ; 
put-in-a-stack @a-stack, 6 ; 
say @a-stack ; 
say take-from-stack @a-stack for 1..3 ; 
say @a-stack ; 
