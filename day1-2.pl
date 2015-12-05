#!perl -w
my $file = $ARGV[0];
my $string;
open (IN, $file);
while (my $line = <IN>) {
    chomp $line;
    $string .= $line;
}
$string =~ s/[^\(\)]//g;
%floor = ("(" => 1,
	  ")" => -1);
	 
@s = split//, $string;
print "@s\n";
for ($i=0; $i<@s; $i++) {
    $f += $floor{$s[$i]};
    print "$i\t$s[$i]\t$f\n";
    if ($f<0) { print $i+1, "\n"; exit; }
}
