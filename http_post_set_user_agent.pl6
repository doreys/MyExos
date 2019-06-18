#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : http_post_set_user_agent.pl6
* Creation Date : Tue Jun 18 10:30:17 2019
* Last Modified : Tue Jun 18 10:31:16 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

use URI::Escape;
use LWP::Simple;

my %params =
   name     => "Larry Wall",
   language => "Perl",
   math     => "19+23=42",
;

my $url-params = %params.kv.map( -> $k, $v { "$k=&uri-escape($v)" }).join('&');

my $html = LWP::Simple.new.post("http://httpbin.org/post",
    {
        "User-Agent" => "Perl 6 Maven"
    }, $url-params);
say $html;

