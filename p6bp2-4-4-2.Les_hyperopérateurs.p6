#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p6bp2-4-4-2.Les_hyperopérateurs.p6
* Creation Date : Mon Dec 17 14:21:25 2018
* Last Modified : Mon Dec 17 14:32:06 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

my @a = 1..5;
my @b = 6..10;
my @c = 5 <<*>> @b;
say "my @c = 5 <<*>> @b ({ @b }) => { @c } ";   # imprime 30 35 40 45 50
say @c;              # imprime 30 35 40 45 50
my @d = @a >>*<< @b;
say "my @d = @a >>*<< @b ({ @b }) => { @d }";
say @d;              # imprime 6 14 24 36 50
# @d = 1*6, 2*7, 3*8, 4*9, 5*10

@a = 1..5;
@b = 6..10;
@c = 5 «*» @b;
say @c;              # imprime 30 35 40 45 50 (5*6, 5*7, 5*8 ...)
@d = @a »*« @b;
say @d;              # imprime 6 14 24 36 50 (1*6, 2*7, 3*8, ...)

my @a = 2, 4, 6;
say -<< @a;          # imprime  -2 -4 -6

say @a >>+<< @b;   # @a et @b doivent avoir la même taille
say @a <<+<< @b;   # @a peut-être plus petit
say @a >>+>> @b;   # @b peut-être plus petit
say @a <<+>> @b;   # L'un ou l'autre peut être plus petit, Perl fera ce que vous voulez dire (DWIM)
say @x >>+=<< @y   # Même chose que @x = @x >>+<< @y
