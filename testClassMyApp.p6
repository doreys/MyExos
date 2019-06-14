#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : testClassMyApp.p6
* Creation Date : Fri Jun 14 13:17:18 2019
* Last Modified : Fri Jun 14 15:16:54 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

#use lib "."; use MyModuleApp;

use Cro;
use Cro::TCP;
use Cro::HTTP::RequestParser;
use Cro::HTTP::ResponseSerializer;
use Cro::HTTP::Request;
use Cro::HTTP::Response;

class MyApp does Cro::Transform {
	method consumes() { Cro::HTTP::Request }
	method produces() { Cro::HTTP::Response }
	method transformer(Supply $reqs){
		supply whenever $reqs -> $request {
			my $res = Cro::HTTP::Response.new(:$request, :200status);
			$res.append-header('Content-type','text/plain');
			$res.set-body("Hello from Cro\n");
			emit $res;
		}
	}
}

my Cro::Service $http-hello = Cro.compose:
					Cro::TCP::Listener.new(:host<0.0.0.0>, :port<10000>),
					Cro::HTTP::RequestParser.new,
					MyApp,
					Cro::HTTP::ResponseSerializer.new ;

$http-hello.start;
react whenever signal(SIGINT) { $http-hello.stop; done; }
