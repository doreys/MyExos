#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p2-2-2_p6b-p3.p6
* Creation Date : Fri Mar  1 11:01:32 2019
* Last Modified : Fri Mar  1 11:30:27 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------


grammar XML { 
	token TOP { ^ <tag> $ } 
	token tag { '<' (\w+) '>' '</' $0 '>' }
};

my @tests = ( [1, 'abc' ], 
		[1, '<a></a>' ], 
		[1, '.<ab>foo</ab>dd' ], 
		[1, '<a><b>c</b></a>' ], 
		[1, '<a href="foo"><b>c</b></a>'], 
		[1, '<a empty="" ><b>c</b></a>' ], 
		[1, '<a><b>c</b><c></c></a>' ], 
		[0, '<' ], 
		[0, '<a>b</b>' ], 
		[0, '<a>b</a' ], 
		[0, '<a>b</a href="">' ], 
		[1, '<a/>' ], 
		[1, '<a />' ], 
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
