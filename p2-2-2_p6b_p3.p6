#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p2-2-2_p6b_p3.p6
* Creation Date : Fri Jan 25 16:54:56 2019
* Last Modified : Fri Jan 25 20:57:59 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

grammar XML {
	token TOP { ^ <xml> $ };
	token xml { <text> | <tag> };
	token text { <-[<>&]>* };
	token tag {
		'<' (\w+) '>'
		'</' $0 '>'
	}
};



my @tests = (
	[1, 'abc' ], # 1
	[1, '<a></a>' ], # 2
	[1, '..<ab>foo</ab>dd' ], # 3
	[1, '<a><b>c</b></a>' ], # 4
	[1, '<a href="foo"><b>c</b></a>'], # 5
	[1, '<a empty="" ><b>c</b></a>' ], # 6
	[1, '<a><b>c</b><c></c></a>' ], # 7
	[0, '<' ], # 8 
	[0, '<a>b</b>' ], # 9 
	[0, '<a>b</a' ], # 10 
	[0, '<a>b</a href="">' ], # 11 
	[1, '<a/>' ], # 12 
	[1, '<a />' ], # 13
);

my $count = 1;

for @tests -> $t {
	my $s = $t[1];
	my $M = XML.parse($s);

	if !($M xor $t[0]) {
		say "ok $count - '$s'";
	} else {
		say "not ok $count - '$s'";
	}

	$count++;
}

