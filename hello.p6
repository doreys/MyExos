#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : hello.p6
* Creation Date : Sun Jun  2 14:03:18 2019
* Last Modified : Sun Jun  2 14:19:20 2019
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
    get -> {
        content 'text/html', 'Home';
    }
    post -> 'poster' {
        content 'text/html', 'Post request to /poster page';
    }
    get -> 'articles', $author, $name {
        content 'text/html', "<h1>{$name}<h1><em>By {$author}</em>";
    }
}


my Cro::Service $service = Cro::HTTP::Server.new:
    :host<localhost>, :port<10000>, :$application;

$service.start;

react whenever signal(SIGINT) {
    $service.stop;
    exit;
}


