#!C:\Strawberry\perl\bin\perl.exe
use DBI;
use strict;
package AccountService;

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

sub retrieveAccount {
  my ($self, $accountname) = @_;
  my $driver   = "SQLite"; 
  my $database = "./db/chatsqlite3.sqlite";
  my $dsn = "DBI:" . $driver . ":dbname=" . $database;
  my $userid = "";
  my $password = "";
  my $self->{_dbh} = DBI->connect($dsn, $userid, $password, { RaiseError => 1 }) or die $DBI::errstr;
  my $stmt = qq(SELECT id, accountname, password, firstname, lastname, creationdate FROM account WHERE accountname = '$accountname';);
  my $sth = $self->{_dbh}->prepare( $stmt );
  my $rv = $sth->execute() or die $DBI::errstr;
  my @objs = ();
  while(my @row = $sth->fetchrow_array()) {
	my $obj = AccountObject->new(@row);
    push(@objs, $obj);
  }
  return @objs;
}

sub retrieveAccountById {
  my ($self, $id) = @_;
  my $driver   = "SQLite"; 
  my $database = "./db/chatsqlite3.sqlite";
  my $dsn = "DBI:" . $driver . ":dbname=" . $database;
  my $userid = "";
  my $password = "";
  my $self->{_dbh} = DBI->connect($dsn, $userid, $password, { RaiseError => 1 }) or die $DBI::errstr;
  my $stmt = qq(SELECT id, accountname, password, firstname, lastname, creationdate FROM account WHERE id = $id;);
  my $sth = $self->{_dbh}->prepare( $stmt );
  my $rv = $sth->execute() or die $DBI::errstr;
  my @objs = ();
  while(my @row = $sth->fetchrow_array()) {
	my $obj = AccountObject->new(@row);
    push(@objs, $obj);
  }
  return @objs;
}

sub remove {
  my ($self, $id) = @_;
  my $driver   = "SQLite"; 
  my $database = "./db/chatsqlite3.sqlite";
  my $dsn = "DBI:" . $driver . ":dbname=" . $database;
  my $userid = "";
  my $password = "";
  my $self->{_dbh} = DBI->connect($dsn, $userid, $password, { RaiseError => 1 }) or die $DBI::errstr;
  my $stmt = qq(DELETE FROM account WHERE id = $id;);
  my $sth = $self->{_dbh}->prepare( $stmt );
  my $rv = $sth->execute() or die $DBI::errstr;
}

sub insert {
  my ($self, $object) = @_;
  my $driver   = "SQLite"; 
  my $database = "./db/chatsqlite3.sqlite";
  my $dsn = "DBI:" . $driver . ":dbname=" . $database;
  my $userid = "";
  my $password = "";
  my $self->{_dbh} = DBI->connect($dsn, $userid, $password, { RaiseError => 1 }) or die $DBI::errstr;
  my $accountname = $object->getAccountname();
  my $password = $object->getPassword();
  my $firstname = $object->getFirstname();
  my $lastname = $object->getLastname();
  my $stmt = qq(INSERT INTO account (accountname, password, firstname, lastname, creationdate) VALUES ('$accountname', '$password', '$firstname', '$lastname', datetime(current_timestamp, 'localtime')););
  my $sth = $self->{_dbh}->prepare( $stmt );
  my $rv = $sth->execute() or die $DBI::errstr;
}
1;
