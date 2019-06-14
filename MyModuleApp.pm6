# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : MyModuleApp.pm6
* Creation Date : Fri Jun 14 13:08:13 2019
* Last Modified : Fri Jun 14 14:24:58 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

unit module MyModuleApp;

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
