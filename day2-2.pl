open (IN, $ARGV[0]);
while ($p = <IN>) {
    chomp $p;
    $total += ribbon_required(split("x", $p));
}
print "$total\n";

sub paper_required {
    my ($l, $w, $h) = sort {$a<=>$b} @_;
    $a = $l*$w;
    $b = $w*$h;
    $c = $h*$l;
    return 2*($a + $b + $c) + $a;
}

sub ribbon_required {
    my ($l, $w, $h) = sort {$a<=>$b} @_;
    return 2 * ($l + $w) + ($l*$w*$h);
}
