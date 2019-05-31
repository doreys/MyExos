#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : readdir.p6
* Creation Date : Fri May 31 21:02:24 2019
* Last Modified : Fri May 31 21:02:42 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

# To iterate over the contents of the current directory:
for dir() -> $file {
    say $file;
}
