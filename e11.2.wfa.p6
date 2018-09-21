#!/usr/bin/env perl6  

use v6 ; 

# Book: Think Perl 6 (pdf v0.5.3 August 2017)
# Program: e11.2.wfa.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2018-02-19_13:53:27


statBooks('parag11.4-exo11.2-56609-0.txt');
statBooks('parag11.4-exo11.2-51023-0.txt');
sub statBooks($bn){
	my @words=();

	my @lin= "$bn".IO.lines;
	my $headerSkipped=False;
	my %wc;

	for @lin <-> $line {
		given $line {
			when m/^\*\*\* (<-[\*]>*) <?{$0 ~~ m:i/end/}> \*\*\*$/ { 
					$headerSkipped	= False ;
					say $line if $headerSkipped == False;
				}
			when m/^\*\*\* (<-[\*]>*) <?{$0 ~~ m:i/start/}> \*\*\*$/ {
					$headerSkipped	= True ; 
					say $line if $headerSkipped == True;
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
									')'
								      /);
						for @nwo -> $w {
							%wc{$w}++ if $w  ~~ m/<[A..Z a..z]-[0..9]>+/;
						}
						#@words.append(@nwo);
					}
				}
		}
	}
	my $nw=0;# number of words
	for %wc.kv -> $k,$v {
		$nw+=$v;
		#say "$k -> $v";
	}
	say "$bn\n\tNumber of words: $nw;\n\tNumber of different words: " ~ %wc.elems ~ "\n";
}
