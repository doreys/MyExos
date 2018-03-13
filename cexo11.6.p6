#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: cexo11.6.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2018-03-13_22:35:01

my %histogram;
my $skip = True; # flag to skip the header
sub process-line(Str $line is copy) {
	if defined index $line, "*END*THE SMALL PRINT!" {
		$skip = False ;
		return;
	}
	return if $skip;
	$line ~~ s:g/<[-']>/ /; # Replacing dashes and apostrophes with spaces
	$line ~~ s:g/<[;:,!?.()"_`]>//; # removing punctuation symbols
	$line = $line.lc;               # setting string to lower case
	for $line.words -> $word {
		%histogram{$word}++;
	}
}
process-line $_ for "emma.txt".IO.lines;

# displaying 20 lines of the histogram
my $count;
for %histogram -> $pair {
	say sprintf "%-24s %d", $pair.key, $pair.value;
	$count++;
	last if $count > 20;
}
