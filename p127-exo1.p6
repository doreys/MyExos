#!/usr/bin/env perl6  

use v6;

# Program: p127-exo1.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-09_21:34:46

my @phnum = <07222222221234 0612345675 0724321654 12345678902>;
my $str = "07222222221234 0612345675 0724321654 12345678902";
say "list of potential phone number ",~@phnum;
say "-" x 10, "tests not good";
say "Matched $/" if /\d ** 10 <?{$/ ~~ /^0(6|7)/}>/ for @phnum;
say "-" x 10," tests ok";
say "Matched $/" if /^(0(6||7)\d ** 8)$/ for @phnum;
say "-*" x 10, " soluce from the book";
say "list of potential phone number ",~$str;
say "Matched $0" if $str ~~ /\D(0<[67]> \d ** 8)\D/ ;
