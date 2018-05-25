use strict;
use warnings;
use v5.20;

my $DSIZE = 1024;
my $WORDS_PER_LINE = 6;

die "Missing file argument.\n" unless $ARGV[0];

open my $fh, '<', $ARGV[0] or die $!;

my @lines = ("\t");
while (<$fh>) {
	chomp;
	push @lines, "\"$_\"";
	push @lines, ($. % $WORDS_PER_LINE ? ", " : ",\n\t") unless $. == $DSIZE;
}
die "Incompatible word list: expected $DSIZE words.\n" if $. != $DSIZE;
close $fh;

my $formated_words =  join '', @lines;

my $output = <<"EOF";
/* Size of the dictionary */
#define DSIZE $DSIZE

const char *words[DSIZE] = {
$formated_words
};
EOF

say $output;

