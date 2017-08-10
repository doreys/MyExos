#!/usr/bin/env perl6  

use v6;

# Program: p127.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-10_23:39:18

my $string="Christmas : 2017-08-10_23:39:18";

say ~$/[0] if $string ~~ /(\d**4[\-\d\d]**2)/;
