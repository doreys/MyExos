#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : pararg8-2-3._Regex_nommées_et_grammaires_p6b.p6
* Creation Date : Mon Oct 15 19:54:43 2018
* Last Modified : Mon Oct 15 19:56:07 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

grammar Personne {
    rule nom { Nom '=' (\N+) }
    rule age { Age '=' (\d+) }
    rule adr { Adr '=' (\N+) }
    rule desc {
        <nom> \n
        <age>  \n
        <adr> \n
    }
    # etc.
}

regex a { ... }
token b { ... }
rule  c { ... }
