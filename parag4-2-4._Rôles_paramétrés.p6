#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag4-2-4._Rôles_paramétrés.p6
* Creation Date : Sat Sep 29 21:43:30 2018
* Last Modified : Sat Sep 29 21:44:32 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

role ArbreBinaire[::Type] {
    has ArbreBinaire[Type] $.gauche;
    has ArbreBinaire[Type] $.droite;
    has Type $.noeud;

    method visite-préordre(&cb) {
        cb $.noeud;
        for $.gauche, $.droite -> $branche {
            $branche.visite-préordre (&cb) if defined $branche;
        }
    }
    method visite-postordre(&cb) {
        for $.gauche, $.droite -> $branche {
            $branche.visite-postordre(&cb) if defined $branche;
        }
        cb $.noeud;
    }
    method nouv-de-la-liste(::?CLASS:U: *@el) {
        my $index-milieu = @el.elems div 2;
        my @gauche       = @el[0 .. $index-milieu - 1];
        my $milieu       = @el[$index-milieu];
        my @droite       = @el[$index-milieu + 1 .. *];
        self.new(
            noeud   => $milieu,
            gauche  => @gauche  ?? self.nouv-de-la-liste (@gauche)
                                !! self,
            droite  => @droite ?? self.nouv-de-la-liste (@droite)
                               !! self,
        );
    }
}

my $t = ArbreBinaire[Int].nouv-de-la-liste(4, 5, 6);
$t.visite-préordre(&say);    # 5 \n 4 \n 6
$t.visite-postordre(&say);   # 4 \n 6 \n 5
