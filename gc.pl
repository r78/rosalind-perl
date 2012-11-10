#!/usr/bin/env perl
use warnings;
use strict;

my $id;
my $current_id;
my $gc = 0;
my $current_gc;
my $string;

#compute the GC content of a DNA string
sub get_gc_content {
	my $string = shift;
	my $gc = 0;
	foreach my $base (split(//, $string)) {
		if ($base =~ /G|C/) {
			$gc++;
		}	
	}
	return ($gc / length($string)) * 100;
}

while (<>) {
	chomp($_);
	if ($_ =~ /^>/) {
		#if the line is a new ID and we have read an ID and a string previously
		if ($current_id) {
			$current_gc = get_gc_content($string);
			#check if the current GC is bigger than the current maximum
			if ($current_gc > $gc) {
				$id = $current_id;
				$gc = $current_gc;
			}
		}
		$_ =~ s/^>//;
		#get the next ID
		$current_id = $_;
		$string = "";
	}
	else {
		#build the DNA string
		$string .= $_;
	}
}
#print the ID of the string having the highest GC-content,
#followed by the GC-content of that string.
print "$id\n$gc%\n";
