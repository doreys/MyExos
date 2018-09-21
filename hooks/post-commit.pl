#!/opt/local/bin/perl 

use 5.010;

# ------------------------------------------------------
q##//q#
* Created By : sdo
* File Name : post-commit.pl
* Creation Date : Mon Sep 17 00:58:28 2018
* Last Modified : Fri Sep 21 00:55:01 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0 
* 	Unported License, which is available at http: //creativecommons.org/licenses/by- nc/3.0/.
* Purpose :
#;
# ------------------------------------------------------


use LWP::Simple qw($ua head);
use Net::Twitter;
use Scalar::Util 'blessed';
use POSIX qw(strftime);
use Cwd;
use File::Basename;
use Data::Dumper qw(Dumper);

use constant MAX_CHAR_COMMENT => 50;
use constant MAX_CHAR_BRANCH_NAME => 20;

my $mtwitter="https://twitter.com/Sh4rkb41t"; # Twitte account
my $datestring = strftime '%Y-%m-%d_%H:%M:%S', localtime(); # set date format + time format
my ( $consumer_key, $consumer_secret, $token, $token_secret)=(
								"X3NiE5Vr8HKVsURUTcRzcbvGq",
								"S11c2CsO3XGB6ziQnWw4BYRb3oOa3hQUQr7OmWwyh0cqFrZ2JC",
								"171048000-Zo9wyN7EyV5cpdx6mPnW75rmAw0DIH5JqWBLPg7d",
								"OCQglb1XnAo1CQY44TJCi61BZ5cJwI61JxrrJsAjSnkow");

my $nt = Net::Twitter->new(
			    traits   => [qw/API::RESTv1_1/],
			    consumer_key        => $consumer_key,
			    consumer_secret     => $consumer_secret,
			    access_token        => $token,
			    access_token_secret => $token_secret,
			); # Set file handler for twitter account

my $curpa=getcwd();# We save the current path
my $remoteOrigin=`git config remote.origin.url`; # Got url with .git
$remoteOrigin=~m/\/([^\/\n]+\/[^\/\n]+)(.git){0,1}$/i; # Select the name in $1
my $baseName=$1; # Gets base name of the repo
chomp($baseName); # Remove end character \n
$baseName=~s/(.git){0,1}$//i; # Remove .git end characters
#$baseName="$baseName";
my $myHashValueCommit=`git log -n 1 --pretty=format:"%H"`; # Get hash value to reach info on repo
my $whoDidIt=`git var GIT_COMMITTER_IDENT`; # Get committer info 
chomp($whoDidIt); # Remove end character \n
my $curBranch=`git branch`; # We get the all the branch names

# Find branch name and concatenate if lenght >MAX_CHAR_BRANCH_NAME with ...
foreach my $mlb (split(/\n/,$curBranch)){ # Begin enter the loop 
	if ($mlb=~m/^\ *\*\ /){ # Begin Check for selected branch
		$mlb=~s/^\ *\*\ *//; # We remove the selected
		$curBranch=(length("$mlb") >MAX_CHAR_BRANCH_NAME ) ? substr($mlb,0,MAX_CHAR_BRANCH_NAME-1)."...":$mlb; # We concatenate ... if larger >MAX_CHAR_BRANCH_NAME
		#print "----------------------------->$curBranch\n";
	} # End Check for selected branch
} # End enter the loop 

#print "----------------------------->$curBranch\n";
my $mpwd=`git rev-parse --git-dir`;# we get the path home repository
chomp($mpwd); # We remove \n
open(R,getcwd()."/.git/COMMIT_EDITMSG")||die("Error $!");
my $commit_msg=<R>;
close(R)||die("Error $!");
chomp($commit_msg);
#print "*******************************>$commit_msg\n";
my $mtosend=(); # Message to send
my $dir_store="bkUps";

#print "xxxxxxxxxxxxxx>$myHashValueCommit<xxxxxxxxxxxxxxxxxxxxxx\n";
#print "****************>$remoteOrigin\n";
$remoteOrigin=~s/(.git){0,1}$/\/commit\/$myHashValueCommit/; # We create the url to get the committed info
#print "****************>$remoteOrigin\n";
if(length($commit_msg)>=MAX_CHAR_COMMENT){ # Begin Truncate the message
	$mtosend="$whoDidIt\n[$curBranch,$baseName] ". substr($commit_msg,0,MAX_CHAR_COMMENT-1) ."...\n$remoteOrigin"; # Message to send
} # End Truncate the message
else { # Begin Orignal message
	$mtosend="$whoDidIt\n[$curBranch,$baseName] $commit_msg\n$remoteOrigin"; # Message to send
} # End Orignal message
#print "*********)$mpwd ".length($mpwd)."\n";
chdir("$mpwd"); # We got to directory
#print "Go to $mpwd\n".getcwd()."\n";

if(! -d "$dir_store"){ # Begin If directory does not exist
	#print "We create $dir_store in $mpwd\n".getcwd()."\n";
	mkdir("$dir_store")||die("Error: $!\n"); # We create the directory to store message to send
} # End If directory does not exist

#print "Go to $dir_store\n";
chdir("$dir_store")||die("Error: $!\n"); # We go into the directory
my $lt=localtime(); # We create memory to get time 
open(W,">bakups_${lt}_$$.txt") || die("Error: $!\n");# We create a file to store the message
print W "$mtosend"; # We store data
close(W) || die("Error: $!\n"); # We close file
#print "@@@@>current dir:".getcwd()."\n";
opendir(my $dh,".") || die("Error: $!\n"); # We read current directory
my @f=sort { (stat($a))[9] <=> (stat($b))[9] }  grep { !/^\.{1,2}$/ && /^bakups\_[a-zA-Z\ \:0-9]+\_[0-9]+\.txt$/ } readdir($dh); # We store in an array file that old messages
closedir $dh || die("Error: $!\n"); # We close directory
foreach my $fn (@f){ # Begin Read file list
	open(R,"<$fn") || die("Error: $_\n"); # We open a file
	my @u=<R>; # We create a memory and we store the file content
	close(R)||die("Error:$$\n");# We close the file
	$datestring = strftime '%Y-%m-%d_%H:%M:%S', localtime(); # Calculte the date before sending
	#print "******>$fn " . (stat($fn))[9] . "\n";
	$mtosend=join("",("$datestring\n",@u)); # create a memory that old content of current file as and array in a string
	my $result = $nt->update("$mtosend"); # We sendout the string to twitter account
	if(my $err=$@){ # Begin We check if error occured
		warn  "HTTP Response Code: ",$err->code, "\n"; # If there is an error we printout the code of error
	} # End We check if error occured
	else { # Begin else 
		print "Remove $fn\n"; # Prompt that the message will be destroyed because it was well sent
		unlink($fn) || die("Error: $$\n"); # We remove the file
	} # End else 
} # End Read file list
chdir("$curpa"); # We come back to the current path from the begining
