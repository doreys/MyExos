#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag4-1-4Voyage.p6
* Creation Date : Fri Sep 21 15:04:05 2018
* Last Modified : Fri Sep 21 15:56:56 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class Voyage {
    has $.départ;
    has $.point-de-départ;
    has $.destination;
    has @!voyageurs;
    has $.notes is rw;

    method ajoute_voyageur($nom) {
        if $nom ne any(@!voyageurs) {
            push @!voyageurs, $nom;
        }
        else {
            warn "$nom est déjà du voyage!";
        }
    }
    method décrire() {
        join " ", "De", $!départ, "à", $!destination,
                  "- Voyageurs:", @!voyageurs;
    }
}

# ------------------- Autre exemple 4-1-3. Attributs ---------------------------------

# Création d'une nouvelle instance de la classe
my $vacances = Voyage.new(
    départ  => 'Suède',
    point-de-départ  => 'Suède',
    destination      => 'Suisse',
    notes            => 'Équipement type camping!'
);

# Utilisation d'un accesseur :
say $vacances.point-de-départ;    # -> Suède

# Utilisation d'un accesseur de type rw pour modifier la valeur:
$vacances.notes = 'Équipement type camping plus lunettes de soleil';

# ------------------- Autre exemple 4-1-4. ---------------------------------
my $week-end-amoureux = Voyage.new(départ      => "Paris",
				   point-de-départ => "Paris",
                                   destination => "Londres");
$week-end-amoureux.ajoute_voyageur($_) for <Roméo Juliette Roméo>;
say $week-end-amoureux.perl;
say "Ajoute une note";
$week-end-amoureux.notes = "Eurostar";
say $week-end-amoureux.perl;
say $week-end-amoureux.décrire;
