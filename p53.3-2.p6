#!/usr/bin/env perl6

use v6.c;

sub do-twice(&code,$value){
	code($value);
	code($value);
}

sub greet($message){
	say $message;
}

sub do-four(&function,$value){
	do-twice(&function,$value);
	do-twice(&function,$value);
}

do-twice(&greet,"Hello world");
do-four(&greet,"What's up doc");
