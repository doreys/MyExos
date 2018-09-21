#!/usr/bin/env perl6

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 May 2018)
# Program: myTreeLibrary.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2018-05-05_02:17:41

use lib ".";  # tells Perl to look for modules in the current dir
use MyTreeLibrary;

my Pair $tree = creates-tree("a"); 
prints-tree($tree);

$tree = sets-left($tree,"c"); 
prints-tree($tree);

$tree = sets-right($tree,"m"); 
prints-tree($tree);

$tree = sets-left($tree,"d"); 
prints-tree($tree);

my Pair $tr = $tree;
$tr = gets-left($tr);
prints-tree($tr);

$tr = gets-right($tr.value);
prints-tree($tr);

$tr = gets-left($tr.value);
prints-tree($tr);
