#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : voitureTest.p6
* Creation Date : Wed Sep 12 22:10:51 2018
* Last Modified : Wed Sep 12 23:33:08 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
	I want to test the fields methods....
	It seems that 
]
# ------------------------------------------------------

subset Distance of Str where /^\d+ \s+ [km|m|cm|mm]$/;

role Road [Distance $d] {
#role Road {
	has Distance $ds;
}

class Transport does Road["10 km"] {
	has Bool $.flyingCarpet;
	has Int $.nbWheels;

	submethod BUILD(:$!flyingCarpet,:$!nbWheels,:$nbWheel){
		say "we init $!flyingCarpet , $!nbWheels";
	}

	method get { return $.flyingCarpet,$.nbWheels;}
}


my $vehicle = Transport.new(flyingCarpet => True,nbWheels => 10);

say "----> $vehicle.flyingCarpet ----"; 	# ----> Transport<140607811566048>.flyingCarpet ----
say "----> " ~ $vehicle.flyingCarpet ~ "----"; 	# ----> True----
say "----> { $vehicle.flyingCarpet } ----"; 	# ----> True ----
say "----> { $vehicle.nbWheels } ----"; 	# 10
