#!/usr/bin/env perl6

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag2-1_p6b.p6
* Creation Date : Fri Oct  5 13:47:46 2018
* Last Modified : Fri Oct  5 13:48:32 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

use v6; # utilisation de Perl 6

# ceci est un commentaire

#`{ Ceci
est un
commentaire multiligne }

my $cinq = 5;
print "une chaine avec interpolation, comme en Perl $cinq\n";
say 'say() ajoute un caractere fin de ligne, comme en Perl 5 (à partir de Perl 5.10)';

my @array = 1, 2, 3, 'toto';
my $sum = @array[0] + @array[1];
if $sum > @array[2] {
    say "non execute";
}
my $nombre_d_elements = @array.elems;     # ou: +@array
my $dernier = @array[*-1];

my %hash = un => 1, deux => 2, trois => 3;
say %hash{'deux'};         # 2
say %hash<trois>;          # 3 pareil, sans guillemets ni apostrophes
# Ceci est une erreur en Perl 6 : %hash{bar}
# (car on cherche ci-dessus à appeler la fonction bar(), qui n'est pas déclarée)
