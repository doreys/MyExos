#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : testJourney.p6
* Creation Date : Sun Jul  8 14:31:56 2018
* Last Modified : Sun Jul  8 14:32:05 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

my $ⲧ = " " xx 4;
class Journey {
    has $.origin;
    has $.destination;
    has @.travelers;
    has Str $.notes is rw;

    multi method notes() { "$!notes\n" };
    multi method notes( Str $note ) { $!notes ~= "$note\n$ⲧ" };

    method Str { "⤷ $!origin\n$ⲧ" ~ self.notes() ~ "$!destination ⤶\n" };
}

my $trip = Journey.new( :origin<Here>, :destination<There>,
                        travelers => <þor Freya> );

$trip.notes("First steps");
notes $trip: "Almost there";
print $trip;

