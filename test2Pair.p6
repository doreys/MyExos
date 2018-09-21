#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 May 2018)
# Program: ./test2Pair.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2018-05-16_01:51:41

my %nums = (
  four  => 4,
  one   => 1,
  three => 3,
  two   => 2,
);

for %nums.keys.sort: { %nums{$^a} <=> %nums{$^b} } -> $key {
    say "$key {%nums{$key}}";
}
