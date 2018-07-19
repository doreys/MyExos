#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : exemple.p6
* Creation Date : Thu Jul 19 23:00:12 2018
* Last Modified : Thu Jul 19 23:21:26 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class A {
	has $.nom;
	method n ($nom){
		self.bless(:$nom); 
	}
	method r() { $.nom }
}

class Humain is A {
  has $.nom;
  my $.compteur = 0;

  #  method ret{ A.nom,$.nom }

  method new($nom) {
    Humain.compteur++;
    self.bless(:$nom);
  }
}
my $a = Humain.new('a');
my $b = Humain.new('b');

say Humain.compteur;
#say Humain.r;
#ay Humain.ret;
