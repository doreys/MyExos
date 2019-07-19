#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p6b-p3_8-1_Perl_6_idiomatique_resume.p6
* Creation Date : Tue Jul  2 21:26:23 2019
* Last Modified : Tue Jul  2 21:42:24 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

my @keys = 1,2,3,4,5;
my @values = 2,3,4,5,6;

# Créer un hachage à partir d'une liste de clefs et de valeurs :
# solution 1: tranches
my %hash; %hash{@keys} = @values;
# solution 2: métaopérateurs
my %hash = @keys Z=> @values;

# Créer un hachage à partir d'un tableau, en
# affectant une valeur vraie à chaque élément du tableau
my %exists = @keys X=> True;

# limiter une variable à une fourchette de valeurs (0 à 10)
my $x = -2;
$x = 0 max $x min 10;    # $x vaut maintenant 0

# pour le débogage: affiche le contenu d'une variable
# ainsi que son nom sur STDERR
note :$x.perl;

# tri non sensible à la casse
say @list.sort: *.lc;

# attributs obligatoires
class Quelquechose {
    has $.required = die "Attribut 'required' est obligatoire";
}
Quelquechose.new(required => 2); # pas d'erreur
Quelquechose.new()               # BOUM
