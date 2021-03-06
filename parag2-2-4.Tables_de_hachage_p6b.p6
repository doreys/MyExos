#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag2-2-4.Tables_de_hachage_p6b.p6
* Creation Date : Fri Oct  5 23:03:54 2018
* Last Modified : Sat Oct  6 00:00:30 2018
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
say %boissons<Angleterre>;     # imprime 'Tea'@@:wq

my %hash = qw (jan  1 fev 2 mar 3 avr 4 mai 5 jun 6);
say %hash;    # imprime: ("jan" => "1", "fev" => "2", "mar" => "3",
              # "avr" => "4", "mai" => "5", "jun" => "6").hash

say values %hash;    # imprime 1 2 3 4 5 6
say %hash.keys;      # imprime jan fev mar avr mai jun
say $_ for %hash.pairs;
for %hash.kv -> $a,$b {
	say "$a     $b";
}
