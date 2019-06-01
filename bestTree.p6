#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : bestTree.p6
* Creation Date : Sat Jun  1 13:10:31 2019
* Last Modified : Sat Jun  1 13:38:25 2019
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
use Cro::HTTP::Server;

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
