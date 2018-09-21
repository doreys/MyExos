#!/usr/bin/env perl6  

use v6;

# Program: p113.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-03_21:25:47

say "----------------";
say $_ for split "-", "25-12-2016";
say "----------------";
for "25-12-2016".split("-") -> $val { say $val; }
say "----------------";
for "25-12-2016".split("-") -> $val { say $val; };
say "----------------";
for "25-12-2016".split("-") -> $val { say $val };
say "----------------";
.say for split ", ", "Jan, Feb, Mar"; # .say is a shortcut for $_.say
say "-------:v---------";
.perl.say for split ", ", "Jan, Feb, Mar",:v; # 
say "-------:k---------";
.perl.say for split ", ", "Jan, Feb, Mar",:k; # 
say "--------:kv--------";
.perl.say for split ", ", "Jan, Feb, Mar",:kv; # 
say "--------:p--------";
.perl.say for split ", ", "Jan, Feb, Mar",:p; # 
