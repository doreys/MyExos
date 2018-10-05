#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag2-2-4.Tables_de_hachage_p6b.p6
* Creation Date : Fri Oct  5 23:03:54 2018
* Last Modified : Fri Oct  5 23:17:23 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

my %boissons =
    France  => 'Vin',
    Angleterre => 'Tea',
    USA     => 'Coke';

say "Boisson favorite en France : ",  %boissons{'France'};
say "Pays: ", %boissons.keys.sort;
say "Boissons: ", %boissons.values.sort;
