#!/usr/bin/perl
use strict;

my @nice;
open (IN, $ARGV[0]);
while (my $string = <IN>) {
#my @test=("ugknbfddgicrmopn", "aaa", "jchzalrnumimnmhp", "haegwjzuvuyypxyu", "haegwjzuvuyypxyu");
#foreach $string (@test) {
    my($double, $vowel, $clean) = 0;
    chomp $string;
    my @char = split//, $string;
    my $last = "";
    foreach my $c(@char) {
	if ($c eq $last) { $double=1 }
	if ($c =~ /[aeiou]/) { $vowel++ }
	$last = $c;
    }
    if ($string !~ /(ab|cd|pq|xy)/) { $clean = 1 }
    if ($vowel > 2 && $double && $clean) {
	push @nice, $string;
    }
}

print "Nice: " . @nice . "\n";
    
