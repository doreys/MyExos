#!/usr/bin/env perl6  

use v6;

# Program: ./p127-exo3.p6
# User: sdo
# License:
# 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
# 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
# 	at http://creativecommons.org/licenses/by-nc/3.0/.
# Date: 2017-08-09_23:22:57

say ~$0 if 'appeal' ~~ /((\w)$0)/;
say ~$1 if 'coffee' ~~ /((\w)$0).*((\w)$0)/;
say ~$2 if 'Mississippi' ~~ /((\w)$0).*((\w)$0).*((\w)$0)/;
