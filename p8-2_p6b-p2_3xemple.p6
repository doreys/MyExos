#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p8-2_p6b-p2_3xemple.p6
* Creation Date : Thu Jan  3 13:54:48 2019
* Last Modified : Thu Jan  3 14:40:46 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------
#
#



my @list = 1, 5, 6, 7, 4, 0, 67, 44;

my @sorted_list_desc = sort {$^toto <=> $^titi}, @list;

say @sorted_list_desc; # affiche : 67 44 7 6 5 4 1 0

say sort {$^titi <=> $^toto}, @list; # affiche 0 1 4 5 6 7 44 67

my $block = { say $:stuff };
say $block(stuff => "147852");
# ou
#
my $sub = sub (:$stuff) { say $stuff };
