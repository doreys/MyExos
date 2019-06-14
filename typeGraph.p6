#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : typeGraph.p6
* Creation Date : Tue Jun 11 12:06:07 2019
* Last Modified : Tue Jun 11 12:06:21 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

use Perl6::TypeGraph;

# create and initialize it
my $tg = Perl6::TypeGraph.new-from-file("./resources/type-graph.txt");

# and use it!
say $tg.sorted;
