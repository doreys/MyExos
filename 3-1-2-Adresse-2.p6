#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : 3-1-2-Adresse-2.p6
* Creation Date : Tue Aug  7 21:41:43 2018
* Last Modified : Tue Aug  7 22:13:13 2018
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
	has Str $.numéros where /^\d+ \s* [bis|ter]?$/;
	has Str $.voie;
	has NumString $.code-postal;
	has Str $.commune;

	method sérialise{
		"\t$!numéros $!voie\n" ~
		"\t$!code-postal $!commune\n";
	}
}

my $adresse1 = Adresse.new(
	numéros => "123 bis",
	voie => "rue des pains à foue",
	code-postal => "123 123",
	commune => "Lyon");

my $adresse2 = $adresse1.clone(code-postal => "1432");
say $adresse1.print;
say $adresse2.print;
