#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : the::?CLASSVariable.p6
* Creation Date : Wed Oct  3 00:22:10 2018
* Last Modified : Fri Oct  5 00:48:30 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
	macbook-pro-de-sdo:tp6 sdo$ ./the::?CLASSVariable.p6
		[cheese pepperoni vegetables]
		42
		X::Parameter::InvalidConcreteness:
		Invocant of method 'get-radius' must be an object instance of type 'Pizza', not a type object of type 'Pizza'.  Did you forget a '.new'?
	macbook-pro-de-sdo:tp6 sdo$
]
# ------------------------------------------------------

class Pizza {
    has $!radius = 42;
    has @.ingredients;

    # class method: construct from a list of ingredients
    method from-ingredients(::?CLASS:U $pizza: @ingredients) {
        $pizza.new( ingredients => @ingredients );
    }

    # instance method
    method get-radius(::?CLASS:D:) { $!radius }
}
my $p = Pizza.from-ingredients: <cheese pepperoni vegetables>;
say $p.ingredients;     # OUTPUT: «[cheese pepperoni vegetables]␤»
say $p.get-radius;      # OUTPUT: «42␤»
say "---->"~Pizza.new.get-radius();   # This will be ok
say "x---->"~Pizza.new.get-radius;   # This will be ok
say Pizza.get-radius;   # This will fail.
CATCH { default { put .^name ~ ":\n" ~ .Str } };
