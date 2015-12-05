$X{'santa'} = 0;
$Y{'santa'} = 0;
$X{'robot'} = 0;
$Y{'robot'} = 0;
$house{$X{'santa'}}{$Y{'santa'}}++;
$house{$X{'robot'}}{$Y{'robot'}}++;
$houses++;

open (IN, $ARGV[0]);
while (my $line = <IN>) {
    chomp $line;
    $string .= $line;
}

my @dir = split//,$string;
for (my $i=0; $i<@dir; $i++) {
    if ($i%2 == 0) { $who = 'santa' }
    else { $who = 'robot'}
    if ($dir[$i] eq "^") {$Y{$who}++}
    elsif($dir[$i] eq "v") { $Y{$who}-- }
    elsif($dir[$i] eq "<") { $X{$who}-- }
    elsif($dir[$i] eq ">") { $X{$who}++ }
#    print "$i\t$who\t$dir[$i]\t$X{$who}\t$Y{$who}\n";
    $houses++ if (! defined $house{$X{$who}}{$Y{$who}});
    $house{$X{$who}}{$Y{$who}}++;
    $total++;
}

print "$total\t$houses\n";
