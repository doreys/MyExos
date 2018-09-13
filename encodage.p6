#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : encodage.p6
* Creation Date : Thu Sep 13 22:17:06 2018
* Last Modified : Thu Sep 13 23:45:52 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
		Deuxièmement, les subméthodes BUILD peuvent être utilisées pour lancer du code spécifique lors de la construction de l'objet. 
		Elles peuvent également servir à créer des alias pour l'initialisation des attributs
]
# ------------------------------------------------------

class EncodedBuffer {
    has $.enc;
    has $.data;

    submethod BUILD(:encodage(:$enc), :$data) { # encodage et un alias sur l'attribut enc
        $!enc  := $enc;
        $!data := $data;
    }
}
my $b1 = EncodedBuffer.new( encodage => 'UTF-8', data => [64, 65] );
my $b2 = EncodedBuffer.new( enc      => 'UTF-8', data => [64, 65] );
#  enc et encodage sont maintenant tous les deux autorisés
