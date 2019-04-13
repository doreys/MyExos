#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag4-1-6-2.MéthodesDeClasse.p6
* Creation Date : Sat Sep 22 13:42:15 2018
<<<<<<< HEAD
* Last Modified : Tue Sep 25 00:36:38 2018
=======
* Last Modified : Mon Sep 24 23:04:11 2018
>>>>>>> 9e6d34c625ff056c9bf61e2ed6bc507a8d58dd69
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
    sub nouveau-matricule { return ++$matricule-courant; }
    our sub valeur-matricule-courant { return $matricule-courant; }
}

#say "Matricule courant = ", Employé.valeur-matricule-courant;; # ERREUR
# Undeclared routine:
#     valeur-matricule-courant used at line ...

<<<<<<< HEAD
say Employé::matricule-courant;
=======
>>>>>>> 9e6d34c625ff056c9bf61e2ed6bc507a8d58dd69
say "Matricule courant = ", Employé::valeur-matricule-courant;
