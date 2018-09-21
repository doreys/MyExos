#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : polymorphism.p6
* Creation Date : Sun Jul 22 23:31:32 2018
* Last Modified : Sun Jul 22 23:48:31 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class Point3D { 
	has Numeric $.x;
	has Numeric $.y; 
	has Numeric $.z; 
	
	method coordinates () { # accessor to the 3 coordinates 
		return $.x, $.y, $.z 
	} 
	
	method distance2center () { 
		return ($.x ** 2 + $.y ** 2 + $.z ** 2) ** 0.5 
	} 
	
	method polar-coordinates () { 
		return self.spherical-coordinates; 
	} 
	
	method spherical-coordinates { 
		my $rho = $.distance2center; 
		my $longitude = atan2 $.y, $.x; # theta 
		my $latitude = acos $.z / $rho; # phi 
		return $rho, $longitude, $latitude; 
	} 
	
	method cylindrical-coordinates { 
		# ... 
	} 
}

my Point3D $m = Point3D.new(x => 1,y=>2,z=>3);

say $m.polar-coordinates;
