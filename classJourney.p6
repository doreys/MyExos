#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : classJourney.p6
* Creation Date : Tue Jul 17 08:41:52 2018
* Last Modified : Wed Jul 18 19:09:35 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

class Place {
	has $.name;
	has $.population is rw;
}

class Journey {
	has $.from;
	has $.to;
	has $!start_time;
	has $!end_time;

	method opinion() {
		say "I luvs ma travelz.";
	}

	method start() { $!start_time = time; }

	method end()   { $!end_time = time; }

	method duration() {
		if !$!start_time {
			die "Journey not started yet.";
		} else {
			return $!end_time ??  $!end_time - $!start_time !!  time - $!start_time;
		}
	}
}

class TrainJourney is Journey {
	has $.train_no;
	has $.coach;
	has $.place;
}

class Flight is Journey {
	has $.flight_no;
}

class Walk is Journey {
}

my $lhasa = Place.new(
			name => 'Lhasa',
			population => 257400
		);
my $xian = Place.new(
			name => 'Xian',
			population => 2670000
		);
my $trip = Journey.new(
			from => $lhasa,
			to   => $xian
		);

my $trip2 = TrainJourney.new(
					#Journey{ from => $lhasa, to => $xian },
	#					$trip,
					train_no => 'T28',
					coach => '12',
					place => '68',
					Journey( from => $lhasa, to => $xian )
				)
				;
say $trip2.train_no;
say $trip2.from;
say $trip2.opinion;
