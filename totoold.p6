#!/usr/bin/env perl6

use v6 ;

#use Grammar::Tracer;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : totoold.p6
* Creation Date : Sat Apr 13 23:44:44 2019
* @modify date 2020-01-14 23:52:38
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* Purpose :
   - Basic tests:
   	• Les balises ouvrantes <item> ---> opening tag checked and verified (that's in the example but need to be checked)
	• Les balises fermantes </item> ---> opening tag checked and verified (that's in the example but need to be checked)
	• Les balises vides <nop/> ---> null tag checked and verified (that's in the example but need to be checked)
   - Extra tests:
	X du texte pur contient des entités telles que &amp; ;
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
		<antity> <text>
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
		<antity> 
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
		#[ | <tag2> | <text2> ]*
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

	token antity {
		[
			| '&amp;'
		]
	}
};

my @tests = (
    [1, '<?xml version="1.0" ?><momo>aaa<![CDATA[ <div id="click" class="categorie2">Nouveau menu</div> ooooo <div onclick="click(1,4,2);" class="categorie3">Nouveau menu9</div>azerty]]></momo>'                       ],      # 62
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
