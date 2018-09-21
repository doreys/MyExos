#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: p172.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-10-03_16:33:28

say [+] 1,2,3,4;
say [\+] 1,2,3,4;
say fact 10;
say [<] 1,2,3,4;
say [>] 1,2,3,4;
say [lt] <a b e c>;

sub fact(Int $x){
	[*] 1..$x;
}
