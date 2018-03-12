#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: exo11-5.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2018-03-11_17:58:42

my %res=choosen_from_hist storeDico('parag11.4-exo11.2-51023-0.txt');
for %res.sort(*.value).kv -> $k,$v {
	say "$k $v";
}

sub choosen_from_hist(Str $string){
	my %histo;
	my %result;

	say "$string";
	for $string.comb -> $letter {
		#say $letter;
		%histo{$letter}++;
	}
	my $si=$string.chars;
	for %histo.kv -> $k,$v {
		%result{$k} = "$v/$si";
	}
	return %result;
}


sub storeDico($bn){
	my %words=();
	my @kk; # old dico within an array we lost number of words
	my $pic;

	my @lin= "$bn".IO.lines;
	my $headerSkipped=False;

	for @lin <-> $line {
		given $line {
			when m/^\*\*\* (<-[\*]>*) <?{$0 ~~ m:i/end/}> \*\*\*$/ { 
					$headerSkipped	= False ;
				}
			when m/^\*\*\* (<-[\*]>*) <?{$0 ~~ m:i/start/}> \*\*\*$/ {
					$headerSkipped	= True ; 
				}
			default {
					if $headerSkipped {
						$line.chomp();
						$line = $line.lc;
						my @nwo=$line.split(/
									' ' | 
									'/' | 
									';' |
									'.' |
									',' |
									':' |
									'{' |
									'}' |
									'(' |
									"'" |
									'|' |
									'"' |
									'_' |
									')'
								      /); # new word
						# Create a dictionary of words
						for @nwo -> $w {
							%words{$w}++ if $w  ~~ m/<[A..Z a..z]>+/;
							@kk.push($w) if $w ∉ @kk
						}
					}
				}
		}
	}


	$pic = @kk.elems.rand.Int;
	my $elm = splice @kk,$pic-1,1;
	#say "$pic -> " ~ $elm;
	@kk.push($elm);
	@kk.sort();
	return $elm.Str;
}

