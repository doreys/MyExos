#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : lesBlocs.p6
* Creation Date : Mon Oct  8 16:28:21 2018
* Last Modified : Mon Oct  8 17:15:21 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

my $x = -> $a, $b { say "Argument 1 : $a - Argument 2: $b"; }
$x(10, 20);
$x(3.14159265, 2.71828183);
$x("Un", "Deux");

say "-----------------------------------";
my $block;
{
  my $nom = "Sébastien";
  $block = { say $nom };
}
my $nom = "Jacques";
$block();

say "-----------------------------------";
my $compte;
{
  my $i;
  $compte = { say "valeur du compteur : ", ++$i };
}
$compte();
$compte();
$compte();
$compte();

say "-----------------------------------";
my @fois = ();
for 1..10 -> $ti {
  my $t = $ti;
  @fois[$ti] = sub ($a) { return $a * $t; };
}
say "Le produit de 3 et de 4 est egal a : ", @fois[3](4);
say "Le produit de 5 et de 30 est egal a : ", @fois[5](30);
say "Le produit de 9 et de 8 est egal a : ", @fois[9](8);

say "-----------------------------------";
my @l = (1, 2, 3, 4, 5, 6, 7, 8, 9);
for @l {
  say "$^a $^b $^c";
}
