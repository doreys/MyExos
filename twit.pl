#!/opt/local/bin/perl

use 5.010;

# ------------------------------------------------------
q##//q#
* Created By : sdo
* File Name : twit.pl
* Creation Date : Mon Sep 17 00:58:28 2018
* Last Modified : Mon Sep 17 01:38:27 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
#;
# ------------------------------------------------------


use Net::Twitter;
use Scalar::Util 'blessed';

# When no authentication is required:
my $nt = Net::Twitter->new(legacy => 0);
my ( $consumer_key, $consumer_secret, $token, $token_secret)=(
	"",
	"",
	"",
	"");

# As of 13-Aug-2010, Twitter requires OAuth for authenticated requests
my $nt = Net::Twitter->new(
    traits   => [qw/API::RESTv1_1/],
    consumer_key        => $consumer_key,
    consumer_secret     => $consumer_secret,
    access_token        => $token,
    access_token_secret => $token_secret,
);

my $result = $nt->update('Hello, world! $$');

eval {
    my $statuses = $nt->friends_timeline({ since_id => $high_water, count => 100 });
    for my $status ( @$statuses ) {
        print "$status->{created_at} <$status->{user}{screen_name}> $status->{text}\n";
    }
};
if ( my $err = $@ ) {
    die $@ unless blessed $err && $err->isa('Net::Twitter::Error');

    warn "HTTP Response Code: ", $err->code, "\n",
         "HTTP Message......: ", $err->message, "\n",
         "Twitter error.....: ", $err->error, "\n";
}
