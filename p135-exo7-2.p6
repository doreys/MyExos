#!/usr/bin/env perl6  

use v6;

# Program: p135-exo7-2.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-21_22:20:51

sub is-lower (Str $input){
	return so $input ~~ /^<[a..z]>$/;
}

sub any_lowercase1(Str $string){
	for $string.comb -> $char {
		if is-lower $char {
			return True;
		} else {
			return False;
		}
	}
}

sub any_lowercase2(Str $string){
	for $string.comb -> $char {
		if is-lower "char" {
			return True;
		} else {
			return False;
		}
	}
}

sub any_lowercase3(Str $string){
	my $flag;

	for $string.comb -> $char {
		$flag = is-lower $char;
	}
	return $flag;
}

sub any_lowercase4(Str $string){
	my $flag = False;

	for $string.comb -> $char {
		$flag = $flag or is-lower $char;
	}
	return $flag;
}

sub any_lowercase5(Str $string){
	my $flag = False;
	for $string.comb -> $char {
		if is-lower $char {
			$flag = True;
		}
	}
	return $flag;
}

sub any_lowercase6(Str $string){
	for $string.comb -> $char {
		if is-lower $char {
			return 'True';
		}
	}
	return 'False';
}


sub any_lowercase7(Str $string){
	for $string.comb -> $char {
		return True if is-lower $char ;
	}
	return False;
}

sub any_lowercase8(Str $string){
	for $string.comb -> $char {
		return False unless is-lower $char;
	}
	return True;
}

sub any_lowercase9(Str $string){
	for $string.comb -> $char {
		if not is-lower $char {
			return False ;
		}
	return True;
	}
}

my $res;
say is-lower "azert";
say any_lowercase1 "azert";
say any_lowercase2 "azert";
say any_lowercase3 "azert";
say any_lowercase4 "azert";

$res = any_lowercase5 "azert";
say $res," ",$res.WHAT;

$res = any_lowercase6 "azert";
say $res," ",$res.WHAT;
say any_lowercase8 "azert";
