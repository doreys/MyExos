#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p165-lifo.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-09-01_23:20:15

sub put-in-a-stack_unshift(@stack,$new_item){
	unshift @stack,$new_item ; 
}

sub take-from-stack_shift(@stack){
	my $item = shift @stack ; 
	return $item ; 
}

my @a-stack = 1, 2, 3,4, 5 ; 
put-in-a-stack_unshift @a-stack, 6 ; 
say @a-stack ; 
say take-from-stack_shift @a-stack for 1..3 ; 
say @a-stack ; 
