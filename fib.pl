#!/usr/bin/env perl
use warnings;
use strict;

#memoize the function to speed computation
{ my @memo;
    sub fib {
        #number of generations
        my $n = shift;
        #number of pairs in each litter
        my $k = shift;
        return $memo[$n][$k] if defined $memo[$n][$k];
        return $memo[$n][$k] = 1 if $n <= 2;
        #only the older rabbits produce a litter
        $memo[$n][$k] = fib($n - 1, $k) + ($k * fib($n - 2, $k));
    }
}

while (<>) {
    chomp($_);
    my ($n, $k) = split(' ', $_);
    print fib($n, $k) . "\n";
}
