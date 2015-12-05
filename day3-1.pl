$x = 0;
$y = 0;
$present{$x}{$y}++;
$houses++;

open (IN, $ARGV[0]);
while (my $line = <IN>) {
    chomp $line;
    $string .= $line;
}

my @instruction = split//,$string;
foreach my $i (@instruction) {
    if ($i eq "^") {$y++}
    elsif($i eq "v") { $y-- }
    elsif($i eq "<") { $x-- }
    elsif($i eq ">") { $x++ }
    $houses++ if (! defined $present{$x}{$y});
    $present{$x}{$y}++;
    $total++;
}

print "$total\t$houses\n";
