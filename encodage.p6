# ------------------------------------------------------
#`[
* @author Sébastien Dorey
* File Name :
* @create date 2019-07-19 14:59:25
* @modify date 2019-07-19 14:59:25
* @email sebastien.dorey@laposte.net
* Version : 0.0.0.0
* License:
*       Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
*       Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* @desc [description]
]
# ------------------------------------------------------

#!/usr/bin/env perl6

use v6 ;


class EncodedBuffer {
    has $.enc;
    has $.data;

    submethod BUILD(:encodage(:$enc), :$data) { # encodage et un alias sur l'attribut enc
        $!enc  := $enc;
        $!data := $data;
    }
}
my $b1 = EncodedBuffer.new( encodage => 'UTF-8', data => [64, 65] );
my $b2 = EncodedBuffer.new( enc      => 'UTF-8', data => [64, 65] );
#  enc et encodage sont maintenant tous les deux autorisés
