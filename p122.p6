#!/usr/bin/env perl6  

use v6;

# Program: p122.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-06_22:56:02

say "-" x 10;
say ~$/ if 'aabaababa' ~~ / .+? b /; # Frugal version
say "-" x 10;
say ~$/ if 'aabaababa' ~~ / .+ b /;
my $r= ~$/;# if 'aabaababa' ~~ / .+ b /;
say "-" x 10;
say "With match from string:","aabaabab".match(/$r/);
say "-" x 10;
say "With equal operator:",correction($r,"aabaabab");
say "-" x 10;
my $string="123";
say $string,' Is a number < 1,000' if $string ~~ /^ \d ** 1..3 $ /;
say "-" x 10;
my $num=1234;
say $num,' is a ',$num.Str.chars,' digits number';
my $nus=$num.Str;
say 'Special test match in a string with \d:',$num,' is a ',$nus.match(/[\d]+/),' digits number';
say 'Special test match in a string with <[0..9]>+:',$num,' is a ',$nus.match(/<[0..9]>+/),' digits number';
say "Test",$num,' is a ',$num.Str.chars,' digits number' if $num ~~ / ^ \d ** 3 $/;
say "-" x 10;


sub correction($r,$a){
	return $r eq $a;
}
