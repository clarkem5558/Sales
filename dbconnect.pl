use strict;
use DBI;
my $dbh = DBI->connect('dbi:ODBC:XXX');
my $yr = $dbh->quote("2018");
my $company = $dbh->quote("%XXX%");
my $query = qq/select CUSTOMER,YR,SUM(FAMTSALES) FROM XXXXXX.dbo.OESHDT where CUSTOMER not like $company and YR = $yr group by CUSTOMER,YR/;

#my $query = qq/select CUSTOMER,YR,SUM(FAMTSALES) FROM XXXXXX.dbo.OESHDT where YR = 2018 group by CUSTOMER,YR/;

my $sth = $dbh->prepare($query);          # prepare the query
$sth->execute();                        # execute the query
my @row;
while (@row = $sth->fetchrow_array) {  # retrieve one row
    print join(", ", @row), "\n";
}
$dbh->disconnect if ($dbh);