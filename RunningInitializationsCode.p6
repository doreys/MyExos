#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : RunningInitializationsCode.p6
* Creation Date : Wed Jul 18 22:52:11 2018
* Last Modified : Thu Jul 19 02:13:56 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class C {
    submethod BUILD {
        say "Created a new instance of C" ; 
    }
}

class D {
    has $!x ;                   # private attribute

    submethod BUILD(:$!x) { say "build method $!x" ; } # allow D.new(x => $value)
    method x() { $!x }        # accessor
}

#`[
class E {
    has $.size ; 

    method new($x) {
        self.bless(*, size => 2 * $x) ; 
    }
}

class F {
    has $.size ; 

    method new($x, *%n) { # optional parameters
        self.bless(*, size => 2 * $x, |%n) ; 
    }
}
]



#say E.new(3).size ;      # prints 6

my $value = 3 ; 
C.new() ; 
D.new(x => $value) ; 
