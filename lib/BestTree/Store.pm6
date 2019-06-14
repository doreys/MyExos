#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : BestTree::Store.pm6
* Creation Date : Sun Jun  2 23:03:44 2019
* Last Modified : Mon Jun  3 00:23:08 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

unit module BestTree::Store; 

class BestTree::Store {
    method all-trees() { ... }
    method suggest-tree(BestTree::Tree $tree --> Nil) { ... }
    method find-tree(Rat $latitude, Rat $longitude --> BestTree::Tree) { ... }
}
