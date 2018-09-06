#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : oneExo-P6O§3-1-2-1_CréerUneAdresse.p6
* Creation Date : Thu Sep  6 15:22:49 2018
* Last Modified : Thu Sep  6 16:13:18 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
taken from: https://laurent-rosenfeld.developpez.com/tutoriels/perl/perl6/objets/#L3-1-2-1

Create a class called Address:
	From the following code try to create the address from P6O §3-1-2-1 Créer Une Adresse with the following hints:
		my $adresse1 = Adresse.new( numéro => "24 bis",
					    voie => "rue des Fours à pain",
					    code-postal => "69007",
					    commune => "Lyon"
					  );
		say "Adresse 1 :\n", $adresse1.sérialise;

	and the following output:
		Adresse 1 :
			24 bis rue des Fours à pain
			69007 Lyon

Prerequisites:
	+ The field 'numéro' must be a string: must start with a string  number followed 
	by at least a string followed then followed optionaly by bis or ter.
	+ code-postal is a string whith at least a digit or a space.

]
# ------------------------------------------------------

subset NuméroFormat of Str where /^\d+ \s+ [ter|bis]$/;
subset NumString of Str where /^<[\d\s]>+$/;

class Address {
	has NuméroFormat $.numéro;
	has Str $.voie;
	has NumString $.code-postal;
	has Str $.commune;

	method sérialise {
		"\t$.numéro $.voie\n" ~
		"\t$.code-postal $.commune";
	}
}

my $adresse1 = Address.new( numéro => "24 bis",
			    voie => "rue des Fours à pain",
			    code-postal => "69007",
			    commune => "Lyon"
			  );
say "Adresse 1 :\n", $adresse1.sérialise;

