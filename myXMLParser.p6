#!/usr/bin/env perl6

use v6 ;

# use Grammar::Tracer;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : myXMLParser.p6
* Creation Date : Sat Apr 13 23:44:44 2019
* Last Modified : Wed Apr 24 00:02:30 2019
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
		Prerequisites & format:
			• &#NNNN; ou &#xHHHH;
			• Les caractères &# et ; délimitent la référence.
			• Le caractère x indique que le nombre qui suit est en notation hexadécimale.
			• NNNN est le numéro du caractère en notation décimale.
			• HHHH est le numéro du caractère en notation hexadécimale.
	X je ne sais pas si les noms des balises XML peuvent commencer par un chiffre, mais la grammaire actuelle (à l'époque de l'écriture de l'article) l'autorise. Vous pourriez vérifier la spécification XML et, si besoin, adopter cette grammaire ;
	X du texte pur peut contenir des blocs du genre <![CDATA[ ... ]]> , dans lesquels les balises de type XML sont ignorées et les caractères tels que < sont ignorés et n'ont pas besoin d'un caractère d'échappement ;
	X du XML réel autorise des préambules du type <?xml version="0.9" encoding="utf-8"?> nécessitant une balise racine contenant le reste (il faudra peut-être modifier des cas de test) ;
	• vous pourriez essayer de mettre en place un bel affichage de code XML en analysant récursivement l'objet $/. (Ce n'est pas du tout trivial, il se peut que vous deviez contourner des bogues Rakudo et peut-être introduire de nouvelles captures.)
]
# ------------------------------------------------------

grammar XML {
	token TOP { ^ <xml> $ }

	token xml { 
		<corps>
	}
	
	rule corps {
		[
			| <myxml1>
			| <entete> <bodyXML>
		]
	}

	rule bodyXML {
		<myxml1>
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


	rule basicAntity {
		<entities_formats> <text>
	}

	rule tag {
		'<' (\d*\w+) [ <attribute> \s* ]*
					[
						|'/>'
						|'>' <myxml1> '</' $0 '>'
					] 
	}

	token basicText2 {
		<-[<>&\[\]]>*
		#<myCDATACorpse>
	}

	rule basicAntity2 {
		<entities_formats> 
		#<text2>
		#<myCDATACorpse>
	}

	rule myCDATA { 
		'<![CDATA[' 
			<myCDATACorpse>
		']]>' <text>
	}

	rule myCDATACorpse {
		 <text2> [ <tag2> <text2> ]*
	}

	rule text2 {
		[
			| <basicText2>
			| <basicAntity2>
		]
		#<myCDATACorpse>
	}

	rule tag2 {
		'<' (\d*\w+) [ <attribute> \s* ]*
					[
						|'/>'
						|'>' <myCDATACorpse> '</' $0 '>'
					] 
		<myCDATACorpse>
	}

	token attribute { \w+ '="' <-[="\<\>\s]>+ \" }

	token entities_formats {
		[
			| '&amp;'
			| <entity_decimal>
			| <entity_hexadecimal>
		]
	}

	token entity_decimal {
		'&#' <[0..9]>**4 ';'
	}

	token entity_hexadecimal {
		'&#x' <[0..9A..Fa..f]>**4 ';'
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
    [1, 'azErt<![CDATA[ ]]>qsdsqd dsfdsfsd'                 ],      # 23
    [1, 'azert<![CDATA[ <a></a> ]]>qsdsqd dsfdsfsd'                 ],      # 24
    [1, 'azert<![CDATA[ <a></a> ]]>'                 ],      # 25
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
    [1, '<?xml version="0.9" encoding="utf-8"?><momo>test</momo>'                       ],      # 40
    [1, '<?xml version="0.9" encoding="utf-8"?><tuu><momo></tuu>test</momo>'                       ],      # 41
    [1, '<?xml version="0.9" encoding="utf-8"?><momo><tuu></Tuu>test</momo>'                       ],      # 42
    [1, '<?xml version="0.9" encoding="utf-8"?><momo><Tuu></Tuu>test</momo>'                       ],      # 43
    [1, '<?xml version="1.0" ?><momo><Tuu></Tuu>test</momo>'                       ],      # 44
    [1, '<?xml version="1.0" ?><momo><Tuu class="aqaqa"></Tuu>test</momo>'                       ],      # 45
    [1, '<?xml version="1.0" ?><momo><Tuu class="click(1,2);"></Tuu>test</momo>'                       ],      # 46
    [1, '<?xml version="1.0" ?><momo><Tuu class="click(1,2);">test within</Tuu>test</momo>'                       ],      # 47
    [1, '<?xml version="1.0" ?> <redir> index.php </redir> <momo><Tuu class="click(1,2);">test within</Tuu>test</momo>'                       ],      # 48
    [1, '<?xml version="1.0" ?><momo><Tuu class="click(1,2);">test within momo</Tuu>test</momo>'                       ],      # 49
    [1, '<?xml version="1.0" ?><momo>azazaza<Tuu onclick="clock(3,2);" class="ee">test within 1<![CDATA[ <div id="click" class="categorie2">Nouveau menu</div> ]]></Tuu>test</momo>'                       ],      # 50
    [1, '<?xml version="1.0" ?><momo>azazaza<Tuu onclick="clock(3,2);" class="ee">test within 1<![CDATA[ <div id="click" class="categorie2">Nouveau menu</div>  <div id="click" class="categorie2">Nouveau menu</div> ]]></Tuu>test</momo>'                       ],      # 51
    [1, '<?xml version="1.0" ?><momo>azazaza<Tuu onclick="clock(3,2);" class="ee">test within 1<![CDATA[ aaa aaaazeazeaz <div id="click" class="categorie2">Nouveau menu</div> uuuu  <div id="click" class="categorie2">Nouveau menu</div> ]]></Tuu>test</momo>'                       ],      # 52
    [1, '<?xml version="1.0" ?><momo><![CDATA[ <div id="click" class="categorie2">Nouveau menu</div> ]]></momo>'                       ],      # 53
    [1, '<?xml version="1.0" ?><momo>aaa<![CDATA[ <div id="click" class="maviecestmacategorieazerty2">Nouveau menu</div> ]]></momo>'                       ],      # 54
    [1, '<?xml version="1.0" ?><momo>aaa<![CDATA[ <div id="click" class="categorie2">Nouveau menu</div> azerty]]></momo>'                       ],      # 55
    [1, '<?xml version="1.0" ?><momo>aaa<azerty><![CDATA[ <div id="click" class="categorie2">Nouveau menu</div> azerty]]></momo>'                       ],      # 56
    [1, '<?xml version="1.0" ?><momo>aaa<azerty><![CDATA[ <div id="click" class="categorie2">Nouveau menu</div> azerty]]></azerty></momo>'                       ],      # 57
    [1, '<?xml version="1.0" ?><momo>aaa<azerty>uuu<![CDATA[ <div id="click" class="categorie2">Nouveau menu</div> azerty]]></azerty></momo>'                       ],      # 58
    [1, '<?xml version="1.0" ?><momo>aaa<azerty>uuu<![CDATA[ <div id="click" class="categorie2">Nouveau menu</div> azerty]]>azert<aze>toto is here</aze></azerty></momo>'                       ],      # 59
    [1, '<?xml version="1.0" ?><momo>aaa<aze>qawxsz</aze><azerty>uuu<![CDATA[ <div id="click" class="categorie2">Nouveau menu</div> azerty]]>azert<aze>toto is here</aze></azerty></momo>'                       ],      # 60
    [1, '<?xml version="1.0" ?><momo>aaa<aze>qawxsz</aze><azerty>uuu<![CDATA[ <div id="click" class="categorie2">Nouveau menu</div> <div onclick="click(1,4,2);" class="categorie3">Nouveau menu9</div>azerty]]>azert<aze>toto is here</aze></azerty></momo>'                       ],      # 61
    # }}}
    [1, '<?xml version="1.0" ?><momo>aaa<![CDATA[ <div id="click" class="categorie2">Nouveau menu</div> ooooo <div onclick="click(1,4,2);" class="categorie3">Nouveau menu9</div>azerty]]></momo>'                       ],      # 62
    [1, '<?xml version="1.0" ?><momo>aaa<![CDATA[ <aaaaz> <div id="click" class="categorie2">Nouveau menu</div> ooooo <div onclick="click(1,4,2);" class="categorie3">Nouveau menu9</div>azerty</aaaaz>]]></momo>'                       ],      # 63
    # #`{{{
    [1, '<?xml version="1.0" ?><momo>aaa<![CDATA[ <div id="click" class="categorie2">Nouveau menu</div> <div onclick="click(1,4,2);" class="categorie3">Nouveau menu9</div>azerty]]></momo>'                       ],      # 64
    [1, '<?xml version="1.0" ?><momo>azazaza<Tuu onclick="clock(3,2);" class="ee">test within 1<![CDATA[ aaa aaaazeazeaz <div id="click" class="categorie2">Nouveau menu</div> uuuu  <div id="click" class="categorie2">Nouveau menu</div> oooo ]]></Tuu>test</momo>'                       ],      # 65
    [1, '<?xml version="1.0" ?><momo><Tuu  onclick="ee" class="click(1,2);">test within</Tuu>test <![CDATA[ sdsfdfsdfdsfs  <toto>aqwxsz</toto>]]></momo>'                       ],      # 66
    [1, '<?xml version="1.0" ?><momo><Tuu  onclick="ee" class="click(1,2);">test within</Tuu>test <![CDATA[ sdsfdfsdfdsfs  <div class="categorie" onclick="click(1,4);">Nouveau menu</div>]]></momo>'                       ],      # 67
    [1, '<?xml version="1.0" ?><momo>azazaza<Tuu class="click(1,2);" onclick="ee">test within<![CDATA[ <div class="categorie" onclick="click(1,4);">Nouveau menu</div> <div class="dossier"> Accueil</div> ]]></Tuu>test</momo>'                       ],      # 68
    [1, 'abctotozezrerze'                       ],      # 69
    [1, '<?xml version="1.0" ?> <redir> index.php </redir> <menu>'~ '<![CDATA[ '~ '<div class="dossier"> Accueil <div class="categorie" onclick="click(1,3);">D&#65533;connexion</div> </div> '~ '<div class="dossier"> Administration <div class="categorie" onclick="click(1,4);">Nouveau menu</div> </div>'~ ' ]]></menu>'], #70
    [1, '<?xml version="1.0" ?> <redir> index.php </redir> <menu>'~ '<![CDATA[ '~ '<div class="dossier"> Accueil <div class="categorie" onclick="click(1,3);">D&#65533;connexion</div> </div> '~ '<div class="onclick(2,9);" class="dossier"> Administration <div class="categorie" onclick="click(1,4);">Nouveau menu</div> </div>'~ ' ]]></menu>'], #71
[1, '<?xml version="1.0" ?><momo><Tuu  onclick="ee" class="click(1,2);">test within</Tuu>test <![CDATA[ sdsfdfsdfdsfs  <toto  onclick="click(2,8);" class="categorie2">aqwxsz</toto> uuuuu]]></momo>'                       ],      # 72
    [1, 'a&#1234;bc'                       ],      # 73
    [1, 'a&#234;bc'                       ],      # 74
    [1, 'a&#233234;bc'                       ],      # 75
    [1, 'a&#123H;bc'                       ],      # 76
    [1, 'a&#x123H;bc'                       ],      # 77
    [1, 'a&#x123f;bc'                       ],      # 78
# }}}
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

