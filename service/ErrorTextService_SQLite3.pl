#!C:\Strawberry\perl\bin\perl.exe
use DBI;
use strict;
package ErrorTextService;

sub new {
  my $class = shift;
  my $self = {
    _dbh => shift,
  };
  return bless $self, $class;
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
  my $self->{_dbh} = $dbh if defined($dbh);
}

sub retrieveErrortext {
  my ($self, $id, $lang) = @_;
  my $driver   = "SQLite"; 
  my $database = "./db/chatsqlite3.sqlite";
  my $dsn = "DBI:" . $driver . ":dbname=" . $database;
  my $userid = "";
  my $password = "";
  my $self->{_dbh} = DBI->connect($dsn, $userid, $password, { RaiseError => 1 }) or die $DBI::errstr;
  my $stmt = qq(SELECT id, errortext_id, lang, errortext FROM ErrorText WHERE errortext_id = $id AND lang = '$lang';);
  my $sth = $self->{_dbh}->prepare( $stmt );
  my $rv = $sth->execute() or die $DBI::errstr;
  my @objs = ();
  while(my @row = $sth->fetchrow_array()) {
	my $obj = ErrorTextObject->new(@row);
    push(@objs, $obj);
  }
  return @objs;
}
1;
