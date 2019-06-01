#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : alb.p6
* Creation Date : Sat Jun  1 00:39:42 2019
* Last Modified : Sat Jun  1 01:02:25 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

for dir(test => /:i '.' pl $/) -> $l {
	say "--->$l";
}

sub MAIN($dir = '.') {
    my @todo = $dir.IO;
    while @todo {
        for @todo.pop.dir -> $path {
            say $path.Str;
            @todo.push: $path if $path.d;
        }
    }
}

