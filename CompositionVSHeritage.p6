#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : CompositionVSHeritage.p6
* Creation Date : Sun Jul 29 18:09:38 2018
* Last Modified : Mon Jul 30 20:19:04 2018
* Email Address : sdo@MacBook-Pro-de-SDO.local
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
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


class Employé {
    has Personne $.données-personnelles;
    has Numeric $.matricule;
    has Str $.intitulé-poste is rw;
    has Numeric $.salaire is rw;
    # ...
}

my $salarié = Employé.new(
    données-personnelles => Personne.new(
        nom => "Chiponelli",
        prénom => "Jean",
        sexe => "M",
        date-de-naissance => Date.new(1992, 10, 24),
        lieu-de-naissance => "Strasbourg",
        adresse => Adresse.new(
				   numéro => 42, 
				   voie => "boulevard Carnot",
				   commune => "Nice",
				   code-postal => "06000"
				), 
        numéro-sécu => "1-92-10-67...",
	telephone-personnel => "0712345678"
    ),  
    matricule => 12345,
    intitulé-poste => "Agent d'entretien",
); 


say "Matricule de l'employé : {$salarié.matricule}";
say "Âge de {$salarié.données-personnelles.nom,
    $salarié.données-personnelles.prénom} : ",
    $salarié.données-personnelles.âge;
say "Adresse : \n" ~ $salarié.données-personnelles.adresse.formate-adresse;
say "Données personnelles : ";
$salarié.données-personnelles.telephone-personnel = "069876543";
say "Nouveau numéro de téléphone : ",
    $salarié.données-personnelles.telephone-personnel;
# Affichage de l'ensemble des données-personnelles:
$salarié.données-personnelles.show-person;

#--------------------------------------------------------------

say "--------------------------------------------------------------";

class Employe-herit is Personne {
    has Numeric $.matricule;
    has Str $.intitulé-poste is rw;
    has Numeric $.salaire is rw;
    # ...
}

my $salarié2 = Employe-herit.new(
    nom => "Benali",
    prénom => "Samira",
    sexe => "F",
    date-de-naissance => Date.new(1990, 11, 17),
    # ... autres données relatives à la personne abrégées
    matricule => 54321,
    intitulé-poste => "Comptable",
    salaire => 1765.6
);

say "Âge de {$salarié2.prénom, $salarié2.nom} : ", $salarié2.âge;                # -> Âge de Samira Benali : 26
