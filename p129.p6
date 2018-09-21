#!/usr/bin/env perl6  

use v6;

# Program: p129.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-17_23:41:35

my $string="IP address: 17.125.246.28;";

say "Sol 1: using character class                  ------------------";
say ~$0 if $string ~~ /(<[\d.]>+)/; # Using Character Class
say "Sol 2: using character class and quantifier   ------------------";
say ~$0 if $string ~~ /(<[\d.]> ** 7..15)/; # Using Character Class and quantifier
say "Sol 3: using a more detailed of the IP format ------------------";
say ~$0 if $string ~~ /([\d ** 1..3 \.] ** 3 \d ** 1..3)/; # using a more detailed of the IP format
say "Sol 4: using subpatterns as building blocks   ------------------";
my $octet= rx/\d ** 1..3/;
say ~$0 if $string ~~ /([<$octet> \.] ** 3 \d ** 1..3)/; # using subpatterns as building blocks
say "Sol 5: using a more refine definition of subpatterns ------------------";
$octet= rx/<[1..2]>? \d ** 1..2/;
say ~$0 if $string ~~ /([<$octet> \.] ** 3 <$octet>)/; # using a more refine definition of subpatterns
say "Sol 6: using a more accurate and refine definition of subpatterns ------------------";
$octet= rx{
	(
		25 <[0..5]> 	 # 250 to 255
		|| 2 <[0..4]> \d # 200 to 249
		|| 1 \d ** 2	 # 100 to 199 
		|| \d ** 2	 # 0 to 99
	)
	  };
say ~$/ if $string ~~ /([<$octet> \.] ** 3 <$octet>)/; # using a more accurate and refine definition of subpatterns

say "Sol 7: using a more accurate with code assertion  ------------------";
$octet = rx {(\d ** 1..3) <?{ 0 <= $0 <= 255 }>};
say ~$/ if $string ~~ /([<$octet> \.] ** 3 <$octet>)/
