#!/usr/bin/env perl6

use v6 ;


# use Grammar::Tracer;


# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : myXMLParser.p6
* Creation Date : Sat Apr 13 23:44:44 2019
* Last Modified : Sat May 25 01:46:20 2019
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

my $rank=0;
my @lines = ();
my $prev=0;
grammar XML {
	token TOP { ^ <xml> $ { 
			for @lines -> $l {
				say "---->$l";
			}
			#say "beg:" ~ @lines.elems; while @lines.elems > 0 { shift(@lines); } say "end:" ~ @lines.elems;
		}
	}


	token xml { 
		<corps> { 
			$rank=0;
			$prev=0;
			#	say "list is not empty " ~ @lines.elems if @lines.elems;
		}
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

	rule entete { '<?xml' 'version="' \d+ '.' \d+ '"' ['encoding="' <-[\'\"\s]>+ '"']**0..1  '?>'  { { 
		push @lines, "$/ <!-- entete -->" ;
		#say "$/ <!-- entete -->" 
	} if $/.chars } }

	token myxml1 { 
		<text> [ <tag> <text> ]* 
	}

	rule basicText {
		(<-[<>&]>*) {
			#say "------------start----------";
			#say "prev: $prev";
			if $0.chars { 
				my $recup="";
				if $prev == 1 {
					if $0.chars {
						$recup=pop @lines;
						#say "from pop $recup";
						$recup="$recup$0";
						#say "prev already";
					}
				}else{
					if $/.chars {
						$prev=1;
						$recup= "\t" x $rank ~ "$/";
					}
				}
				#say "it match >" ~ $recup ~ "<";
				push @lines,"$recup";
			}
		}
	}

	token text {
		<basicText>
		[
			| <basicText>
			| <basicEntity> # { my $recup=""; { $recup=pop @lines; say "oooo>$recup"; $recup~=$1; } if @lines.elems; { push @lines,"$recup"; say "* recup:$1"; say "** recup($0,$1):$recup"; } if $1.chars }
			<text>
			| (<myCDATA>) { say "zzzzzzzz>$1" if $1.chars }
			<text>
		]
	}


	rule basicEntity {
		(<entities_formats>)  { 
			#say "------------start----------";
			#say "prev: $prev";
			if $0.chars { 
				my $recup="";
				if $prev == 1 {
					if $0.chars {
						$recup=pop @lines;
						#say "from pop $recup";
						$recup="$recup$0";
						#say "prev already";
					}
				}else{
					if $/.chars {
						$prev=1;
						$recup= "\t" x $rank ~ "$/";
					}
				}
				#say "it match >" ~ $recup ~ "<";
				push @lines,"$recup";
			}
		}
	}

	rule tag {
		[
			| ('<') (\d*\w+) ('/>') { $prev = 0; { say "\n$0$1$2 <!-- begin/end tag2 xxx no param-->"; }  if $/.chars }
			| ('<') (\d*\w+) ([ <attribute> \s* ]+) ('/>') { $prev = 0; { say "\n$0$1$2$3 <!-- begin/end tag2 xxx with param-->"; }  if $/.chars }
			| ('<') (\d*\w+) ('>') {$prev = 0;  
							{ 
								push @lines, "\t" x $rank ~ "$0$1$2 <!-- begin tag2 xUxx $rank -->" ;
								#		say "\t" x $rank ~ "$0$1$2 <!-- begin tag2 xUxx-->" ;
								$rank++; 
							} if $/.chars 
						}
				<myxml1> 
			('</') $1 ('>') {
				$prev = 0; 
				{
					$rank--;
					push @lines, "\t" x $rank ~ "$3$1$4" ~ "   <!-- end tag2 xxxX rank:$rank-->";
					#print "\t" x $rank ~ "$3$1$4" ~ "   <!-- end tag2 xxxX rank:$rank-->";
				} if $/.chars }
			| ('<') (\d*\w+) ([<attribute> \s* ]+) ('>') {
					$prev = 0; 
					{ 
						push @lines, "\t" x $rank ~ "$0$1 $2$3 <!-- begin tag2-->" ; 
						#say "\t" x $rank ~ "$0$1 $2$3 <!-- begin tag2-->" ; 
						$rank++; 
					} if $/.chars 
				}
			<myxml1> ('</') $1 ('>') { 
					{ 
						$rank--; 
						push @lines, "\t" x $rank ~ "$4$1$5" ~ " <!-- end tag2-->"; 
						#say "\n" ~ "\t" x $rank ~ "$4$1$5" ~ " <!-- end tag2-->"; 
					} if $/.chars 
			}
		] 
	}

	token basicText2 {
		<-[<>&\[\]]>* {  
				{ 
					#$rank++;
					push @lines, "\t" x $rank ~ "$/ <tag basicText2"; 
					#		say "\t" x $rank ~ "tag basicText2> $/"; 
					$rank--;
				} if $/.chars 
			}
	}

	rule basicEntity2 {
		<entities_formats> { say "tag entities_formats> $/" }
	}

	rule myCDATA { 
		('<![CDATA[') { 
				{ 
					push @lines, "\t" x $rank ~ "$0 <!-- begin myCDATA -->";
					#say "\t" x $rank ~ "$0 <!-- begin myCDATA -->";
					$rank++; 
				} if $/.chars 
			}
		<myCDATACorpse> #{ { $rank+=2;} if $/.chars } 
		(']]>') { 
				{ 
					$rank--; 
					push @lines, "\t" x $rank ~ "$1 <!-- end myCDATA -->";
					# say "\t" x $rank ~ "$1 <!-- end myCDATA -->";
				} if $/.chars 
			} 
	}

	rule myCDATACorpse {
		 (<text2>)  # { { say "\t" x $rank ~ "$0 <!-- <text2> myDATACorpse-->" ;  } if $/.chars } 
			 [
				(<tag2>)  # { { $rank++ ; say "\t" x $rank ~ "myDAC2> $1" ; $rank--; } if $/.chars }
				(<text2>) # { { $rank++ ; say "\t" x $rank ~ "myDAC3> $2" ; $rank--; } if $/.chars }
			]*
	}

	rule text2 {
		[
			| <basicText2>
			| <basicEntity2>
		]
		#<myCDATACorpse>
	}

	rule tag2 {
		[
			| ('<') (\d*\w+) ([<attribute> \s*]*) ('/>') { { $rank++;say "\t" x $rank ~ "$0$1 $2$3 <!----ppppp-->"; $rank-- } if $/.chars }
			| ('<') (\d*\w+) ('>') { { say "\t" x $rank ~ "$0$1$2 <!-- begin tag2 xxx-->" ; $rank++; } if $/.chars }
				<myCDATACorpse> ('</') $1 ('>') { { $rank--;say "\t" x $rank ~ "$3$1$4" ~"   <!-- end tag2 xxx-->"; } if $/.chars }
			| ('<') (\d*\w+) ([<attribute> \s* ]+) ('>') { { my $r="$1-----$2";say "\t" x $rank ~ "$0$1 $2$3 <!-- begin tag2 XXXXW-->" ; $rank++; } if $/.chars }
				<myCDATACorpse> ('</') $1 ('>') { { $rank--; say "\t" x $rank ~ "$4$1$5" ~"   <!-- end tag2-->"; } if $/.chars }
		] 
		<myCDATACorpse> #{ { $rank++;say "\t" x $rank ~ "tag2 part3>$/" ; $rank--} if $/.chars }
	}

	token attribute { \w+ '="' <-[="\<\>\s]>+ \" } 

	rule entities_formats {
		[
			| <entity>
			| <entity_decimal>
			| <entity_hexadecimal>
		]
	}

	token entity {
		'&' <[a..z]>**1..5 ';'  #{ say "wwwwww----|$/|-------------" ~ $/.chars if $/.chars }
	}

	token entity_decimal {
		'&#' <[0..9]>**1..4 ';' { say "entity_decimal: ---------------|$/|-------------" ~ $/.chars if $/.chars }
	}

	token entity_hexadecimal {
		'&#x' <[0..9A..Fa..f]>**1..4 ';' { say "entity_hexadecimal: ---------------|$/|-------------" ~ $/.chars if $/.chars }
	}
};

my @tests = (
#`{{{ }}}
    [1, 'abc'                       ],      # 01
    [1, '<a></a>'                   ],      # 02
    [1, '..<ab>foo&amp;toto</ab>dd'          ],      # 03
    [1, '<a><b>c</b></a>'           ],      # 04
    [1, '<a href="foo"><b>c</b></a>ooo'],      # 05
    [1, 'zzz<a href="foo"><b>c</b></a>ooo'],      # 05
    [1, '<a>b</a>'                  ],      # 10.b
    [1, '<a empty="" ><b>c</b></a>' ],      # 06
    [1, '<a empty=""><b>c</b></a>' ],       # 06.a
    [1, '<a empty=""><b>c</b></a>' ],       # 06.b
    [1, '<a empty="a"><b>c</b></a>' ],      # 06.c
    [1, '<a><b>c</b><c></c></a>'    ],      # 07
    [0, '<'                         ],      # 08
    [0, '<a>b</b>'                  ],      # 09.a
    [1, '<a>b</b>'                  ],      # 09.b
    [0, '<a>b</a'                   ],      # 10.a
    [1, '<a>b</a>'                  ],      # 10.b
    [0, '<a>b</a href="">'          ],      # 11.a
    [1, '<a>b</a href="">'          ],      # 11.b
#`{{{
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
    [1, '<?xml version="1.0" ?><momo>aaa<![CDATA[ <div id="click" class="categorie2">Nouveau menu</div> ooooo <div onclick="click(1,4,2);" class="categorie3">Nouveau menu9</div>azerty]]></momo>'                       ],      # 62
    [1, '<?xml version="1.0" ?><momo>aaa<![CDATA[ <aaaaz> <div id="click" class="categorie2">Nouveau menu</div> ooooo <div onclick="click(1,4,2);" class="categorie3">Nouveau menu9</div>azerty</aaaaz>]]></momo>'                       ],      # 63
    [1, '<?xml version="1.0" ?><momo popo="aze">aaa<![CDATA[ <aaaaz> <div id="click" class="categorie2">Nouveau menu</div> ooooo <div onclick="click(1,4,2);" class="categorie3">Nouveau menu9</div>azerty</aaaaz>]]></momo>'                       ],      # 63
    [1, '<?xml version="1.0" ?><momo>aaa<![CDATA[ <aaaaz> <div id="click" class="categorie2"/> ooooo <div onclick="click(1,4,2);" class="categorie3">Nouveau menu9</div>azerty</aaaaz>]]></momo>'                       ],      # 63
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
    [1, 'a&#x12334;bc'                       ],      # 78
    [1, 'a&#233;&#xE9;&#x123f;&amp;bc'                       ],      # 78
   [1,' <?xml version="1.0"?> <cities><calctime>0</calctime><count>10</count><mode>center</mode><list><item><city id="2978048" name="Saint-Merri"><coord lon="2.3521" lat="48.8592"></coord><country></country><sun rise="2019-05-23T03:59:58" set="2019-05-23T19:34:58"></sun></city><temperature value="295.44" min="294.15" max="296.48" unit="kelvin"></temperature><humidity value="31" unit="%"></humidity><pressure value="1017" unit="hPa"></pressure><wind><speed value="2.6" name="Light breeze"></speed><direction value="250" code="WSW" name="West-southwest"></direction><gust value=""></gust></wind><clouds value="0" name="clear sky" low="0" middle="0" high="0"></clouds><precipitation mode="no"></precipitation><weather number="800" value="Sky is Clear" icon="01d"></weather><lastupdate value="2019-05-23T13:58:40" unix="1558619920"></lastupdate></item><item><city id="6455259" name="Paris"><coord lon="2.3524" lat="48.8565"></coord><country></country><sun rise="2019-05-23T03:59:58" set="2019-05-23T19:34:57"></sun></city><temperature value="295.44" min="294.15" max="296.48" unit="kelvin"></temperature><humidity value="31" unit="%"></humidity><pressure value="1017" unit="hPa"></pressure><wind><speed value="2.6" name="Light breeze"></speed><direction value="250" code="WSW" name="West-southwest"></direction><gust value=""></gust></wind><clouds value="0" name="clear sky" low="0" middle="0" high="0"></clouds><precipitation mode="no"></precipitation><weather number="800" value="Sky is Clear" icon="01d"></weather><lastupdate value="2019-05-23T13:58:40" unix="1558619920"></lastupdate></item><item><city id="6269531" name="Paris 01 Louvre"><coord lon="2.3417" lat="48.8592"></coord><country></country><sun rise="2019-05-23T04:00:00" set="2019-05-23T19:35:00"></sun></city><temperature value="295.44" min="294.15" max="296.48" unit="kelvin"></temperature><humidity value="40" unit="%"></humidity><pressure value="1018" unit="hPa"></pressure><wind><speed value="2.1" name="Light breeze"></speed><direction value="260" code="W" name="West"></direction><gust value=""></gust></wind><clouds value="0" name="clear sky" low="0" middle="0" high="0"></clouds><precipitation mode="no"></precipitation><weather number="800" value="Sky is Clear" icon="01d"></weather><lastupdate value="2019-05-23T13:58:01" unix="1558619881"></lastupdate></item><item><city id="6618607" name="Paris 01"><coord lon="2.3417" lat="48.8592"></coord><country></country><sun rise="2019-05-23T04:00:00" set="2019-05-23T19:35:00"></sun></city><temperature value="295.44" min="294.15" max="296.48" unit="kelvin"></temperature><humidity value="40" unit="%"></humidity><pressure value="1018" unit="hPa"></pressure><wind><speed value="2.1" name="Light breeze"></speed><direction value="260" code="W" name="West"></direction><gust value=""></gust></wind><clouds value="0" name="clear sky" low="0" middle="0" high="0"></clouds><precipitation mode="no"></precipitation><weather number="800" value="Sky is Clear" icon="01d"></weather><lastupdate value="2019-05-23T13:58:01" unix="1558619881"></lastupdate></item><item><city id="2988507" name="Paris"><coord lon="2.3488" lat="48.8534"></coord><country></country><sun rise="2019-05-23T04:00:00" set="2019-05-23T19:34:57"></sun></city><temperature value="295.44" min="294.15" max="296.48" unit="kelvin"></temperature><humidity value="40" unit="%"></humidity><pressure value="1018" unit="hPa"></pressure><wind><speed value="2.1" name="Light breeze"></speed><direction value="260" code="W" name="West"></direction><gust value=""></gust></wind><clouds value="0" name="clear sky" low="0" middle="0" high="0"></clouds><precipitation mode="no"></precipitation><weather number="800" value="Sky is Clear" icon="01d"></weather><lastupdate value="2019-05-23T13:56:00" unix="1558619760"></lastupdate></item><item><city id="2968815" name="Paris"><coord lon="2.3486" lat="48.8534"></coord><country></country><sun rise="2019-05-23T04:00:00" set="2019-05-23T19:34:57"></sun></city><temperature value="295.44" min="294.15" max="296.48" unit="kelvin"></temperature><humidity value="40" unit="%"></humidity><pressure value="1018" unit="hPa"></pressure><wind><speed value="2.1" name="Light breeze"></speed><direction value="260" code="W" name="West"></direction><gust value=""></gust></wind><clouds value="0" name="clear sky" low="0" middle="0" high="0"></clouds><precipitation mode="no"></precipitation><weather number="800" value="Sky is Clear" icon="01d"></weather><lastupdate value="2019-05-23T13:56:00" unix="1558619760"></lastupdate></item><item><city id="2988506" name="Paris"><coord lon="2.3486" lat="48.8534"></coord><country></country><sun rise="2019-05-23T04:00:00" set="2019-05-23T19:34:57"></sun></city><temperature value="295.44" min="294.15" max="296.48" unit="kelvin"></temperature><humidity value="40" unit="%"></humidity><pressure value="1018" unit="hPa"></pressure><wind><speed value="2.1" name="Light breeze"></speed><direction value="260" code="W" name="West"></direction><gust value=""></gust></wind><clouds value="0" name="clear sky" low="0" middle="0" high="0"></clouds><precipitation mode="no"></precipitation><weather number="800" value="Sky is Clear" icon="01d"></weather><lastupdate value="2019-05-23T13:56:00" unix="1558619760"></lastupdate></item><item><city id="6545270" name="Palais-Royal"><coord lon="2.3388" lat="48.8635"></coord><country></country><sun rise="2019-05-23T04:00:00" set="2019-05-23T19:35:02"></sun></city><temperature value="295.44" min="294.15" max="296.48" unit="kelvin"></temperature><humidity value="40" unit="%"></humidity><pressure value="1018" unit="hPa"></pressure><wind><speed value="2.1" name="Light breeze"></speed><direction value="260" code="W" name="West"></direction><gust value=""></gust></wind><clouds value="0" name="clear sky" low="0" middle="0" high="0"></clouds><precipitation mode="no"></precipitation><weather number="800" value="Sky is Clear" icon="01d"></weather><lastupdate value="2019-05-23T13:58:01" unix="1558619881"></lastupdate></item><item><city id="6618620" name="Paris 14"><coord lon="2.3264" lat="48.8331"></coord><country></country><sun rise="2019-05-23T04:00:10" set="2019-05-23T19:34:58"></sun></city><temperature value="295.5" min="294.15" max="296.48" unit="kelvin"></temperature><humidity value="40" unit="%"></humidity><pressure value="1018" unit="hPa"></pressure><wind><speed value="2.1" name="Light breeze"></speed><direction value="260" code="W" name="West"></direction><gust value=""></gust></wind><clouds value="0" name="clear sky" low="0" middle="0" high="0"></clouds><precipitation mode="no"></precipitation><weather number="800" value="Sky is Clear" icon="01d"></weather><lastupdate value="2019-05-23T14:00:04" unix="1558620004"></lastupdate></item><item><city id="6618626" name="Paris 20"><coord lon="2.3984" lat="48.8646"></coord><country></country><sun rise="2019-05-23T03:59:45" set="2019-05-23T19:34:48"></sun></city><temperature value="295.44" min="294.15" max="296.48" unit="kelvin"></temperature><humidity value="31" unit="%"></humidity><pressure value="1017" unit="hPa"></pressure><wind><speed value="2.6" name="Light breeze"></speed><direction value="250" code="WSW" name="West-southwest"></direction><gust value=""></gust></wind><clouds value="0" name="clear sky" low="0" middle="0" high="0"></clouds><precipitation mode="no"></precipitation><weather number="800" value="Sky is Clear" icon="01d"></weather><lastupdate value="2019-05-23T13:59:26" unix="1558619966"></lastupdate></item></list></cities>'],
}}}
);

# -----------------------------

my $count = 1;
for @tests -> $t {
    my $s = $t[1];
    say "very begining:" ~ @lines.elems;
    say "string>$s";
    my $M = XML.parse($s);
    #    say "Expected result $t[0]. If the result is $t[0] then it is OK";
    say "expect: $t[0] --->" ~ !($M  xor $t[0]);
    if !($M  xor $t[0]) {
        say "\nok $count - '$s'";
    } else {
        say "\nnot ok $count - '$s'";
    }
    $count++;
    if @lines.elems {
	    say "Do some cleanings"; 
	    while @lines.elems { shift @lines; }
    }
    $rank = 0;
}

