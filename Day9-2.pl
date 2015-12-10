use Algorithm::Permute;
use strict;

open (IN, $ARGV[0]);
my %GRAPH;
while (my $l = <IN>) {
    chomp $l;
    if ($l =~ /(\w+) to (\w+) \= (\d+)/) {
	my $from = $1; my $to = $2; my $dist = $3;
	$GRAPH{$from}{$to} = $dist;
	$GRAPH{$to}{$from} = $dist;
    } else {
	die "Bad input? $l\n";
    }
}

# first, find the shortest dist - we did that during input
my @locs = keys %GRAPH;
my $iter = Algorithm::Permute->new(\@locs);
my $most;
my @path;
while (my @perm = $iter->next) {
    my $tot = 0;
    for (my $i=0; $i<$#perm; $i++) {
	$tot += $GRAPH{$perm[$i]}{$perm[$i+1]};
#	if ($least && $tot > $least) { last }
    }
    if (! $most || $tot > $most) {
	$most = $tot;
	@path = @perm;
    }
}
print join("->", @path), "\t$most\n";
