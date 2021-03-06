#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag4-1-6-2.MéthodesDeClasse-v2.p6
* Creation Date : Sat Sep 22 13:42:15 2018
* Last Modified : Tue Sep 25 00:56:28 2018
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
    our sub nouveau-matricule { return ++$matricule-courant; }
    our sub valeur-matricule-courant { return $matricule-courant; }
}

#say "Matricule courant = ", Employé.valeur-matricule-courant;; # ERREUR
# Undeclared routine:
#     valeur-matricule-courant used at line ...

#say Employé::matricule-courant;
say "Methode de classe Matricule courant = ", Employé::valeur-matricule-courant;
say "Methode de classe increm ", Employé::nouveau-matricule;
say "Methode de classe affiche ", Employé::valeur-matricule-courant;

my $salarié = Employé.new(
    données-personnelles => Personne.new(
        nom => "Jean",
        prénom => "Chiponelli",
        sexe => "M",
        date-de-naissance => Date.new(1992, 10, 24),
        lieu-de-naissance => "Strasbourg",
        adresse => Adresse.new( numéro => 42, voie => "boulevard Carnot",
                                commune => "Nice", code-postal => "06000"
        ),
        numéro-sécu => "1-92-10-67...",  telephone-personnel => "0712345678"
    ),
    intitulé-poste => "technicien de surface",
    salaire => 1234.5
);

say "Matricule de l'employé : {$salarié.matricule}";
say "Méthode de classe affiche ", Employé::valeur-matricule-courant;
say "Methode de classe increm ", Employé::nouveau-matricule;
say "Méthode de classe affiche ", Employé::valeur-matricule-courant;

my $salarié2 = Employé.new(
    données-personnelles => Personne.new(
        nom => "Jean",
        prénom => "Chiponelli",
        sexe => "M",
        date-de-naissance => Date.new(1992, 10, 24),
        lieu-de-naissance => "Strasbourg",
        adresse => Adresse.new( numéro => 42, voie => "boulevard Carnot",
                                commune => "Nice", code-postal => "06000"
        ),
        numéro-sécu => "1-92-10-67...",  telephone-personnel => "0712345678"
    ),
    intitulé-poste => "technicien de surface",
    salaire => 1234.5
);
say "Matricule de l'employé : {$salarié2.matricule}";
