#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag4-1-4Voyage.p6
* Creation Date : Fri Sep 21 15:04:05 2018
* Last Modified : Fri Sep 21 15:29:46 2018
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

my $week-end-amoureux = Voyage.new(départ      => "Paris",
                                   destination => "Londres");
$week-end-amoureux.ajoute_voyageur($_) for <Roméo Juliette Roméo>;
say $week-end-amoureux.perl;
say "Ajoute une note";
$week-end-amoureux.notes = "Eurostar";
say $week-end-amoureux.perl;
say $week-end-amoureux.décrire;
