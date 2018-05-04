#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 May 2018)
# Program: myTree.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2018-05-03_14:19:15

use lib ".";  # tells Perl to look for modules in the current dir
use MyTreeLib;

my Pair $tree = new_node_tree("2");
$tree = sets_left_node($tree,"4");
$tree = sets_left_node($tree,"5");
$tree = sets_right_node($tree,"6");
say "********>" ~ $tree.perl;
#prints_pair($p);

# ------------------------
my Pair $p = gets_left_node($tree);
prints_pair($p);

# ------------------------
$p = gets_right_node($tree);
prints_pair($p);
#exit(-1);

$p = gets_left($p);
prints_pair($p);
#exit(-1);

# ------------------------
$p = gets_left($p);
prints_pair($p);

# ------------------------
$p = gets_left($p);
prints_pair($p);
