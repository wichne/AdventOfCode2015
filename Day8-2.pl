$bkslsh = "\\";
$dblquote = "\"";
$hex = "\x";

# hex is followed by two hexadecimal characters

# disregard whitespace
@test = ('""', '"abc"', '"aaa\"aaa"', '"\x27"');

open (IN, $ARGV[0]);
while (my $l = <IN>) {
#foreach my $l (@test) {
    chomp $l;
    print "$l\n";
    my @c = split//,$l;
    $strlen += scalar(@c);
    my @sl = ('"');
    for (my $i=0; $i<@c; $i++) {
	if ($c[$i] eq '\\' ||
            $c[$i] eq '"') { push @sl, '\\' }
	push @sl, $c[$i];
    }
    push @sl, '"';
    print join("", @sl) . "\n";
    $char += scalar(@sl);
}

printf "difference between string literal length and string length: %d\n", $char - $strlen;
