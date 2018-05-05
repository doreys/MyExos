# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: MyTreeLibrary.pm6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2018-05-05_02:08:57

unit module MyTreeLibrary:ver<0.0.0.1>:auth<Sebastien Dorey - SDO (sebastien.dorey@laposte.net)> ;

sub creates-tree($va) is export {
	my Pair @ptr=(Nil,Nil);
	my Pair $p = $va => @ptr ;
	return $p ;
}

sub prints-tree(Pair $p) is export {
	say "-" if $p ~~ Nil;
	$p.say if !($p ~~ Nil);
}

sub sets-left(Pair $tree,$va) is export {
	my Pair @ptr=($tree,Nil);
	my Pair $p = $va => @ptr ;
	return $p ;
}

sub sets-right(Pair $tree,$va) is export {
	my Pair @ptr=(Nil,$tree);
	my Pair $p = $va => @ptr ;
	return $p ;
}

sub gets-left(Pair $tree) is export {
	return (Nil => Nil) if $tree ~~ (Nil => Nil);
	my $value = $tree.value;
	return $tree.key => $value[0];
}

sub gets-right(Pair $tree) is export {
	return (Nil => Nil) if $tree ~~ (Nil => Nil);
	my $value = $tree.value;
	return $tree.key => $value[1];
}
