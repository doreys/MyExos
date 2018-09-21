#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : 3-1-2-Adresse.p6
* Creation Date : Wed Aug  1 00:20:05 2018
* Last Modified : Mon Aug  6 23:25:13 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
		https://docs.perl6.org/type/Mu
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
my $adresse2 = $adresse1.clone( numéro => "25 bis" );
say $adresse1.does("sérialise");
say $adresse1.does(Adresse); # True because $adresse1 is a subclass of Adresse
say "Adresse 1 :\n", $adresse1.sérialise;
say "Adresse 2 :\n", $adresse2.sérialise;

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

for 1..4 -> $num { 
    say "Adresse n° $num\n", @nouv_adresses[$num].sérialise;
}
