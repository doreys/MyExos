#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : autreTests.p6
* Creation Date : Fri Sep  7 01:06:04 2018
* Last Modified : Fri Sep  7 01:11:57 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------


use Test;
plan 9;

subset NumString of Str where /^<[\d\s]>+$/;

class Adresse {
	has Str $.numéro where /^\d+ \s* [bis|ter]?$/;
	has Str $.voie;
	has NumString $.code-postal;
	has Str $.commune;

	method sérialise{
		"\t$!numéro $!voie\n" ~
		"\t$!code-postal $!commune\n";
	}
}

my $nouvelle-rue = "rue Jean d'Ormesson";
my $cp = "13003";
my $ville = "Marseille";
my %nouv_adresses;

for 1, 3, 20, "12 bis" -> $num {
    %nouv_adresses{$num} = Adresse.new(
        numéro => "$num",
        voie => $nouvelle-rue,
        code-postal => $cp,
        commune => $ville,
    );
    isa-ok  %nouv_adresses{$num}, Adresse,
        "Test construction adresse pour $num";
    ok %nouv_adresses{$num}.numéro eq $num,
        "Test sur le numero pour adresse $num";
}
eval-dies-ok q[ %nouv_adresses{"string"} = Adresse.new(
	    numéro => "string",
	    voie => $nouvelle-rue,
	    code-postal => $cp,
	    commune => $ville,
	);], "Test exception lors de la construction";
