#!perl

open (IN, $ARGV[0]);

our $grid->[0..999]->[0..999] = 0;

while (my $l = <IN>) {
    chomp $l;
    my ($action, $startx, $starty, $endx, $endy);
    if ($l =~ /(.*)\s(\d+)\,(\d+) through (\d+)\,(\d+)/) {
	$action=$1;
#	print "ACTION: $action\t@coords\n";
	for (my $x=$2; $x<=$4; $x++) {
	    for (my $y=$3; $y<=$5; $y++) {
#		print "\t$x $y: $grid->[$x]->[$y]\t$action\t";
		$grid->[$x]->[$y] = 1 if ($action eq "turn on");
		$grid->[$x]->[$y] = 0 if ($action eq "turn off");
		$grid->[$x]->[$y] = !($grid->[$x]->[$y]) if ($action eq "toggle");
#		print "$grid->[$x]->[$y]\n";
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

