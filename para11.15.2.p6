#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: para11.15.2.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2018-04-30_19:36:57

my $nn = creates_node("2"); # new node ($nn)
my $n = add_ln($nn,"4");

sub creates_node($key){
	my @lrs = (Nil,Nil);
	my $node = $key => $@lrs ;
	return $node;
}

sub add_ln(Pair $tree ,$va){
	my $nt = creates_node($va);
	my xxi($l,$r) = $nt.value;


	return $nt;
}

sub add_rn(Pair $tree,$va){
	return Nil;
}

