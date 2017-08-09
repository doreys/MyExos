#!/usr/bin/env perl6  

use v6;

# Program: p125-gouping_and_capturing.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-09_02:50:20

my $str = 'number 42';
say "The number is $0" if $str ~~ /number\s+ (\d+)/;
say "$0 $1 $2" if "abcde" ~~ /(a) b (c) d (e)/;
say "$/[0..2]" if "abcde" ~~ /(a) b (c) d (e)/;
say ~$0 if "cacbcd" ~~ /[b||a] (c.)/;
