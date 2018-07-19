#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : newClass.p6
* Creation Date : Thu Jul 19 22:45:13 2018
* Last Modified : Thu Jul 19 22:45:26 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class Humain {
  has $.nom;
  has $.age;
  has $.sexe;
  has $.nationalité;
  #nouveau constructeur qui prime sur constructeur par défaut.
  method new ($nom,$age,$sexe,$nationalité) {
    self.bless(:$nom,:$age,:$sexe,:$nationalité);
  }
}

my $françois = Humain.new('François',23,'M','Sarthoise');
say $françois;
