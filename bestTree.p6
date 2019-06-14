#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : bestTree.p6
* Creation Date : Sat Jun  1 13:10:31 2019
* Last Modified : Mon Jun  3 10:32:09 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

use lib 'lib';
use BestTree;
use BestTree::Store;
#use Cro::HTTP::Server;
use Cro::HTTP::Test;
use Test::Mock;
use Test;

# Tests will go here

sub done-testing {
	my $fake-tree-a = BestTree::Tree.new:
	latitude => 50.4311548,
	longitude => 14.586079,
	height => 4.2,
	description => 'Nice color, very bushy';
	my $fake-tree-b = BestTree::Tree.new:
	latitude => 50.5466504,
	longitude => 14.8438714,
	height => 7.8,
	description => 'Really tall and wide';
}

done-testing;

my $application = routes();
my $server = Cro::HTTP::Server.new:
					:host<localhost>, 
					:port<10000>, 
					:$application;
$server.start;

react whenever signal(SIGINT) {
    $server.stop;
    exit;
}
