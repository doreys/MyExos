#!/usr/bin/env perl6  

use v6;

# Program: p121.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-06_14:24:36

my $string = "superlative";
say "∂  Δδ 	";
say "-" x 10;

say ~$/ if 'Bond 007' ~~ /\w\D\s\d\d\d/; # nd 007
say ~$/ if 'Bond 007' ~~ /\w\w\s\d\d\d/; # nd 007
say ~$/ if 'Bon1 007' ~~ /\w\D\s\d\d\d/; # does not match
say ~$/ if 'Bon1 007' ~~ /\w\d\s\d\d\d/; # n1 007
say "in a string $/" if 'Bon1 007' ~~ /\w\d\s\d\d\d/; # n1 007
say "-" x 10;
say "Not an hex number '$string'." if $string ~~ /<-[0..9 a..f A..F] >/;
say "-" x 10;
say ~$/ if "-17.5" ~~ /(<[\d.-]>+)/;
say "-" x 10;
say ~$/ if 'Bond 007' ~~ /\w\D\s\d\+/;
say ~$/ if 'Bond 007' ~~ /\w\D\s\d+/;
