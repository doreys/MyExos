#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : Vacances.p6
* Creation Date : Thu Sep 13 21:42:41 2018
* @modify date 2019-07-19 14:32:56
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class Voyage {
    has $.point-de-départ;
    has $.départ;
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

# Création d'une nouvelle instance de la classe
my $vacances = Voyage.new(
    point-de-départ  => 'Suède',
    destination      => 'Suisse',
    notes            => 'Équipement type camping!'
);

# Utilisation d'un accesseur :
say $vacances.point-de-départ;    # -> Suède

# Utilisation d'un accesseur de type rw pour modifier la valeur:
$vacances.notes = 'Équipement type camping plus lunettes de soleil';

# #`[
my $week-end-amoureux = Voyage.new(départ      => "Paris",
                                   destination => "Londres");
$week-end-amoureux.ajoute_voyageur($_) for <Roméo Juliette Roméo>;
say $week-end-amoureux.perl;
say "Ajoute une note";
$week-end-amoureux.notes = "Eurostar";
say "------>",$week-end-amoureux.perl;
say $week-end-amoureux.décrire;
# ]

say Int.^mro; # Method Resolution Order
