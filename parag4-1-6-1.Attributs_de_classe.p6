#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag4-1-6-1.Attributs_de_classe.p6
* Creation Date : Fri Sep 21 16:08:33 2018
* Last Modified : Fri Sep 21 18:19:10 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class Employé {
    my $matricule-courant = 0;
    has Personne $.données-personnelles;
    has Numeric $.matricule;
    has Str $.intitulé-poste is rw;
    has Numeric $.salaire is rw;
    # ...

    method nouveau-matricule { ++$matricule-courant; }

}

my $salarié = Employé.new(
    données-personnelles => Personne.new(
        nom => "Jean",
        prénom => "Chiponelli",
        sexe => "M",
        date-de-naissance => Date.new(1992, 10, 24),
        lieu-de-naissance => "Strasbourg",
        adresse => Adresse.new( numéro => 42, voie => "boulevard Carnot",
                                commune => "Nice", code-postal => "06000"
        ),
        numéro-sécu => "1-92-10-67...",  telephone-personnel => "0712345678"
    ),
    matricule => Employé.nouveau-matricule(),
    intitulé-poste => "technicien de surface",
    salaire => 1234.5
);
say "Matricule de l'employé : {$salarié.matricule}";
