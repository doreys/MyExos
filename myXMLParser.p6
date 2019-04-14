#!/usr/bin/env perl6

use v6 ;

# use Grammar::Tracer;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : myXMLParser.p6
* Creation Date : Sat Apr 13 23:44:44 2019
* Last Modified : Mon Apr 15 00:46:09 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
   - Basic tests:
   	• Les balises ouvrantes <item> ---> opening tag checked and verified (that's in the example but need to be checked)
	• Les balises fermantes </item> ---> opening tag checked and verified (that's in the example but need to be checked)
	• Les balises vides <nop/> ---> null tag checked and verified (that's in the example but need to be checked)

   - Extra tests:
	X du texte pur contient des entités telles que &amp; ;
	X je ne sais pas si les noms des balises XML peuvent commencer par un chiffre, mais la grammaire actuelle (à l'époque de l'écriture de l'article) l'autorise. Vous pourriez vérifier la spécification XML et, si besoin, adopter cette grammaire ;
	* du texte pur peut contenir des blocs du genre <![CDATA[ ... ]]> , dans lesquels les balises de type XML sont ignorées et les caractères tels que < sont ignorés et n'ont pas besoin d'un caractère d'échappement ;
	* du XML réel autorise des préambules du type <?xml version="0.9" encoding="utf-8"?> nécessitant une balise racine contenant le reste (il faudra peut-être modifier des cas de test) ;
]
# ------------------------------------------------------

grammar XML {
	token TOP { ^ <xml> $ }

	token xml { 
		<corps>
	}
	
	rule corps {
		[
			| 	<entete>
				[
					'<' (\d*\w+) <attribute>*
					[
						|'/>'
						|'>' <xml> '</' $0 '>'
					] 
				]+
			| <myxml1>
		]
	}

	rule entete { '<?xml' 'version="' \d+ '.' \d+ '"' ['encoding="' <-[\'\"\s]>+ '"']**0..1  '?>' }

	token myxml1 { <text> [ <tag> <text> ]* }

	rule basicText {
		<-[<>&]>* 
	}

	rule text {
		<basicText>
		[
			| <basicText>
			| <basicAntity>
			| <myCDATA>
		]
	}

	rule text2 {
		<basicText2>
		[
			| <basicText2>
			| <basicAntity2>
			| <myCDATA>
		]
	}

	rule basicText2 {
		<-[<>&\[\]]>* 
	}

	rule basicAntity {
		<antity> <text>
	}

	rule basicAntity2 {
		<antity> <text2>
	}

	rule myCDATA { 
		'<![CDATA[' 
			[
				 | [ <text2> || { fail("crochet non fermée") } ]
				 | [ <tag> || { fail("tag non fermée $/") } ]
			]
		']]>' <text>
	}


	rule tag {
		'<' (\d*\w+) <attribute>*
					[
						|'/>'
						|'>' <xml> '</' $0 '>'
					] 
		}

	token attribute { \w+ '="' <-[="<>]>* \" }

	token antity {
		[
			| '&amp;'
		]
	}
};

my @tests = (
# #`{{{
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
    [1, '<![CDATA[toto]]>'          ],      # 20
    [1, '<![CDATA[ toto ]]>'        ],      # 21
    [1, 'azert <![CDATA[ ]]> qsdsqd dsfdsfsd'                 ],      # 22
    [1, 'azErt<![CDATA[ ]]>qsdsqd dsfdsfsd'                 ],      # 22
    [1, 'azert<![CDATA[ <a></a> ]]>qsdsqd dsfdsfsd'                 ],      # 23
    [1, 'azert<![CDATA[ <a></a> ]]>'                 ],      # 24
    [1, 'abctotozezrerze'                       ],      # 25
    [1, 'abc toto zezrerze'                       ],      # 26
    [1, '<empty_tag/> test'], # 27
    [1, '<empty_tag></empty_tag/> test'], # 28
    [1, 'test <empty_tag></empty_tag/> test'], # 29
    [1, 'test <empty_tag> aaaaa </empty_tag/> test'], # 30
    [1, '<empty_tag>zzz</empty_tag/> test'], # 31
    [1, '<empty_tag><empty_tag/> test'], # 32
    [1, '<empty_tag></empty_tag> test'], # 33
    [1, 'test <empty_tag> test </empty_tag> test'], # 34
    [1, '<empty_tag>zzz</empty_tag> test'], # 35
    [1, 'oooo<empty_tag>zzz</empty_tag> test'], # 36
    [1, '[['                       ],      # 37
    [1, '<?xml version="0.9" encoding="utf-8"?>'                       ],      # 38
    [1, '<?xml version="0.9" encoding="utf-8"?><momo></momo>'                       ],      # 39
    #}}}
    [1, '<?xml version="0.9" encoding="utf-8"?><momo>test</momo>'                       ],      # 40
    [1, '<?xml version="0.9" encoding="utf-8"?><tuu><momo></tuu>test</momo>'                       ],      # 41
    [1, '<?xml version="0.9" encoding="utf-8"?><momo><tuu></Tuu>test</momo>'                       ],      # 42
    [1, '<?xml version="0.9" encoding="utf-8"?><momo><Tuu></Tuu>test</momo>'                       ],      # 43
    [1, '<?xml version="1.0" ?><momo><Tuu></Tuu>test</momo>'                       ],      # 43
    [1, '<?xml version="1.0" ?> <redir> index.php </redir> <menu><![CDATA[ <div class="dossier"> Accueil <div class="categorie" onclick="click(1,3);">D&#65533;connexion</div> </div> <div class="dossier"> Administration <div class="categorie" onclick="click(1,4);">Nouveau menu</div> </div> ]]></menu>'],
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

