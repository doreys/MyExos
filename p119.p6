#!/usr/bin/env perl6  

use v6;

# Program: p119.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-04_23:25:26

for 'abcdef' {
	say "Matched ~$/ in $_" if / cd.e /;
	say "Matched ~$/ in $_" if / cd.f /;
	say "X---->~$/" ," in $_ " if / cd.f /;
	say "o---->",~$/ ," in $_ " if / cd.f /;
	say "+---->",$/ ," in $_ " if / cd.f /;
	say "Matched $/ in $_" if / cd.f /;
	say $_;
}
say "*" x 10;
say "Matched $/ ---- $0" if "abcdef".match(/ (b.d.)f /);
say '{}' x 10;
say "Matched $/ ---- $0" if "abcdef" ~~ m{ (b.d.)f };
say "!!" x 10;
say "Matched $/ ---- $0" if "abcdef" ~~ m! (b.d.)f !;
say '??' x 10;
say "Matched $/ ---- $0" if "abcdef" ~~ m? (b.d.)f ?;
say ';;' x 10;
say "Matched $/ ---- $0" if "abcdef" ~~ m;(b.d.)f ;;

my $regex= rx/c..f/;
say "Mathed" if 'abcdef' ~~ $regex;
