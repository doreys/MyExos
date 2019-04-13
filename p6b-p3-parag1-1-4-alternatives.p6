#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p6b-p3-parag1-1-4-alternatives.p6
* Creation Date : Sat Jan 19 23:46:15 2019
* Last Modified : Mon Feb  4 00:00:37 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
		macbook-pro-de-sdo:tp6 sdo$ ./p6b-p3-parag1-1-4-alternatives.p6
		Vous avez 12 oranges, j'en ai 14. Vous avez perdu.
]
# ------------------------------------------------------
#

$_ = '12 oranges';
my @fruits = <pomme orange banane kiwi>;
if m:i:s #`(m: match regex ; i: incensitive ; s: sigspace space not ignored ) / (\d+) #`{match one or more digit(s) }  (@fruits)s? #`( make it match one of the element of the array @fruits and then put one s or not at the end of the matched element from the array @fruits ) / {
    say "1. Vous avez $0 $1s, j'en ai { $0 + 2 }. Vous avez perdu.";
}
if m:i:s/ (\d+) (@fruits)s? / {
    say "2. Vous avez $0 $1s, j'en ai { $0 + 2 }. Vous avez perdu.";
}
if m:i:s/^ (\d+) (@fruits)s? $/ {
    say "3. Vous avez $0 $1s, j'en ai { $0 + 2 }. Vous avez perdu.";
}
if m:i:s/^ (\d+)  (@fruits)s? $/ {
    say "4. Vous avez $0 $1s, j'en ai { $0 + 2 }. Vous avez perdu.";
}
if m:i / (\d+) (@fruits)s? / {
    say "4. Vous avez $0 $1s, j'en ai { $0 + 2 }. Vous avez perdu.";
}
if m:i /^ (\d+)  (@fruits)s? $/ {
    say "5. Vous avez $0 $1s, j'en ai { $0 + 2 }. Vous avez perdu.";
}
if m:i / (\d+) ' ' (@fruits)s? / {
    say "6. Vous avez $0 $1s, j'en ai { $0 + 2 }. Vous avez perdu.";
}
