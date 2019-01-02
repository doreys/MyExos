#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p8-1_examplr.p6
* Creation Date : Wed Jan  2 13:55:48 2019
* Last Modified : Wed Jan  2 14:49:48 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------


class Foo {

	 has $.bar;

	  has $!baz;

  }

  my @stuff = sort { $^b[1] <=> $^a[1]}, ([1, 2], [0, 3], [4, 8]);

  my $block = { say "This is the named 'foo' parameter: $:foo" };

  $block(:foo<bar>);

  say "This is file $?FILE on line $?LINE";

  say "A CGI script" if %*ENV.exists('DOCUMENT_ROOT');
