# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: MyTreeLib.pm6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2018-05-03_14:12:57

unit module MyTreeLib:ver<0.0.1>:auth<Sebastien Dorey - SDO (sebastien.dorey@laposte.net)> ;

sub new_node_tree($val) is export {
	my Pair $new_pair = $val => (Nil,Nil);
	#say $new_pair.perl;
	return $new_pair;
}

sub sets_left_node(Pair $tree,$va) is export {
	my Pair $new_node = $va => ($tree,Nil);
	return $new_node;
}

sub sets_right_node(Pair $tree,$va) is export {
	my Pair $new_node = $va => (Nil,$tree);
	return $new_node;
}

sub gets_left(Pair $tree) is export {
	return gets_left_node(gets_value($tree));
	#return gets_left_node($tree);
}

sub gets_right(Pair $tree) is export {
	return gets_right_node(gets_value($tree));
	#return gets_right_node($tree);
}

sub gets_left_node(Pair $tree) is export {
	my $key = $tree.key ; 
	my @new_ptr = $tree.value;
	my @b = @new_ptr[0];
	return $key => @b[0] ;
}

sub gets_right_node(Pair $tree) is export {
	my $key = $tree.key ; 
	my @new_ptr = $tree.value;
	my @b = @new_ptr[1];
	return $key => @b[0] ;
}

sub gets_key(Pair $pair) is export {
	return $pair.key;
}

sub gets_value(Pair $pair) is export {
	return $pair.value;
}

sub prints_pair(Pair $pair ) is export {
	say $pair.perl ;
}
