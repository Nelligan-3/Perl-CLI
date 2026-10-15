#!C:\Strawberry\perl\bin\perl.exe
use DBI;
use strict;
package BasicService;

sub new {
  my $class = shift;
  my $self = {
    _dbh => shift,
  };
  bless $self, $class;
  return $self;
}

sub connectDb {
  my $driver   = "SQLite"; 
  my $database = "./db/chatsqlite3.sqlite";
  my $dsn = "DBI:" . $driver . ":dbname=" . $database;
  my $userid = "";
  my $password = "";
  my $self->{_dbh} = DBI->connect($dsn, $userid, $password, { RaiseError => 1 }) or die $DBI::errstr;
}

sub disconnectDb {
  my $self->{_dbh}->disconnect();
}

sub getConn {
  my ($self) = @_;
  return $self->{_dbh};
}

sub setConn {
  my ($self, $dbh) = @_;
  $self->{_dbh} = $dbh if defined($dbh);
}
1;