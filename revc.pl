#!/usr/bin/env perl
use warnings;
use strict;

#returns the complement of a DNA base
sub get_base_complement {
	my $base = shift;
	my %complements = ('A' => 'T', 'T' => 'A', 'C' => 'G', 'G' => 'C');
	my $complements_ref = \%complements;
	return $complements{$base};
}

#returns the reverse complement of a DNA string
sub get_string_reverse_complement {
	my $string = reverse(shift);
	my @revc = map { get_base_complement($_) } split(//, $string);
	return join('', @revc);
}

while (<>) {
	chomp($_);
	print get_string_reverse_complement($_)."\n";
}
