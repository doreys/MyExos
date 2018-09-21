#!/usr/bin/env perl6

use v6.c;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p89-factorial.p6
* Creation Date : Mon Jul 30 21:33:45 2018
* Last Modified : Sat Sep  8 02:12:13 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------


multi sub factorial-v3(0){ 1 }
multi sub factorial-v3(Int $n where $n >0){ $n * factorial-v3 $n - 1 }
say factorial-v3 3;
