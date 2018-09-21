#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : ExampleClassTask.p6
* Creation Date : Fri Jul  6 15:35:00 2018
* Last Modified : Fri Jul  6 15:39:16 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
		https://docs.perl6.org/language/classtut
]
# ------------------------------------------------------

class Task {
    has      &!callback;
    has Task @!dependencies;
    has Bool $.done;

    # Normally doesn't need to be written
    method new(&callback, *@dependencies) {
        return self.bless(:&callback, :@dependencies);
    }

    # BUILD is the equivalent of a constructor in other languages
    submethod BUILD(:&!callback, :@!dependencies) { }

    method add-dependency(Task $dependency) {
        push @!dependencies, $dependency;
    }

    method perform() {
        unless $!done {
            .perform() for @!dependencies;
            &!callback();
            $!done = True;
        }
    }
}

my $eat =
    Task.new({ say 'eating dinner. NOM!' },
        Task.new({ say 'making dinner' },
            Task.new({ say 'buying food' },
                Task.new({ say 'making some money' }),
                Task.new({ say 'going to the store' })
            ),
            Task.new({ say 'cleaning kitchen' })
        )
    );

$eat.perform();
