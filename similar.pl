# Usage: perl gen.pl wordlist_file
# Assumes one unique lowercase word per line.

use strict;
use warnings;
use v5.20;

use Text::Levenshtein qw(distance);

die "Missing file argument.\n" unless $ARGV[0];
open my $fh, '<', $ARGV[0] or die $!;

my %words = ();
my @ordered = ();

while (<$fh>) {
	chomp;
	$words{$_} = 1;
	push @ordered, $_;
}

close $fh;

foreach my $current (@ordered) {
	next unless defined $words{$current};
	delete $words{$current};

	my @similar = ();

	foreach my $w (keys %words) {
		next unless defined $words{$w};
		if (distance($current, $w) == 1) {
			push @similar, $w;
			delete $words{$w};
		}
	}

	say($current . (scalar @similar ? ' : ' . join(' ', @similar) : ''));
}

