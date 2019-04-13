#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p1-1-3_p6b-p3_regex_nommees-p1.p6
* Creation Date : Sat Feb  2 13:00:41 2019
* Last Modified : Sat Feb  2 13:06:08 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------


my regex my_float {
     <[+-]>?        # signe optionnel
     \d*            # chiffres avant la virgule, optionnel (en anglais)
     '.'            # séparateur décimal (la "virgule")
     \d+            # chiffres après la virgule
     [              # exposant optionnel
        e <[+-]>?  \d+
     ]?
}


my token signe { <[+-]> }
my token decimal { \d+ }
my token exposant { 'e' <signe>? <decimal> }
my regex my2_float {
    <signe>?
    <decimal>?
    '.'
    <decimal>
    <exposant>?
}

my regex entier {
    <signe>?
    <decimal>
}

my regex float_def {
    <signe>?
    [
    || <decimal>?  '.' <decimal> <exposant>?
    || <decimal> <exposant>
    ]
}
