#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p6b-p3-parag4-1-resume.p6
* Creation Date : Thu May 30 21:44:40 2019
* Last Modified : Thu May 30 21:53:07 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

my @animaux = <chien chat tigre>;
# ou
my @animaux2 = qw/chien chat tigre/;
# ou

my $interface = q{eth0};
my $ips = q :s :x /ifconfig $interface/;

# -----------

sub if {
    warn "if() calls a sub\n";
}
if();
