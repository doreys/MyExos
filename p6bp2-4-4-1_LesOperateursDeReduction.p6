#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p6bp2-4-4-1_LesOperateursDeReduction.p6
* Creation Date : Mon Dec 17 13:52:21 2018
* Last Modified : Mon Dec 17 14:06:09 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

my @nombres = 1..5;
my $somme = [+] @nombres;       # 15:  1 + 2 + 3 + 4 + 5
my $produit = [*] @nombres;     # 120: 1 * 2 * 3 * 4 * 5

say "Somme de @nombres [ {@nombres} ]: $somme";
say "Produit de @nombres [ {@nombres} ]: $produit";

my $x = [<] @nombres;   # vrai si les éléments de @y sont triés par ordre ascendant
my $z = [>] @nombres;   # vrai si les éléments de @y sont triés par ordre descendant


say "... < ... < ... [ {@nombres} ]: $x";
say "... > ... > ... [ {@nombres} ]: $z";
