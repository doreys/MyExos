#!/usr/bin/env perl6  

use v6;

# Program: p126-exo5.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-09_22:22:52

my $string = "Democracy is the worst form of government, " ~
		"except for all the others. (Churchill)";

say "$string";
say ~$/ if $string ~~ /\W (<[aeiou]> \w+)/;
say ~$/ if $string ~~ /\W (<[aeiou]> \w*)/;
say ~$0 if $string ~~ /\W (<[aeiou]> \w*)/;
say ~$/ if $string ~~ /<< (<[aeiou]> \w*)/;
say ~$0 if $string ~~ /<< (<[aeiou]> \w*)/;

# exemple from https://docs.perl6.org/language/regexes#%3C|w%3E_and_%3C!|w%3E,_word_boundary
say "# exemple from https://docs.perl6.org/language/regexes#%3C|w%3E_and_%3C!|w%3E,_word_boundary";

my $str = 'The quick brown fox';
say "$str";
say 'so $str ~~ /br/';              # OUTPUT: «True␤» 
say so $str ~~ /br/;              # OUTPUT: «True␤» 
say 'so $str ~~ /<< br/';           # OUTPUT: «True␤» 
say so $str ~~ /<< br/;           # OUTPUT: «True␤» 
say 'so $str ~~ /br >>/';           # OUTPUT: «False␤» 
say so $str ~~ /br >>/;           # OUTPUT: «False␤» 
say 'so $str ~~ /own/';             # OUTPUT: «True␤» 
say so $str ~~ /own/;             # OUTPUT: «True␤» 
say 'so $str ~~ /<< own/';          # OUTPUT: «False␤» 
say so $str ~~ /<< own/;          # OUTPUT: «False␤» 
say 'so $str ~~ /own >>/';          # OUTPUT: «True␤» 
say so $str ~~ /own >>/;          # OUTPUT: «True␤» 
