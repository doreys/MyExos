#!/usr/bin/env perl6  

use v6;

# Program: p139.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-24_14:28:40

my $fh = open("./hello.txt",:r);
my $data = $fh.slurp-rest;
$fh.close();
say "content of the file ./hello.txt:","\n",$data;
