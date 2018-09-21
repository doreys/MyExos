#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: pexo310-390-431.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2018-02-11_15:22:29
my %ack-memo;

sub mem-ack (Int $m, Int $n) {

	return $n + 1 if $m == 0;

	return mem-ack($m - 1, 1) if $n == 0;

	%ack-memo{"$m;$n"} = mem-ack($m - 1, mem-ack($m, $n-1))

	unless %ack-memo{"$m;$n"}:exists;

	return %ack-memo{"$m;$n"};

}

my $start = now;

say mem-ack 3, 4;

say "mem-ack runtime: ", now - $start;

dd %ack-memo;

sub ack ($m, $n) {

	return $n + 1 if $m == 0;

	return ack($m - 1, 1) if $n == 0;

	return ack($m - 1, ack($m, $n-1));

}

$start = now;

say ack 3, 4;

say "ack runtime: ", now - $start;
