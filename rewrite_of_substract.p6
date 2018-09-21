#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: rewrite_of_substract.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2018-04-05_03:32:00

my %histogram;
my $skip = True; # flag to skip the header

process-line $_ for "emma.txt".IO.lines;
my $word-list = set "words.txt".IO.lines;
my %unknown-words = subtract(%histogram, $word-list);
say %unknown-words.keys.head(20);

sub subtract (%main, $dict) {
	my %difference;
	for %main.keys -> $word {
		%difference{$word} = 1 unless $word ∈ $dict;
	}
	return %difference;
}

# ∈ /
# ä: o Ϛ ↑{ \  Ø:q
#


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
