#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : DelegationDeMethodes.p6
* Creation Date : Mon Jul 30 19:56:31 2018
* Last Modified : Mon Jul 30 19:56:42 2018
* Email Address : sdo@MacBook-Pro-de-SDO.local
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class ClasseBase {
    method azincourt() { 1415 }
    method marignan()  { 1515 }
    method waterloo()  { 1815 }
}
class Utilise {
    has $.base is rw handles <marignan waterloo>
}

my $a = Utilise.new;
$a.base = ClasseBase.new(); # Mise en place d'un objet handler;
say $a.marignan;
say $a.waterloo;
say $a.azincourt;
