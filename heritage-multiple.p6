#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : heritage-multiple.p6
* Creation Date : Thu Jul 19 23:38:08 2018
* Last Modified : Thu Jul 19 23:40:09 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
		https://perl6intro.com/fr/#_h%C3%A9ritage_multiple
]
# ------------------------------------------------------


class barre-graph {
  has Int @.barre-valeurs;
  method dessiner {
    say @.barre-valeurs;
  }
}

class ligne-graph {
  has Int @.ligne-valeurs;
  method dessiner {
    say @.ligne-valeurs;
  }
}

class combo-graph is barre-graph is ligne-graph {
}

my $ventes-réelles = barre-graph.new(barre-valeurs => [10,9,11,8,7,10]);
my $ventes-prévisions = ligne-graph.new(ligne-valeurs => [9,8,10,7,6,9]);

my $réelles-vs-prévisions = combo-graph.new(barre-valeurs => [10,9,11,8,7,10],
                                            ligne-valeurs => [9,8,10,7,6,9]);
say "Ventes Réelles:";
$ventes-réelles.dessiner;
say "Ventes Prévisionelles:";
$ventes-prévisions.dessiner;
say "Réelles vs Prévisionelles:";
$réelles-vs-prévisions.dessiner;
