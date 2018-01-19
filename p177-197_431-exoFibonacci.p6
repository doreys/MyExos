#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p177-197_431-exoFibonacci.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2018-01-18_15:52:58

my @k=1,1;
my %known = 0 => 1, 1 => 1;

say fibo(10);
say "------------------------";
say fibonacci(10);

sub fibo($n){
	return @k[$n] if @k[$n]:exists;
	@k[$n] = fibo($n - 1) + fibo($n-2);
	say "$n @k[$n] = fibo($n - 1) + fibo($n-2)";
	return @k[$n];
}

sub fibonacci ($n) {
	return %known{$n} if %known{$n}:exists;
	%known{$n} = fibonacci($n-1) + fibonacci($n-2);
	say "$n %known{$n} = fibonacci($n-1) + fibonacci($n-2)";
	return %known{$n};
}
