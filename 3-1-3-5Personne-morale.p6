#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : 3-1-3-5Personne-morale.p6
* Creation Date : Wed Aug 29 22:39:15 2018
* Last Modified : Wed Aug 29 22:52:27 2018
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

class Personne-morale does Personne-details {
    has Str $.nom is rw;
    has Personne-privée $.contact is rw;
    has Date $.date-de-création;
    has Date $.date-de-dissolution is rw = Date; # non définie à la création
    
    method dissout (Date $date-de-fin) {
        $.date-de-dissolution = $date-de-fin;
    }
    method sérialise {
        qq:to/END/;
        Nom : {$!nom.gist}
        Adresse :\n {$.adresse.sérialise}
        Téléphone : $!telephone-fixe
        Contact: {$!contact.prénom, $!contact.nom}
        Date de création :  $.date-de-création
        END
    }
}

my $adresse1 = Adresse.new( numéro => "24 bis",
                            voie => "rue des Fours à pain",
                            code-postal => "69007",
                            commune => "Lyon"
                          );

my $adresse2 = $adresse1.clone(numéro => "42", voie => "rue Pasteur");

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

my $assoc = Personne-morale.new(
    nom => "Club de photo de Trifouilly-les-Oies",
    contact => $xavier,
    date-de-création => Date.new("2015-11-15"),
    adresse => $adresse2,
    telephone-fixe => $xavier.telephone-fixe,
);
say $assoc.sérialise;
