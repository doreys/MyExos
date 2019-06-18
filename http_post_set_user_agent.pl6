#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : http_post_set_user_agent.pl6
* Creation Date : Tue Jun 18 10:30:17 2019
* Last Modified : Tue Jun 18 11:29:13 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
	check: http://perl6maven.com/simple-web-client
	check: https://github.com/supernovus/exemel

	macbook-pro-de-sdo:tp6 sdo$ ./http_post_set_user_agent.pl6
	{
	  "args": {},
	  "data": "name=Larry%20Wall&math=19%2B23%3D42&language=Perl",
	  "files": {},
	  "form": {},
	  "headers": {
	    "Content-Length": "49",
	    "Host": "httpbin.org",
	    "User-Agent": "Perl 6 Maven"
	  },
	  "json": null,
	  "origin": "90.44.192.251, 90.44.192.251",
	  "url": "https://httpbin.org/post"
	}

]
# ------------------------------------------------------

use XML;
use URI::Escape;
use LWP::Simple;

print "Content-type: text/html\n\n";

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

my $xml = from-xml('<test><folks we = "Al Barb Carl"/></test>');
say $xml[0]; # <folks we="Al Barb Carl"/>

$xml[0].add-values("we", <Carl Dave Ellie>.Set);
say $xml[0]; # <folks we="Al Barb Carl Dave Ellie"/>
