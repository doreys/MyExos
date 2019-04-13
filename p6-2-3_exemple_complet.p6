#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p6-2-3_exemple_complet.p6
* Creation Date : Tue Jan  1 15:52:03 2019
* Last Modified : Tue Jan  1 23:02:01 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

multi sub prefix:<-> (Pair $x) is equiv(&prefix:<->) {
	# opposé d'un nombre complexe
	- $x.key => - $x.value;
}

multi sub infix:<+> (Pair $x, Pair $y) is equiv(&infix:<+>) {
	# somme de nombres complexe
	my $key = $x.key + $y.key; 
	my $val = $x.value + $y.value; 
	return $key=>$val
}

multi sub infix:<*> (Pair $x, Pair $y) is equiv(&infix:<*>) {
	# produit de nombres complexes
	my $key = $x.key * $y.key - $x.value * $y.value; 
	my $val = $x.key * $y.value + $x.value * $y.key; 
	return $key=>$val
}

my $a = 4=>3; # une paire pour le complexe 4 + 3i

say - $a; # imprime -4 => -3

my $b = 5=>7;

say $a + $b; # imprime 9 => 10

my $c = 3.5 => 1/3; # NB: Perl 6 stocke en interne le rationnel

# (classe Rat) 1/3, pas 0.333...

my $d = 1/2 => 2/3; # idem pour 2/3

say $c + $d; # imprime 4.0 => 1.0;

say $c +(1/2=>4/3); # imprime 4.0 => <5/3>;

say $a * $b; # imprime -1 => 43

say $c * $d; # imprime <55/36> => 2.5

say $c + $a * $b; # imprime 2.5 => <130/3>;

# bien comme : say $c + ($a * $b);
