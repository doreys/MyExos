#!/usr/bin/env perl6

use v6.c;

sub calculate(Int $sec){
	say "-----------------------------";
	say "calculate how many sec(),min(s),hour(s),day(s) there are in {$sec} second(s)";

	my $min=$sec div 60;
	my $nsec=$sec-$min*60;

	my $hour=$min div 60;
	my $nmin=$min-$hour*60;

	my $day=$hour div 24;
#	my $nhour= $day-$nhour*24;

	say "calculus gave ($nsec,$nmin,$hour,$day)smhd";
}

# Soluce
sub days-HMS (Int $seconds){
	my ($minutes,$seconds_left) = $seconds div 60, $seconds mod 60;
	my ($hours,$minutes_left) = $minutes div 60, $minutes mod 60;
	my ($days,$hours_left) = $hours div 60  , $hours mod 60;
	say "$days days, $hours_left hours, $minutes_left minutes, $seconds_left seconds  in $seconds seconds";
}

sub MAIN(Str $name){
	say "Say hello $name";
	calculate(128);
	calculate(128*60);
	calculate(128*60*23);

	days-HMS(128);
	days-HMS(128*60);
	days-HMS(128*60*23);
}
