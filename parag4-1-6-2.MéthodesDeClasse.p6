#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag4-1-6-2.MéthodesDeClasse.p6
* Creation Date : Sat Sep 22 13:42:15 2018
* Last Modified : Sat Sep 22 13:44:18 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class Adresse {
    has Int $.numéro;
    has Str $.voie;
    has Str $.commune;
    has Str $.code-postal;
    # ...
    method formate-adresse {
        "\t$!numéro $!voie\n" ~
        "\t$!code-postal $!commune";
    }
}

class Personne {
    has Str $.nom;
    has Str $.prénom;
    has Str $.sexe where {$_ eq "M"|"F"}; # ne peut être que M ou F
    has Date $.date-de-naissance;
    has Str $.lieu-de-naissance;
    has Adresse $.adresse is rw;
    has Str $.numéro-sécu;
    has Str $.telephone-personnel is rw;
    # ...
    method show-person {dd self};  # (méthode temporaire de débogage)
    method âge {
        sprintf "%d", (Date.today - $.date-de-naissance)/365
    } 
}

class Employé {
    my $matricule-courant = 0;
    has Personne $.données-personnelles;
    has Numeric $.matricule = nouveau-matricule();
    has Str $.intitulé-poste is rw;
    has Numeric $.salaire is rw;
    # ...
    sub nouveau-matricule { return ++$matricule-courant }
}
