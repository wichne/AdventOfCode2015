use strict;

our %CIRCUIT;

my $t = $ARGV[0];
#my @test = ("123 -> x","456 -> y","x AND y -> d","x OR y -> e","x LSHIFT 2 -> f","y RSHIFT 2 -> g","NOT x -> h","NOT y -> i");
#foreach my $line (@test) {

# drink in the whole circuit
open (IN, $ARGV[1]);
while (my $line = <IN>) {
    chomp $line;
    if ($line =~ /(.*) \-\> (\w+)/) {
	my $signal_string = $1;
	my $wire = $2;
	$CIRCUIT{$wire} = $signal_string;
    } else {
	die "Regular expression is wrong.\n";
    }
}
our $depth = 0;
# evaluate wire a
my $result = evaluate($t);
print "$t\t$result\n";
sub evaluate {
    my $wire = shift;
    my $r;
    my $signal = $CIRCUIT{$wire};
    $depth++;
    print $depth . ("." x ($depth - 1)) . "$signal -> $wire\n";

    if ($signal =~ /^\d+$/) { $CIRCUIT{$wire} = $signal * 1}
    elsif ($signal =~ /(\w+) AND (\w+)/) {
	my ($a, $b) = ($1, $2);
	my $x = numeric($a) ? $a * 1: evaluate($a);
	my $y = numeric($b) ? $b * 1: evaluate($b);
	$CIRCUIT{$wire} = ($x & $y);
    } elsif ($signal =~ /(\w+) OR (\w+)/) {
	my ($a, $b) = ($1, $2);
	my $x = numeric($a) ? $a * 1: evaluate($a);
	my $y = numeric($b) ? $b * 1: evaluate($b);
	$CIRCUIT{$wire} = ($x | $y);
    } elsif ($signal =~ /(\w+) LSHIFT (\d+)/) {
	my ($a, $b) = ($1, $2);
	my $x = numeric($a) ? $a * 1: evaluate($a);
	my $y = $b;
	$CIRCUIT{$wire} = ($x << $y) & 65535;
    } elsif ($signal =~ /(\w+) RSHIFT (\d+)/) {
	my ($a, $b) = ($1, $2);
	my $x = numeric($a) ? $a * 1: evaluate($a);
	my $y = $b;
	$CIRCUIT{$wire} = ($x >> $y);
    } elsif ($signal =~ /NOT (\w+)/) {
	my $x = numeric($1) ? $1 * 1: evaluate($1);
	$CIRCUIT{$wire} = ($x^65535);
    } elsif ($signal =~ /\w+/) {
	$CIRCUIT{$wire} = (evaluate($signal));
    } else {
	die "Can't make sense of $signal for $wire\n";
    }
    print $depth . ("." x ($depth - 1)) . "return $CIRCUIT{$wire} to $wire\n";
    $depth--;
    if ($CIRCUIT{$wire} > 65535) { die }
    return $CIRCUIT{$wire} * 1;
}

sub numeric {
    if ($_[0] =~ /^\d+$/) { return 1 }
}
