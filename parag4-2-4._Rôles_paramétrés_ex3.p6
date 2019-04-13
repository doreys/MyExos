#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag4-2-4._Rôles_paramétrés_ex3.p6
* Creation Date : Sun Sep 30 10:07:51 2018
* Last Modified : Sun Sep 30 10:08:12 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

enum Gravité <debug info warn erreur critique>;

role Logging[$filehandle = $*ERR] {
    method log( Gravité $sev, $message) {
        $filehandle.print("[{uc $sev}] $message\n");
    }
}

Logging[$*OUT].log(debug, 'On y va');        # [DEBUG] On y va
