#!/usr/bin/env perl6


# Perl 6 version 
use v6.c;

class Foo { has $.i is rw };
   
for 1..1_000_000 -> $i {
	my $obj = Foo.new;
	$obj.i = $i;
}




# Perl 6 version 

use v6.c;

class A {
	has $!x;
	method show-x {
		say $!x;
	}
}
A.new(x => 5).show-x;
