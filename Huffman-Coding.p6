#!/usr/bin/env perl6  

use v6 ; 


# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : Huffman-Coding.p6
* Creation Date : Wed May 09 23:20:16 2018
* Last Modified : Tue May 29 00:50:44 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* Purpose : Huffman coding (which is not over yet)
*   Check testPair.p6 to complete sort function
*   go this File testPair.p6
]
# ------------------------------------------------------

# Book: Think Perl 6 (pdf v0.5.3 May 2018)
# Program: Huffman-Coding.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2018-05-09_23:20:16

my $str="COMME CHARMANT E";
my %e=();
my %tab=();

subs_str($str);

# We make stats uppon string $str
my %h = mk_stat_huff($str);

# We make a copy
my %ch = %h; # Copy Hash

# We print Stats
print_huff(%h.sort(*.value).reverse);

# We generate table
huff(%h.sort(*.value).reverse);

# We print Stats
print_huff(%tab.sort(*.value),%ch.sort(*.value).reverse);

say $str;
my $ns = shrink($str,%tab);
say $ns;
%tab.sort(*.key).say;
%tab.sort(*.value).say;
my $r = unshrink($ns,%tab.sort(*.value));
say $r;

sub unshrink($str,@ta){
	my %tab = @ta;
	my $ns = $str;

	%tab.say;
	for reverse %tab.kv -> $k,$v {
		say "$k ----- $v";
		$ns ~~ s:g/$k/$v/;
		say $ns;
	}
	return $ns;
}

sub shrink($str,%tab){
	my $ns = $str;
	for $str.comb -> $l {
		#say $ns;
		$ns ~~ s:g/$l/%tab{$l}/;
		#say $ns;
	}
	return $ns;
}

sub mk_stat_huff(Str $str){
	my %stat=();
	for $str.comb -> $l {
		%stat{$l}++;
	}
	return %stat;
}

multi sub print_huff(@ta){
	my %tab = @ta ; 
	my $nbits=0;

	say sprintf '%6s%10s',"char"," num";
	for %tab.kv -> $k,$v {
		my $p = $k;
		$p ~~ s:g/\c[0020]/\x20/;
		say sprintf '%6s%10s',$p,$v;
		$nbits+=$v.chars;
	}
	say ' ' x 13 ~ '_' x 3;
	say (sprintf '% 16d',$nbits) ~ " \n"; 
}

multi sub print_huff(@ta,@co){
	my %tab = @ta ; 
	my %tabl = @co;
	my $nbits=0;

	say sprintf '%6s%10s%10s',"char","Code","Length";
	for %tab.kv -> $k,$v {
		my $p = $k;
		my $tp =  %tabl{$p};
		$p ~~ s:g/\c[0020]/\x20/;
		say sprintf '%6s%10s%10s',$p,$v,($v.chars ~ "*" ~ $tp ~ "=" ~ $v.chars*$tp);
		$nbits+=($v.chars*$tp);
	}
	say ' ' x 23 ~ '_' x 3;
	say (sprintf '% 26d',$nbits) ~ " \n"; 
}


sub huff(@h is copy){
	my %v1=(); my ($k1,$v1)=();
	my %v2=(); my ($k2,$v2)=();
	if @h.elems >= 0 {
		%v1=@h.pop();
		($k1,$v1)=%v1.kv;
		for $k1.comb -> $l {
			if $l ∈ %h.keys {
				if defined %tab{$l} {
					%tab{$l} = "0" ~  %tab{$l} ; 
				} else {
					%tab{$l} = "0" ; 
				}
			}
		}
		#say "\tcandidate right: $k1,$v1";
	}
	if @h.elems >= 0 {
		%v2=@h.pop();
		($k2,$v2)=%v2.kv;
		for $k2.comb -> $l {
			if $l ∈ %h.keys {
				if defined %tab{$l} {
					%tab{$l} = "1" ~  %tab{$l} ; 
				} else {
					%tab{$l} = "1" ; 
				}
			}
		}
	}
	if @h.elems > 0 {
		%e.push: ($k2,1);
		%e.push: ($k1,0);
		my Pair $p = (($k1,$k2)) =>$v1+$v2;
		@h.push($p);
		my %hh = @h;
		huff(%hh.sort(*.value).reverse);
	}
	else {
		%e.push: ($k2,1);
		%e.push: ($k1,0);
		my Pair $p = (($k1,$k2)) => $v1+$v2;
		@h.push($p);
		my %hh = @h;
		%h = %hh.sort(*.value).reverse;
	}
}

sub subs_str($str is rw){
	$str ~~ s:g/\x20/\c[0020]/;
}
