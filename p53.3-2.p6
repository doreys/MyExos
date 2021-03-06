#!/usr/bin/env perl6

use v6.c;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p53.3-2.p6
* Creation Date : Mon Jul 30 21:33:45 2018
* Last Modified : Sat Sep  8 02:10:17 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------


sub do-twice(&code,$value){
	code($value);
	code($value);
}

sub greet($message){
	say $message;
}

sub do-four(&function,$value){
	do-twice(&function,$value);
	do-twice(&function,$value);
}

do-twice(&greet,"Hello world");
do-four(&greet,"What's up doc");
