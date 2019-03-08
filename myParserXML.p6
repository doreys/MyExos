#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : myParserXML.p6
* Creation Date : Sat Mar  2 11:27:28 2019
* Last Modified : Fri Mar  8 22:18:52 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
   exta test:
	* du texte pur contient des entités telles que &amp; ;
	* je ne sais pas si les noms des balises XML peuvent commencer par un chiffre, mais la grammaire actuelle (à l'époque de l'écriture de l'article) l'autorise. Vous pourriez vérifier la spécification XML et, si besoin, adopter cette grammaire ;
	* du texte pur peut contenir des blocs du genre <![CDATA[ ... ]]> , dans lesquels les balises de type XML sont ignorées et les caractères tels que < sont ignorés et n'ont pas besoin d'un caractère d'échappement ;
	* du XML réel autorise des préambules du type <?xml version="0.9" encoding="utf-8"?> nécessitant une balise racine contenant le reste (il faudra peut-être modifier des cas de test) ;
]
# ------------------------------------------------------

grammar XML {
	token TOP { ^ <xml> $ }
	token xml { <text> [ <tag> <text> ]* }
	token text {
			<-[<>&]>* 
			[ <-[<>&]>* <antite> ]*
			[ <-[<>&]>* <cdata> ]*
		}
	rule tag { '<' (\d*\w+) <attribute>* [
						|'/>'
						|'>' <xml> '</' $0 '>'
					] 
		}
	token attribute { \w+ '="' <-[="<>]>* \" }
	rule cdata {
			'<![CDATA[' [
					| <-[\[\]]>*  ']]>' <xml> 
					| ']]>' <xml> 
				]
	}
	token antite {
		[
			| '&amp;' <text>
		]
	}
	#rule tag 	{ '<' (\w+) <attribute> '>' <xml> '</' $0 '>' }
	#token attribute { \w+ '="' <-["<>]>* \" }
};

my @tests = (
    [1, 'abc'                       ],      # 01
    [1, '<a></a>'                   ],      # 02
    [1, '..<ab>foo</ab>dd'          ],      # 03
    [1, '<a><b>c</b></a>'           ],      # 04
    [1, '<a href="foo"><b>c</b></a>'],      # 05
    [1, '<a empty="" ><b>c</b></a>' ],      # 06
    [1, '<a><b>c</b><c></c></a>'    ],      # 07
    [0, '<'                         ],      # 08
    [0, '<a>b</b>'                  ],      # 09
    [0, '<a>b</a'                   ],      # 10
    [0, '<a>b</a href="">'          ],      # 11
    [1, '<a/>'                      ],      # 12
    [1, '<a />'                     ],      # 13
    [1, 'abc&amp'                   ],      # 14
    [1, 'abc&amp;'                  ],      # 15
    [1, 'abc&amp;aqwxsz'            ],      # 16
    [1, '<a1></a1>'                 ],      # 17
    [1, '<1a></a>'                  ],      # 18
    [1, '<1a></1a>'                 ],      # 19
    [1, '<![CDATA[toto]]>'                 ],      # 19
    [1, '<![CDATA[ toto ]]>'                 ],      # 19
    [1, 'azert<![CDATA[ ... ]]>qsdsqd dsfdsfsd'                 ],      # 19
    [1, 'azert<![CDATA[ <a></a> ]]>qsdsqd dsfdsfsd'                 ],      # 19
);

my $count = 1;
for @tests -> $t {
    my $s = $t[1];
    my $M = XML.parse($s);
    if !($M  xor $t[0]) {
        say "ok $count - '$s'";
    } else {
        say "not ok $count - '$s'";
    }
    $count++;
}

