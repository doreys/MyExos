#!/usr/bin/env perl6

use v6.c;

sub gcd(Int $dd,Int $dr){
	say 'dividende:',$dd,' diviseur:',$dr;
	my $r = $dd div $dr;
	my $t = $dd - ($r * $dr);
	gcd($dr,$t) if $t != 0;
	say $dr if $t == 0;
}

gcd(108,30);
