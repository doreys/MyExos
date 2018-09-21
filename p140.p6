#!/usr/bin/env perl6  

use v6 ; 

# Program: p140.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-24_14:56:20

my $text = slurp "./hello.txt" ; 
say "$text" ; 
$text = "./hello.txt".IO.slurp ; 
say "$text" ; 

my $file = "./text.txt"  ; 
my @lines = "./text.txt".IO.lines ; 

say "line 0 ---->", @lines[0] ; 
say "line 6 ---->", @lines[6] ; 
say "-" x 20 ;

for "./text.txt".IO.lines -> $line {
	say "$line" ; 
}

my $fhw = open("./hello.txt",:w) ; 
$fhw.say("line to be written to a file") ; 
$fhw.close ; 
my $fha = open("./hello.txt",:a) ; 
$fha.say("line to be written to a file") ; 
$fha.close ; 
