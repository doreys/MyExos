#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : oneExo-P6O§3-1-2-1_CréerUnTableauAdresse.p6
* Creation Date : Thu Sep  6 15:22:49 2018
* Last Modified : Thu Sep  6 21:58:42 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
taken from: https://laurent-rosenfeld.developpez.com/tutoriels/perl/perl6/objets/#L3-1-2-3

Create a class called Address:
	From the following code try to create an array of addresses from P6O §3-1-2-1 Créer Une Adresse with the following hints:
		my $adresse1 = Adresse.new( numéro => "24 bis",
					    voie => "rue des Fours à pain",
					    code-postal => "69007",
					    commune => "Lyon"
					  );

	and the following output for 1 address do it for n addresses:
		Adresse 1 :
			24 bis rue des Fours à pain
			69007 Lyon

Prerequisites:
	+ The field 'numéro' can be changed for instance
	Here is an exeample:
				Adresse 1 :
					1 bis rue des Fours à pain
					69007 Lyon
				Adresse 2 :
					2 bis rue des Fours à pain
					69007 Lyon
				Adresse 3 :
					3 bis rue des Fours à pain
					69007 Lyon
				Adresse 4 :
					4 bis rue des Fours à pain
					69007 Lyon
				Adresse 5 :
					5 bis rue des Fours à pain
					69007 Lyon


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

my @adresse ;
@adresse[$_] = Address.new( numéro => "$_ bis",
			    voie => "rue des Fours à pain",
			    code-postal => "69007",
			    commune => "Lyon"
			  ) for 1..5 ;
say "Adresse $_ :\n", @adresse[$_].sérialise for 1..5 ;

