#!perl -w
my $file = $ARGV[0];
my $string;
open (IN, $file);
while (my $line = <IN>) {
    chomp $line;
    $string .= $line;
}
$string =~ s/[^\(\)]//g;
my $T=length($string);
print "total length of string: $T\n";
my $upstring = $downstring = $string;

$upstring =~ s/\)//g;
$downstring =~ s/\(//g;
my $up = length($upstring);
my $d = length($downstring);
print "Number of ('s : $up\n";
print "Number of )'s : $d\n";
print $up - $d, "\n";
