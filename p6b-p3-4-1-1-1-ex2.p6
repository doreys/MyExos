#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p6b-p3-4-1-1-1-ex2.p6
* Creation Date : Sat Jun  1 22:26:19 2019
* Last Modified : Sat Jun  1 22:26:40 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

# qqw = qw avec interpolation des variables
my $a = 42;
my @list = qqw{$a b c};
say @list;                       # 42 b c

# qqx = qx avec interpolation des variables
my $world = "tout le monde";
say qqx{echo "Bonjour $world"};  # Bonjour tout le monde
