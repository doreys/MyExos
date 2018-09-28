#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag4-2-2._Bouchons.p6
* Creation Date : Fri Sep 28 22:38:14 2018
* Last Modified : Fri Sep 28 22:42:12 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

role SérialisationAbstraite {
    method sérialise() { ... }  # ... littéraux. Les ... indiquent
                                # que la méthode est abstraite
}

# Ce qui suit donne une erreur de compilation du genre : 
#        Method 'sérialise' must be implemented by Point because
#        it is required by a role
class APoint does SérialisationAbstraite {
    has $.x;
    has $.y;
}

# Mais ceci fonctionne bien :
class SPoint does SérialisationAbstraite {
    has $.x;
    has $.y;
    method sérialise() { "p($.x, $.y)" }
}
