#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p6b-p3_7-2-1_ExceptionsNonGenerees.p6
* Creation Date : Tue Jul  2 21:22:01 2019
* Last Modified : Tue Jul  2 21:22:29 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

my @files = </etc/passwd /etc/shadow inexistant>;
my @handles = hyper map { open($_) }, @files; # Implémentation de hyper non finalisée
