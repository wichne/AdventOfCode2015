#!perl

open (IN, $ARGV[0]);

our $grid->[0..999]->[0..999] = 0;

while (my $l = <IN>) {
    chomp $l;
    my ($action, $startx, $starty, $endx, $endy);
    if ($l =~ /(.*)\s(\d+)\,(\d+) through (\d+)\,(\d+)/) {
	$action=$1;
	@coords = ($2, $3, $4, $5);
	for (my $x=$2; $x<=$4; $x++) {
	    for (my $y=$3; $y<=$5; $y++) {
		$grid->[$x]->[$y] += 1 if ($action eq "turn on");
		$grid->[$x]->[$y] -= 1 if ($action eq "turn off" && $grid->[$x]->[$y]>0);
		$grid->[$x]->[$y] += 2 if ($action eq "toggle");
	    }
	}
    }
}

my $on;
for ($x=0; $x<1000; $x++) {
    for ($y=0; $y<1000; $y++) {
	$on+=$grid->[$x]->[$y];
    }
}
print "Lights on : $on\n";

