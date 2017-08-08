#!/usr/bin/env perl6  

use v6;

# Program: p123.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-08_15:19:24

say "-" x 10;
say "foobar" ~~ /foo <?before bar>/;
say "-" x 10;
say "foobaz" ~~ /foo <?before bar>/;
say "-" x 10;
say "foobar" ~~ /foo <?after bar>/;
say "-" x 10;
say "foobar" ~~ /<?after bar> foo/;
say "-" x 10;
say "foobar" ~~ /foo <?before bar>/;
say "-rx" x 10;
say "foobar" ~~ rx{ foo <?before bar> };
say "-" x 10;
say "-if rx" x 10;
say "foobar" if rx{ foo <?before bar> };
say "-" x 10;
say ~$/ if /\d\d <?{$/ == 42}>/ for <A12 B34 C42 D50>;
say "# -------- Begin my tests ------------------------------------";
say "-myTests " x 10;
say ~$/ if "Hello world" ~~ /<[Hh]> ello <?before world>/;
say "-myTests " x 10;
say ~$/ if "Helloworld" ~~ /<[Hh]> ello <?before world>/;
say "-myTests " x 10;
say ~$/ if "Helloworld" ~~ / <?before world> <[Hh]> ello /;
say "-myTests " x 10;
say ~$/ if "Helloworld" ~~ / <!before world> <[Hh]> ello /;
say "-myTests " x 10;
say "# -------- End my tests ------------------------------------";
say "-" x 10;
say "Matched $/" if "A12B34D50" ~~ /(\D) <?{ say ~$0}> \d\d$/;
say "-" x 10;
