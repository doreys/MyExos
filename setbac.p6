#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: setbac.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2018-04-04_15:31:40

my $s = set <banana apple orange orange banana pear apple>;
say $s.perl;
say $s.elems;
say $s{'apple'};
say $s{'strawberry'};
my $b = bag <banana apple orange orange banana pear apple orange>;

say "Is subset!" if <orange banana> ⊂ $s;
say <orange banana pineapple> ∩ $s;


say "Found it!" if 'apple' ∈ $s;
say "Is subset!" if <orange banana> ⊂ $s; # Is subset!
say <orange banana pineapple> ∩ $s; # set(banana, orange)
