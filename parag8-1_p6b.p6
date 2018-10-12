#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : parag8-1_p6b.p6
* Creation Date : Sat Oct 13 00:27:44 2018
* Last Modified : Sat Oct 13 00:28:00 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

# Une grammaire pour analyser syntaxiquement (parser) une URL:
grammar URL {
    token TOP {
        <schema> '://' 
        [<ip> | <hostname> ]
        [ ':' <port>]?
        '/' <path>?
    }
    token byte {
        (\d**1..3) <?{ $0 < 256 }>
    }
    token ip {
        <byte> [\. <byte> ] ** 3
    }
    token schema {
        \w+
    }
    token hostname {
        (\w+) ( \. \w+ )*
    }
    token port {
        \d+
    }
    token path {
        <[ a..z A..Z 0..9 \-_.!~*'():@&=+$,/ ]>+
    }
}

my $match = URL.parse('http://perl6.org/documentation/');
say $match<hostname>;       # perl6.org
