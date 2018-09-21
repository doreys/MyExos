#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : exemple2.p6
* Creation Date : Thu Jul 19 23:22:35 2018
* Last Modified : Wed Sep 19 16:05:39 2018
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
  has $.éligible;
  method confirme-éligibilité {
      if self.age < 21 {
        $!éligible = 'Non'
      } else {
        $!éligible = 'Oui'
      }
  }

}

my $françois = Humain.new(nom => 'John', age => 23, sexe => 'M', nationalité => 'Sarthoise');
$françois.confirme-éligibilité;
say $françois.éligible;
