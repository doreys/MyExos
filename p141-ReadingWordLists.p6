#!/usr/bin/env perl6  

use v6 ; 

# Program: p141-ReadingWordLists.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-24_15:56:57

my $fh = open("words.txt",:r) ; 
#IO::Handle<words.txt>(opened, ar octet 0)
my $line = get $fh ; 
say "<<$line>>" ; 
$line = get $fh ; 
say "<<$line>>" ; 
