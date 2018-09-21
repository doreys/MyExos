#!/usr/bin/env perl6  

use v6;

# Program: p117.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-03_23:55:51

my $string = "yellow submarine";
say ~$0 if $string ~~ / l (.) w .* rin/;
