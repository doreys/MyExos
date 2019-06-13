#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : my-rot13-service.p6
* Creation Date : Thu Jun 13 15:51:30 2019
* Last Modified : Thu Jun 13 16:16:10 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

use Cro;
use Cro::TCP;

class Rot13 does Cro::Transform {
	method consumes() { Cro::TCP::Message }
	method produces() { Cro::TCP::Message }
	method transformer(Supply $messages --> Supply){
		supply {
			whenever $messages { 
				emit Cro::TCP::Message.new: data => 
				.data.decode('latin-1')
				.trans('a..mn..z' => 'n..za..m', :ii)
				.encode('latin-1')
			}
		}
	}
}

my Cro::Service $rot13 = Cro.compose: 
	Cro::TCP::listener.new(:host<0.0.0.0>, :port<10000>),
	Rot13; 

$rot13.start;
react whenever signal(SIGINT) { $rot13.stop; done }

