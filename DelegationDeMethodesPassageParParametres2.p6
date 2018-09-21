#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : DelegationDeMethodesPassageParParametres2.p6
* Creation Date : Mon Jul 30 21:33:45 2018
* Last Modified : Mon Jul 30 21:38:56 2018
* Email Address : sdo@MacBook-Pro-de-SDO.local
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class ClasseBase2 {
    method avec-paramètres($x) { $x xx 3 }
    method avec-paramètres2($x,$y) { $x xx $y }
}

class Utilise2 {
    has $.base2 handles <avec-paramètres  avec-paramètres2>
}

my $a = Utilise2.new( base2 => ClasseBase2.new() );
say $a.avec-paramètres('xyz');        # -> (xyz xyz xyz)
say $a.avec-paramètres2('xyz',4);        # -> (xyz xyz xyz)
