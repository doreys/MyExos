#!/opt/local/bin/perl

use 5.010;

# ------------------------------------------------------
q##//q#
* Created By : sdo
* File Name : 20190104_8-2_param.pl
* Creation Date : Fri Jan  4 16:21:41 2019
* Last Modified : Fri Jan  4 16:36:26 2019
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
#;
# ------------------------------------------------------

#my $t={ my ($a,$b)=@_;say "$a $b";};
my $t=sub { my ($a,$b)=@_;say "$a $b";};
$t->("123","7856");
