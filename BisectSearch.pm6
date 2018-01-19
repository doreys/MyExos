# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: BisectSearch.pm6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2018-01-19_02:52:45


unit module BisectSearch;
sub bisect (Str $word, @word_list) is export {
	sub bisect2 ($low_idx, $high_idx) {
		my $mid_idx = (($low_idx + $high_idx) /2).Int;
		my $found = @word_list[$mid_idx];
		return $mid_idx if $word eq $found;
		return -1 if $low_idx >= $high_idx;
		if $word lt $found {
			# search the first half
			return bisect2 $low_idx, $mid_idx - 1;
		} else {
			# search the second half
			return bisect2 $mid_idx+1, $high_idx;
		} 
	}
	my $max_index = @word_list.end;
	return bisect2 0, $max_index;
}
sub some-other-sub is export {
# does something useful
}
