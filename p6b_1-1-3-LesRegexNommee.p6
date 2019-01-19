#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p6b_1-1-3-LesRegexNommee.p6
* Creation Date : Sat Jan 19 12:18:38 2019
* Last Modified : Sat Jan 19 12:24:04 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------
#

my regex float {

	 <[+-]>? # signe optionnel

	  \d* # chiffres avant la virgule, optionnel (en anglais)

	   '.' # séparateur décimal (la "virgule")

	    \d+ # chiffres après la virgule

	     [ # exposant optionnel

		      e <[+-]>? \d+

		       ]?

	       }

	 

	       my token signe { <[+-]> }

	       my token decimal { \d+ }

	       my token exposant { 'e' <signe>? <decimal> }

	       my regex float {

		        <signe>?

			 <decimal>?

			  '.'

			   <decimal>

			    <exposant>?

		    }
