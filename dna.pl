#!/usr/bin/env perl
use warnings;
use strict;

my %count;
while (<>) {
	chomp($_);
	#array with the number of times each symbol occurs
	%count = ();
	my @symbols = split(//, $_);
	#count each symbol
	foreach my $symbol (split(//, $_)) {
		$count{$symbol}++;
	}
	#returns a formatted string with the results
	print join(" ", ($count{A}, $count{C}, $count{G}, $count{T})) . "\n";
}
