#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : methodCall.p6
* Creation Date : Wed Jul 25 00:08:20 2018
* Last Modified : Wed Jul 25 00:09:59 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class A {
    method a() {say "A-a";}
    method b() {say "A-b";}
}

class B is A {
    method b(){
        say "method b de classe B:";
        self.A::a;  # imprime "A-a"
        self.A::b;  # imprime "A-b"
    }
    method a() {
            say "B-a";
	    say "-------------deb tests----------------";
        self.A::a;  # imprime "A-a"
        self.A::b;  # imprime "A-b"
	    say "-------------fin tests----------------";
    }
}

my $b = B.new;
$b.a;       # imprime "B-a"  (donc méthode a de la classe B) -> attendu
$b.A::a;    # imprime "A-a" (donc méthode a de classe A)     -> attendu
$b.b;       # imprime "method b de classe B:", puis "A-a", puis "A-b",
            # donc bien les méthodes a et b de la classe A -> attendu
