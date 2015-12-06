#!/usr/bin/perl
use strict;

my @nice;
my ($O, $P) = 0;
open (IN, $ARGV[0]);
while (my $string = <IN>) {
#my @test=("qjhvhtzxzqqjkmpb", "xxyxx", "uurcxstgmygtbstg", "ieodomkazucvgmuy");
#foreach my $string (@test) {
    my($repeatPair, $oneBetween);
    chomp $string;
    while ($string =~ /(..)/g) {
	my $target = $1;
	my $query = $`. " " . $';
	#print "$string\t$target\t$query\n";
	if ($query =~ /$target/) { $repeatPair = 1; last; }
	pos $string -= 1;
    }
    my @char = split//, $string;
    for (my $i=0; $i<@char; $i++) {
	if (defined $char[$i+2] && $char[$i] eq $char[$i+2]) { $oneBetween = 1; last; }
    }
    if ($oneBetween && $repeatPair) { 
	print "$string\tNice\n";
	push @nice, $string; }
    else { print "$string\tNaughty\t$repeatPair\t$oneBetween\n"; }
    $P+=$repeatPair;
    $O+= $oneBetween;
}

print "Nice: " . @nice . "\n";
print "repeatPair: $P\noneBetween: $O\n";
    
