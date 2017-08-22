#!/usr/bin/env perl6  

use v6;

# Program: a.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-22_22:59:06

sub rot(Str $char,Int $r){
	my $br = $char.ord - "a".ord + 1;
	my $bra = $br + $r;
	my $mod = "z".ord - "a".ord + 1;
	my $res = $bra % $mod;

	#say "$char $br   --($mod)----> \$bra \% \$mod = $res";
	$res -= 1 ;
	$res += "a".ord;
	#say "---------->$res";

	return  chr $res ; 
}

sub transform(Str $string,Int $rot){
	my $s = "";

	print "rot($string)=";
	for $string.comb -> $char {
		$s = $s ~ rot $char,$rot;
	}
	return $s;
}

say rot "a",3;
say "-------------------------------";
say rot "z",1;
say "-------------------------------";

say transform "cheer",7;
say transform "melon",-10;
say transform "ibm",-1;

say transform "cheer",13;
say transform (transform "cheer",13) , 13;
