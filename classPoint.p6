#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : classPoint.p6
* Creation Date : Sun Sep 16 15:12:10 2018
* Last Modified : Sun Sep 16 16:58:48 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
	We want to study again  object class. We want to check the mecanism that is used when we instanciate a new class.

	Create a class called Point. It holds 2 public fields or two public attributtes x and y. No methods for the time being.
	Create a class called Rectangle. This class posses two public attributes: lower, upper. 
	The class possesses one public method called area. Here are the spec of the method:
		* Parametters passed: no.
		* Returned type: Int.
		* Synopsis: calculates the area. 

	Instanciate a rectangle where height is 10, width is 10.
]
# ------------------------------------------------------

=begin pod
Basic test regarding documenting code.

=begin SYNOPSIS
Definition of the class Point.
=end SYNOPSIS

=for PARAMETERS
popopo

pipiipiipipipip

=head1 Top Level Mark

here we go again1.
here oui go again1.

=begin para
here we go again1.
here oui go again9.
=end para

=head2 Top moumoute Level Mark

here we go again2.

#|( This is an example of stringification:
    * Numbers turn into strings
    * Regexes operate on said strings
    * C<with> topicalizes and places result into $_
)

=end pod

class Point {
	has $.x;
	has $.y;
}

class Rectangle {
	has Point $.lower;
	has Point $.upper;

	method area () returns Int {
		($!upper.x - $!lower.x) * ($!upper.y - $!lower.y);
	}
}
