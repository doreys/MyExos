#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : ExoBanque.p6
* Creation Date : Wed Aug  1 03:43:02 2018
* Last Modified : Wed Aug  1 03:50:36 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

subset NumString of Str where /^<[\d\s]>+$/;

class Adresse {
    has Str $.numéro where /^\d+ \s* [bis|ter]?$/;
    has Str $.voie;
    has Str $.commune;
    has NumString $.code-postal ;

    method sérialise {
        "\t$!numéro $!voie\n" ~
        "\t$!code-postal $!commune";
    }
}

role Personne-details {
    has Adresse $.adresse is rw;
    has NumString $.telephone-fixe is rw;

    method déménage (Adresse $nouvelle-adresse) {
        $.adresse = $nouvelle-adresse;
    }
    method change-telephone-fixe (NumString $num-appel) {
        $.telephone-fixe = $num-appel
    }
}

class Personne-privée does Personne-details {
    has Str $.nom;
    has Str $.prénom;
    has Str $.sexe where {$_ eq "M"|"F"};
    has Date $.date-de-naissance;
    has Str $.lieu-de-naissance;
    has Str $.telephone-mobile is rw;

    method affiche-personne {dd self};
    method âge {sprintf "%d", (Date.today-$.date-de-naissance)/365.25}
    method affiche-personne-adresse {
        my $titre = $.sexe eq 'M' ?? "Monsieur" !! "Madame";
        say "\t$titre $!prénom $!nom";
        say $.adresse.affiche-adresse;
    }
}

my $adresse1 = Adresse.new( numéro => "24 bis",
                            voie => "rue des Fours à pain",
                            code-postal => "69007",
                            commune => "Lyon"
                          );

my $xavier = Personne-privée.new(
    prénom => "Xavier",
    nom => "Sirvenne",
    sexe => "M",
    date-de-naissance => Date.new("1998-02-08"),
    lieu-de-naissance => "Brest",
    adresse => $adresse1,
    telephone-fixe => "04 01 02 03 04",
    telephone-mobile => "06 05 04 03 02",
);

$xavier.affiche-personne;
say "Âge de {$xavier.prénom} : {$xavier.âge} ans";
say "Adresse de {$xavier.prénom, $xavier.nom} :";
$xavier.affiche-personne-adresse;
say "Changement d'adresse";
$xavier.déménage($adresse2);
$xavier.affiche-personne-adresse;
say "Changement de téléphone fixe";
$xavier.change-telephone-fixe("04 02 03 04 05");
say "Nouveau numéro de téléphone de {$xavier.prénom, $xavier.nom} : ", $xavier.telephone-fixe;
