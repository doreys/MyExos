#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : myFoo20181032125.p6
* Creation Date : Wed Oct  3 21:25:11 2018
* Last Modified : Wed Oct  3 21:35:43 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
	A test but with say. All the procedure restarted.
		macbook-pro-de-sdo:tp6 sdo$ ./myFoo20181032125.p6
			The class Foo<140523996778432> hello my friend seb
			The class Foo hello my friend seb
			True <<<<< say prints yes because it succeeded.
	Another test but without say. All the procedure restarted.
		macbook-pro-de-sdo:tp6 sdo$ ./myFoo20181032125.p6
			The class Foo<140684438355392> hello my friend seb
			The class Foo hello my friend seb
			True
			The class Foo<140684472559744> hello my friend seb
			The class Foo hello my friend seb
]
# ------------------------------------------------------

class Foo {
	method f($me: $person){
		say "The class $me hello my friend $person";
		say "The class $me.^name() hello my friend $person";
	}
}

say Foo.new.f("seb");
Foo.new.f("seb");
