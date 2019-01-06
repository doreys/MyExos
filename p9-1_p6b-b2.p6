#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p9-1_p6b-b2.p6
* Creation Date : Sat Jan  5 14:09:59 2019
* Last Modified : Sun Jan  6 04:44:43 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------
#



my enum ouinon <non oui>; # les constantes oui et non prennent vie
say ouinon.enums;         # imprime ("non" => 0, "oui" => 1).hash
say non.pair;                         # imprime "non" => 0
say oui.pair;                         # imprime "oui" => 1
say "Oui vraiment" if oui;            # imprime Oui vraiment
say "Non" if non;                     # n'imprime rien
say "Non, pas du tout" unless non;    # imprime Non, pas du tout
say oui.kv;                           # imprime oui 1 -- kv = key value
say non.defined;                      # imprime True
say oui.WHAT;                         # imprime (ouinon)

say ouinon.enums.keys;                # imprime non oui
say ouinon.enums.values;              # imprime 0 1
say ouinon.enums.kv;                  # imprime non 0 oui 1
say ouinon.enums.invert;              # imprime 0 => "non" 1 => "oui"
