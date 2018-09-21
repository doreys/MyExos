#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : ClasseMultipleDefinitionsMethodsInheritance.p6
* Creation Date : Sun Jul 22 16:03:13 2018
* Last Modified : Wed Jul 25 00:32:54 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
*		Sinon, il existe des fonctions de redispatching: callsame, callwith, nextsame, 
*		nextwith, etc. qui peuvent servir à appeler le candidat suivant d'une chaîne d'héritage ou de multi subs
*		https://docs.perl6.org/language/functions#sub_callsame
]
#------------------------------------------------------

class A {
    method a() {say "a";}
    method b() {say "v";}
}

class B is A {
    method b(){
	self.A::a;  # imprime "a"
	self.A::b;
    }
    method a() {
	    say "b";
	    say "------------------------------";
	self.A::a;  # imprime "a"
	self.A::b;
	    say "------------------------------";
    } # Comment appeler la méthode a() issue du père?
}

my $b = B.new;
$b.A::a;  # imprime "a"
$b.a;  # imprime B-a imprime A-a
$b.b;  # imprime B-b imprime A-a

#`[ --------------------------------------------

class Bar {
   has $.msg;
}

class Foo {
   has $.msg = "I'm a foo!";

   # allows coercion from Foo to Bar
   method Bar {
       Bar.new(:msg($.msg ~ ' But I am now Bar.'));
   }
}

# wants a Bar, but accepts Any
sub print-bar(Bar() $bar) {
   say $bar.^name; # OUTPUT: «Bar␤»
   say $bar.msg;   # OUTPUT: «I'm a foo! But I am now Bar.␤»
}

print-bar Foo.new;
]
