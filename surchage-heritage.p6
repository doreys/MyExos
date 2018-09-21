#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : surchage-heritage.p6
* Creation Date : Thu Jul 19 23:28:54 2018
* Last Modified : Thu Jul 19 23:34:56 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose : 
* 		Explication surcharge,héritage
* 		https://perl6intro.com/fr/#_h%C3%A9ritage
*
* Résolution du pb ci-dessous:
				class Humain {
				  has $.nom;
				  has $.age;
				}

				class Employé {
				  has $.nom;
				  has $.age;
				  has $.société;
				  has $.salaire;
				}
]
# ------------------------------------------------------

class Humain {
  has $.nom;
  has $.age;
  method présentez-vous {
    say "Bonjour je suis un être humain, et je m'appelle " ~ self.nom;
  }
}

class Employé is Humain {
  has $.société;
  has $.salaire;
  method présentez-vous {
    say "Bonjour je suis un être humain, et je m'appelle " ~ self.nom ~ ' et je travaille chez: ' ~ self.société;
  }

}

my $françois = Humain.new(nom => 'François', age => 23,);
my $anne = Employé.new(nom => 'Anne', age => 25, société => 'Acme', salaire => 2000);

$françois.présentez-vous;
$anne.présentez-vous;
