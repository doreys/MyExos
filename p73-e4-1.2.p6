#!/usr/bin/env perl6

use v6.c;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p73-e4-1.2.p6
* Creation Date : Mon Jul 30 21:33:45 2018
* Last Modified : Sat Sep  8 02:11:31 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------


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
