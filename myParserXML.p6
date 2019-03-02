#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : myParserXML.p6
* Creation Date : Sat Mar  2 11:27:28 2019
* Last Modified : Sat Mar  2 13:27:24 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

grammar XML {
	token TOP 	{ ^ <xml> $ }
	token xml 	{ <text> [ <tag> <text> ] }
	token tag 	{ '<' (\w+) '>' '</' $0 '>' }
	token text 	{ <-[<>"/]>* }
};

my @tests = (
    [1, 'abc'                       ],      # 1
    [1, '<a></a>'                   ],      # 2
    [1, '..<ab>foo</ab>dd'          ],      # 3
    [1, '<a><b>c</b></a>'           ],      # 4
    [1, '<a href="foo"><b>c</b></a>'],      # 5
    [1, '<a empty="" ><b>c</b></a>' ],      # 6
    [1, '<a><b>c</b><c></c></a>'    ],      # 7
    [0, '<'                         ],      # 8
    [0, '<a>b</b>'                  ],      # 9
    [0, '<a>b</a'                   ],      # 10
    [0, '<a>b</a href="">'          ],      # 11
    [1, '<a/>'                      ],      # 12
    [1, '<a />'                     ],      # 13
);

my $count = 1;
for @tests -> $t {
    my $s = $t[1];
    my $M = XML.parse($s);
    say $t[1];
    if !($M  xor $t[0]) {
        say "\tok $count - '$s'";
    } else {
        say "\tnot ok $count - '$s'";
    }
    #    say $M.^mro;
    $count++;
}
