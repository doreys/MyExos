#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p167-exo.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-09-11_14:26:15

my @stack = 1,2,3,4,5;
say @stack;
my $new-item = 6;
put-in-stack-splice(@stack,$new-item);
say @stack;
my $r = take-from-stack-splice(@stack) ; 
say $r,"   ",@stack;
put-in-stack-splice-unshift(@stack,$new-item) ; 
say @stack;
$r = take-from-stack-delete(@stack,2) ; 
say $r,"   ",@stack;

sub put-in-stack-splice(@stack,$new-item){
	splice @stack,@stack.elems,0,$new-item;
}

sub take-from-stack-splice(@stack where @stack > 0){
	my $removed =  splice @stack,@stack.elems-1,1 ;
	return $removed ; 
}

sub put-in-stack-splice-unshift(@stack,$new-item){
	splice @stack,0,0,$new-item;
}


sub take-from-stack-delete(@stack,$rank){
	my $r = splice @stack,$rank, 1, Any ; 
	return $r ; 
}
