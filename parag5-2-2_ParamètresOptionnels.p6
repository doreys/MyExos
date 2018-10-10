#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag5-2-2_ParamètresOptionnels.p6
* Creation Date : Wed Oct 10 15:46:20 2018
* Last Modified : Wed Oct 10 15:57:27 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
	* Série de tests
		>Tests effectués:
			ma_fonction(1, 2, 3, 4);
			commande-repas('steak', :oignons, :bien-cuit);

		>Résultat:
			macbook-pro-de-sdo:tp6 sdo$ ./parag5-2-2_ParamètresOptionnels.p6
			Premier: 1
			Reste: 2 3 4
			Je désire un steak, mais avec quelques modifications:
			oignons, bien-cuit

	* Nouvelle série de tests
		>Tests effectués:
			ma_fonction(1, 2, 3, 4);
			ma_fonction(1);
			commande-repas('steak', :oignons, :bien-cuit);

		>Résultat:
			macbook-pro-de-sdo:tp6 sdo$ ./parag5-2-2_ParamètresOptionnels.p6
			Premier: 1
			Reste: 2 3 4
			Premier: 1
			Reste:
			Je désire un steak, mais avec quelques modifications:
			oignons, bien-cuit
]
# ------------------------------------------------------

sub ma_fonction ($param1, *@reste){
    say "Premier: $param1";
    say "Reste: @reste[]";
}
ma_fonction(1, 2, 3, 4);
ma_fonction(1);

sub commande-repas($plat, *%extras) {
    say "Je désire un $plat, mais avec quelques modifications:";
    say %extras.keys.join(', ');
}

commande-repas('steak', :oignons, :bien-cuit);
