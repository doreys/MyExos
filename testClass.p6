#!/usr/bin/env perl6 

use v6.c;

class Hello {
	has $.mo;

	method mprint(){
		say "--->$.mo\n";
		return;
	}
}

my $u = Hello.new(mo => "hello");
$u.mprint();
