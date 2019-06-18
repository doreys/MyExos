#!/Users/sdo/rakudo/install/bin//perl6
# #!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : http_get.pl6
* Creation Date : Tue Jun 18 09:59:06 2019
* Last Modified : Tue Jun 18 10:21:19 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

#use v6;
use LWP::Simple;

print "Content-type: text/html\n\n";
my $html = LWP::Simple.new.get("http://httpbin.org/ip");
say $html;
#/Users/sdo/rakudo/install/bin//perl6

my $html2 = LWP::Simple.new.get("https://httpbin.org/ip");
say $html2;

my $html3 = LWP::Simple.new.get('http://api.openweathermap.org/data/2.5/find?APPID=0efa8f218924f2f1d194893438218851&lat=48.83710288573513&lon=2.358329946843032&cnt=2&mode=xml');
say $html3;
