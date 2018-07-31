#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : classeAdresse.p6
* Creation Date : Tue Jul 31 11:00:55 2018
* Last Modified : Tue Jul 31 11:06:54 2018
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

my $adresse1 = Adresse.new( numéro => "24 bis",
                            voie => "rue des Fours à pain",
                            code-postal => "69007",
                            commune => "Lyon"
                          );
say "Adresse 1 :\n", $adresse1.sérialise;
