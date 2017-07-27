#!/usr/bin/env perl6

use v6.c;

# Soluce
sub days-HMS (Int $seconds){
	my ($minutes,$seconds_left) = $seconds div 60, $seconds mod 60;
	my ($hours,$minutes_left) = $minutes div 60, $minutes mod 60;
	my ($days,$hours_left) = $hours div 60  , $hours mod 60;
	say "$days days, $hours_left hours, $minutes_left minutes, $seconds_left seconds  in $seconds seconds";
}

sub MAIN(){
	printf  "Enter a number of seconds:";
	my $sec = $*IN.get;
	days-HMS $sec.Int;
}
