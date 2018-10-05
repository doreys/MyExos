#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag4-2-4._Rôles_paramétrés.p6
* Creation Date : Sat Sep 29 21:43:30 2018
<<<<<<< HEAD
* Last Modified : Wed Oct  3 21:20:34 2018
=======
* Last Modified : Wed Oct  3 01:15:44 2018
>>>>>>> 9e6d34c625ff056c9bf61e2ed6bc507a8d58dd69
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
            $branche.visite-préordre(&cb) if defined $branche;
        }
    }
    method visite-postordre(&cb) {
        for $.gauche, $.droite -> $branche {
            $branche.visite-postordre(&cb) if defined $branche;
        }
        cb $.noeud;
    }
    method nouv-de-la-liste(::?CLASS:U: *@el) { # for class methods
        my $index-milieu = @el.elems div 2; # we get number of elements from the list then we divide it by two
        my @gauche       = @el[0 .. $index-milieu - 1]; # we take from the list the  first element till the one that is before the on in the middle of the list
        my $milieu       = @el[$index-milieu]; # wetake the one in the middle
        my @droite       = @el[$index-milieu + 1 .. *]; # we we take to the next element after the one that is in the middle then we'll take the last from the list
        self.new(   # self that's the class
            noeud   => $milieu, # value of the node
            gauche  => @gauche  ?? self.nouv-de-la-liste(@gauche) # we create a new objet left side
                                !! self,
            droite  => @droite ?? self.nouv-de-la-liste(@droite) # we create a new objet right side
                               !! self,
        );
    }
}

my $t = ArbreBinaire[Int].nouv-de-la-liste(4, 5, 6);
$t.visite-préordre(&say);    # 5 \n 4 \n 6
$t.visite-postordre(&say);   # 4 \n 6 \n 5
