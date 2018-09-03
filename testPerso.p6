#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : testPerso.p6
* Creation Date : Mon Sep  3 15:13:58 2018
* Last Modified : Mon Sep  3 15:14:08 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class Personne-privée does Personne-details {
    has Str $.nom;
    has Str $.prénom;
    has Str $.sexe where {$_ eq "M"|"F"};
    has Date $.date-de-naissance;
    has Str $.lieu-de-naissance;
    # has Adresse $.adresse is rw;
    # has Str $.telephone-fixe is rw;
    has Str $.telephone-mobile is rw;

    method civilité {
        return $.sexe eq 'M' ?? "Monsieur" !! "Madame";
    }
    method âge { sprintf "%d", (Date.today - $.date-de-naissance)/365 }
    method sérialise-personne-adresse {
        my $titre = $.civilité;
        return "\t$titre $!prénom $!nom \n {$.adresse.sérialise-adresse}";
    }
    method affiche-personne-adresse {
        say $.sérialise-personne-adresse;
    }
    method sérialise-personne {
        my $né = $.sexe eq 'M' ?? "Né" !! "Née";
        my $naissance = (defined $.date-de-naissance && defined $.lieu-de-naissance) ??
                            "$né le $!date-de-naissance à $!lieu-de-naissance (âge = {$.âge} ans)\n" !!
                            "état-civil inconnu ou incomplet\n";
        my $personne-str = "{$.civilité} $!prénom $!nom\n" ~
                           "{$naissance}Adresse :\n" ~
                           $.sérialise-personne-adresse;
        $personne-str ~= "\nTéléphone fixe : $!telephone-fixe" if defined $!telephone-fixe;
        $personne-str ~= "\nMobile : $!telephone-mobile"; # if defined $!telephone-mobile;
        return $personne-str;
    }
    method affiche-personne { say $.sérialise-personne };
}
