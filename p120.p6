#!/usr/bin/env perl6  

use v6;

# Program: p120.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-05_00:14:06

my $string = "superlative";
say "$string contains 'perl'." if $string ~~  /perl/;

#say 'name@co ' x 10;
# Fails to compile ----> say "Success" if 'name@company.uk' ~~ / name@co /;
say "Success" if 'name@company.uk' ~~ / 'name@co' /;
say "Success" if 'name@company.uk' ~~ / name\@co /;
say "Success" if 'name@company.uk' ~~ / name '@' co /;
