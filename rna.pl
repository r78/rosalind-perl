#!/usr/bin/env perl
use warnings;
use strict;

while (<>) {
	chomp($_);
	$_ =~ s/T/U/g;
	print $_."\n";
}
