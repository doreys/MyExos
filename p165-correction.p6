#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p165-correction.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-09-01_23:57:12

sub enqueue (@queue where Array, $new_item){
	unshift @queue, $new_item ; 
}

sub dequeue (@queue where Array){
	my $item = pop @queue ; 
	return $item ; 
}

