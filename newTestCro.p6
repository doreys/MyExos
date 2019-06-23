#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : newTestCro.p6
* Creation Date : Sun Jun 23 22:29:33 2019
* Last Modified : Mon Jun 24 00:05:51 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :

* server side:
/Users/sdo/rakudo/install/share/perl6/site/bin
macbook-pro-de-sdo:tp6 sdo$ ./newTestCro.p6

* client side:
Last login: Sun Jun 23 19:40:18 on ttys000
macbook-pro-de-sdo:tp6 sdo$ curl http://localhost:4242/
Muskox Rocks!

]
# ------------------------------------------------------

use Cro;
use Cro::HTTP::Request; 
use Cro::HTTP::Response;

class MuskoxApp does Cro::Transform { 
	method consumes() { Cro::HTTP::Request } 
	method produces() { Cro::HTTP::Response } 
	method transformer(Supply $pipeline --> Supply) { 
		supply whenever $pipeline -> $request { 
			given Cro::HTTP::Response.new(:$request, :200status) { 
				.append-header: "Content-type", "text/html"; 
				.set-body: "Muskox Rocks!\n".encode('ascii'); 
				.emit; 
			} 
		} 
	} 
}

use Cro::TCP; 
use Cro::HTTP::RequestParser; 
use Cro::HTTP::ResponseSerializer; 

my $server = Cro.compose: 
Cro::TCP::Listener.new(:port(4242)), 
        	    Cro::HTTP::RequestParser.new, 
        	    MuskoxApp, 
        	    Cro::HTTP::ResponseSerializer;

$server.start; 
react whenever signal(SIGINT) { 
	$server.stop; 
	exit; 
}
