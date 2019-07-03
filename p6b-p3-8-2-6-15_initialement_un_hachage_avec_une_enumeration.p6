#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p6b-p3-8-2-6-15_initialement_un_hachage_avec_une_enumeration.p6
* Creation Date : Wed Jul  3 21:48:13 2019
* Last Modified : Wed Jul  3 21:52:16 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

my @a=1,2,3,4;
my $c=0;   my %h = map { $_ => ++$c }, @a;
say %h;
%h = @a Z=> 1..*;
say %h;
%h = @a.pairs».invert;  # si l'on commence à 0
say %h;
