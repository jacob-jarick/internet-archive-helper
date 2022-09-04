#!/bin/perl
use strict;
use warnings;

if(scalar @ARGV != 2)
{
  die "usage: ia_helper.pl archive inputfile.txt";
}

my ($archive, $file) = @ARGV;

open(FH, '<', $file) or die "$!";
my @rows = <FH>;
chomp @rows;
close FH;

foreach my $row (@rows)
{
  $row =~ s/^\s+|\s+$//g;
  next if $row eq "";

  print "GET: $row\n";
  system("ia", "download", $archive, $row) == 0 or die "$!";
}
