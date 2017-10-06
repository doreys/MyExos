#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p172-9.8.3.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-10-06_13:53:29

sub capitalize_all(@words)
{

my @result;

push @result, $_.uc for @words;

return @result;

}

my @lc_words = <one two three>;

my @all_caps = capitalize_all(@lc_words); # -> [ONE TWO THREE]
say @lc_words ;
say @all_caps ;

