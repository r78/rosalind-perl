#!/usr/bin/env perl
use warnings;
use strict;

my @s;
my @t;

#compute the hamming distance between two strings
sub get_hamming_distance {
	my $s = shift;
	my $t = shift;
	my $hamm = 0;
	#compare the base in the nth position of each string
	for (my $i = 0; $i < scalar(@s); $i++) {
		#increment the hamming distance if the bases are different
		$hamm++ if ($s[$i] ne $t[$i]);
	}
	return $hamm;
}

while (<>) {
	chomp($_);
	#read both strings and store their bases in two arrays
	if ($. == 1) {
		@s = split(//, $_);
	}
	else {
		@t = split(//, $_);
	}
}

print get_hamming_distance(\@s, \@t) . "\n";
