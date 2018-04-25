#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: markov.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2018-04-25_08:24:11

my %prefixes;

sub MAIN (Str $book, Int $word-count, Int $order = 2, Int $start-line = 0) {

	process-line($order, $_) for ($book.IO.lines)[$start-line..*];

	say make-text($order, $word-count);

}

sub process-line($order, Str $line is copy) {

	$line ~~ s:g/<[-']>/ /;

	$line ~~ s:g/<[;:,!?.()"_`]>//; # removing punctuation symbols

	$line = $line.lc; # setting string to lower case

	return unless $line ~~ /\w/;

	process-words($order, $line.words);

}

sub process-words ($order, @new-words) {

	state @word-buffer = ();

	push @word-buffer, |@new-words;

	while (@word-buffer.elems >= $order * 2) {

		my $key = @word-buffer.shift ~ " " ~

		(join ' ', @word-buffer[0..$order - 2]);

		my $value = @word-buffer[$order -1];

		push %prefixes{$key}, $value;

	}

}

sub make-text (Int $order, Int $w-count) {

	my @prefix = %prefixes.keys.pick.words;

	my $count = 0;

	my $text = join " ", @prefix;

	while $count <= $w-count {

		my @possible-suffixes = |%prefixes{join " ", @prefix};

		last unless @possible-suffixes;

		my $new-word = |@possible-suffixes.pick;

		$text ~= " $new-word";

		shift @prefix;

		push @prefix, |$new-word;

		$count++

	}

	return $text;

}

