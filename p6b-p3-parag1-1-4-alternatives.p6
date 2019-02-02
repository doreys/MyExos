#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p6b-p3-parag1-1-4-alternatives.p6
* Creation Date : Sat Jan 19 23:46:15 2019
* Last Modified : Sat Feb  2 16:11:50 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------
#

$_ = '12 oranges';
my @fruits = <pomme orange banane kiwi>;
if m:i:s #`(m: match regex ; i: incensitive ; s: sigspace space not ignored ) / (\d+) (@fruits)s? / {
    say "Vous avez $0 $1s, j'en ai { $0 + 2 }. Vous avez perdu.";
}
