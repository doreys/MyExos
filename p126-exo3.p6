#!/usr/bin/env perl6  

use v6;

# Program: p126-exo3.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-09_17:18:40

my @a = <a b c d e>;
say @a[0];
my $num=0;
my $str="This is a sentence 01234567890 dzeez";
my @astr=$str.split(" ");

prompt_message("Test n°" ~ $num++ ~ " with regexp");
say ~$0 if $str ~~ /^(\w+)/;
prompt_message("Test n°" ~ $num++ ~ " with array");
say @astr[0];

say ~$0 if $str ~~ /<< (\d ** 10) >>/;

sub prompt_message(Str $s){
	say $s;
}
