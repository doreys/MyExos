#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : MethodDelegation-12.9.p6
* Creation Date : Sun Jul 22 22:22:21 2018
* Last Modified : Sun Jul 22 22:58:11 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
*		That's delegation
*		C or C++ is called pointer on function 
]
# ------------------------------------------------------


class BaseClass {
	method Don-Quijote() { "Cervantes" } 
	method Hamlet() { "Shakespeare" } 
	method Three-Sisters () { "Chekhov" } 
	method Don-Carlos() { "Schiller" } 
} 

class Uses { 
	#has $.base is rw handles < Don-Quijote Hamlet Three-Sisters >; 
	has $.base2 is rw handles BaseClass.new(); 
} 

my $user2 = Uses.new(base2 => BaseClass.new);

say $user2.Don-Quijote; 
say $user2.Hamlet; 
say $user2.Three-Sisters; 
say $user2.Don-Carlos;

#`[
my $user = Uses.new; 
$user.base = BaseClass.new(); # implementing an object-handler 
say $user.Don-Quijote; 
say $user.Hamlet; 
say $user.Three-Sisters; 
say $user.Don-Carlos;
]
