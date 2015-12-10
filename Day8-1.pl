$bkslsh = "\\";
$dblquote = "\"";
$hex = "\x";

# hex is followed by two hexadecimal characters

# disregard whitespace

open (IN, $ARGV[0]);
while (my $l = <IN>) {
    chomp $l;
    $char += length($l);
#    print "$l\n\t" . length($l) . "\t$char\n";
    $strlen += length(eval($l));
#    print eval($l) . "\n\t";
#    print length(eval($l)) . "\t$strleng\n";
}
printf "difference between string literal length and string length: %d\n", $char - $strlen;
