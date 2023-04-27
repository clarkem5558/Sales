use strict;
use DBI;
my @dsns = DBI->data_sources('ODBC_XXX');
foreach my $d (@dsns)
{
  print "$d\n";
}