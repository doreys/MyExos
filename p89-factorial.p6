#!/usr/bin/env perl6

use v6.c;

multi sub factorial-v3(0){ 1 }
multi sub factorial-v3(Int $n where $n >0){ $n * factorial-v3 $n - 1 }
say factorial-v3 3;
