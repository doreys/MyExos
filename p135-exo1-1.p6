#!/usr/bin/env perl6  

use v6;

# Program: p135-exo1-1.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-18_22:57:53

my $string="banana";
my $st="";

for $string.comb -> $le {
	if $st !~~ m/$le/ {
		my $c=count_letter($string,$le);
		if $c>0 {
			$st=$st ~ $le;
			say "$le has ", count_letter($string,$le), " occurences";
			$string ~~ s:g/$le/_/;
#			say $string;
		}
		else{
			say "$le has just 1 occurence";
			$string ~~ s:g/$le/_/;
		}
	}
}

sub count_letter(Str $string,Str $l){
	my $pos=-1;
	my $counter=0;

	while $pos {
		$pos=index $string,$l,$pos+1;
		if $pos {
			$counter++;
		}
	}
	return $counter;;
}

# ----------------------------------------------------------------------------------------

sub count_a {
	my $word = "banana";
	my $count = 0;
	my $idx = 0;
	while True {
		$idx = index $word, 'a' , $idx;
		last unless $idx.defined;
		$idx++;
		$count++;
	}
	return $count;
}

sub count_index (Str $word, Str $letter){
	my $count = 0;
	my $idx = 0;
	while True {
		$idx = index $word, $letter , $idx;
		last unless $idx.defined;
		$idx++;
		$count++;
	}
	return $count;
}

sub count_substr (Str $word, Str $letter){
	my $count = 0;
	for 0..$word.chars - 1 {
		$count++ if $letter eq substr $word, $_, 1;
	}
	return $count;
}

say "Correction -----------------------";
say count_a();
say count_index "When in the Course of human events ...","n";
say count_substr "I have a dream that one day...","a";
