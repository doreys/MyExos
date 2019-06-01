#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : server.p6
* Creation Date : Sat Jun  1 13:03:05 2019
* Last Modified : Sat Jun  1 13:03:25 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

use Cro::HTTP::Router;
use Cro::HTTP::Server;

my $application = route {
    get -> 'trees' {
        content 'application/json', [
            {
                longitude => 50.4311548,
                latitude => 14.586079,
                height => 4.2,
                description => 'Nice color, very bushy'
            },
            {
                longitude => 50.5466504,
                latitude => 14.8438714,
                height => 7.8,
                description => 'Really tall and wide'
            },
        ]
    }
}

my $server = Cro::HTTP::Server.new(:port(10000), :$application);
$server.start;
react whenever signal(SIGINT) {
    $server.stop;
    exit;
}
