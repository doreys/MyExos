#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : 3-3-3-1.FraisBancaire.p6
* Creation Date : Tue Sep 11 23:21:17 2018
* Last Modified : Wed Sep 12 00:06:10 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

subset NumString of Str where /^<[\d\s]>+$/;

class Client {
    has NumString $.num_client;
    has Date $.date-d'activation;
    has Date $.date-désactivation is rw = now.Date; #
    has Bool $.client-actif is rw = True; # valeur par défaut à la construction

    method sérialise-client {
        my $détails-client = "Numéro de client : $.num_client\n"
                           ~ "Date d'activation : $.date-d'activation\n"
                           ~ "Client actif : {$.client-actif ?? 'Oui' !! 'Non'} \n";
        $détails-client  ~= "Date de désactivation = $.date-désactivation\n" unless $.client-actif;
        return $détails-client;
    }

    method résilie-client (Date $date-désact = Date.today) {
        $!date-désactivation = $date-désact;
        $.client-actif = False;
    }
}

class Adresse {
    has Str $.numéro where /^\d+ \s* [bis|ter]?$/;
    has Str $.voie;
    has Str $.commune;
    has NumString $.code-postal ;

    method gist {
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

role Pers-morale-role does Personne-details {
    has Str $.nom is rw;
    has Personne-privée $.contact is rw;
    has Date $.date-de-création;
    has Date $.date-de-dissolution is rw = Date; # non définie à la création

    method dissout (Date $date-de-fin) {
        $.date-de-dissolution = $date-de-fin;
    }
    method sérialise {
        qq:to/END/;
        Nom : $!nom
        Adresse :\n {$.adresse.sérialise}
        Téléphone : {$.telephone-fixe}
        Contact: {$!contact.prénom, $!contact.nom}
        Date de création :  $.date-de-création
        END
    }
}

class Entreprise does Pers-morale-role {
    has Int $.capital is rw; # le capital social peut changer
    has NumString $.siret;
    has Personne-privée $.gérance is rw;
    has Str $.secteur-d'activité;
    # ...
    method modifie-capilal (Int $nouveau-capital) {
        $!capital = $nouveau-capital;
    }
    method nouveau-gérant (Personne-privée $nouv-gérant) {
        $!gérance = $nouv-gérant;
    }
    method gist {
        qq:to/FIN/;
        {$.sérialise}
        Secteur d'activité : $!secteur-d'activité
        Siret : $!siret
        Gérance = {$.gérance.sérialise-personne}
        FIN
    }
    # ...
}

class Compte {
    has NumString $.num-compte;
    has Client $.client-titulaire;
    has Date $.date-d'activation-compte;
    has Date $.date-de-résiliation-compte is rw;
    has Rat $.solde is rw;
    has Bool $.compte-actif is rw = True;

    method dépose (Rat $dépôt) {
        $.solde += $dépôt;
    }
    method retire (Rat $retrait) {
        say "Solde $.solde insuffisant pour retrait de $retrait"
            and return -1 if $retrait > $.solde;
        $.solde -= $retrait;
        return $.solde;
    }
    method résilie (Date $date) {
        # ...
    }
    method sérialise-compte {
        my $détails-compte = "Numéro de compte : $.num-compte\n";
        $détails-compte ~= "Date d'activation du compte : $.date-d'activation-compte\n";
        $détails-compte ~=  $.client-titulaire.sérialise-client;
        $détails-compte ~=  "Solde du compte : $.solde \n";
    }
}

#`[
role Frais-bancaire {
  method retire (Rat $retrait) {
    say "Solde $.solde insuffisant pour retrait de $retrait"
        and return -1 if $retrait > $.solde;
    say "Retrait avec frais";
    $.solde -= $retrait + 0.50; # 0,50: frais (codé en dur)
    return $.solde;
  }
}

class Compte-avec-frais is Compte does Frais-bancaire {};
]

role Frais-bancaire [Rat $amount] {
  method retire (Rat $retrait) {
    say "Solde $.solde insuffisant pour retrait de $retrait"
        and return -1 if $retrait > $.solde;
    say "Retrait avec frais";
    $.solde -= $retrait + $amount; # $amount: frais passé en argument
    return $.solde;
  }
}

#--------------------------
#class Compte-avec-frais is Compte does Frais-bancaire[0,5] {};
class Compte-avec-frais is Compte does Frais-bancaire[Rat.new(0,5)] {};
#--------------------------
my $nouvelle-rue = "rue Jean d'Ormesson";
my $cp = "13003";
my $ville = "Marseille";
my @nouv_adresses;
@nouv_adresses[$_] = Adresse.new( numéro => "$_",
                                 voie => $nouvelle-rue,
                                 code-postal => $cp,
                                 commune => $ville,
                               )
                               for 1..10;

my $sarl = Entreprise.new(
    nom => "SARL Belkacem Frères",
    secteur-d'activité => "Restauration",
    siret => "507865432 10",
    adresse => Adresse.new(
        numéro => "7 bis",
        voie => "rue Léon Gambetta",
        code-postal => "69100",
        commune => "Villeurbanne",
    ),
    gérance => Personne-privée.new(
        prénom => "Yacine",
        nom => "Belkacem",
        sexe => "M",
        adresse => @nouv_adresses[5],
        telephone-mobile => "06 08 07 06 07",
    ),
    contact => Personne-privée.new(
        prénom => "Fadila",
        nom => "Belkacem",
        sexe => "F",
        adresse => @nouv_adresses[5],
        telephone-mobile => "06 08 07 06 08",
    ),
    date-de-création => Date.new("2013-05-16"),
    telephone-fixe => "04 09 08 07 06",
);
#say $sarl;

class Client-société is Client {
    has Entreprise $.société is rw;  # une société peut changer de raison sociale

    method sérialise {
        return $.sérialise-client ~ $.société.gist;
     }
}

my $cli-sarl = Client-société.new(
    société => $sarl,
    num_client => "0123456789",
    date-d'activation => Date.new("2015-11-14")
);

my $compte-bancaire = Compte-avec-frais.new(
					    num-compte => "987654321",
					    client-titulaire => $cli-sarl,
					    solde => 500.00,
					    date-d'activation-compte => Date.new("2018-02-15"),
					);

$compte-bancaire.retire(400.00);
say "Solde après premier retrait : ", $compte-bancaire.solde;
$compte-bancaire.dépose(100.00);
say "Solde après premier dépôt : ", $compte-bancaire.solde;
my $resultat = $compte-bancaire.retire(400.Rat);
say "Retrait impossible" if $resultat <0;
