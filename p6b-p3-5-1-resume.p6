#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : p6b-p3-5-1-resume.p6
* Creation Date : Sat Jun  1 23:44:35 2019
* Last Modified : Sat Jun  1 23:53:27 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
]
# ------------------------------------------------------

say [+] 1, 2, 3;    # 6
say [+] ();         # 0
say [~] <a b>;      # ab
say [**] 2, 3, 4;   # 2417851639229258349412352 (= 2**(3**4) = 2**81)

[+] 1, 2, 3, 4     # 1, 3, 6, 10
[**] 2, 3, 4       # 4, 81, 2417851639229258349412352

if [<=] @list {
    say "Liste en ordre ascendant";
}
