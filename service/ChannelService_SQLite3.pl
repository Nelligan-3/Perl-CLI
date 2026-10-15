#!C:\Strawberry\perl\bin\perl.exe
use DBI;
use strict;
package ChannelService;

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

sub retrieveChannel {
  my ($self, $name, $lang) = @_;
  my $driver   = "SQLite"; 
  my $database = "./db/chatsqlite3.sqlite";
  my $dsn = "DBI:" . $driver . ":dbname=" . $database;
  my $userid = "";
  my $password = "";
  my $self->{_dbh} = DBI->connect($dsn, $userid, $password, { RaiseError => 1 }) or die $DBI::errstr;
  my $stmt = qq(SELECT id, account_id, name, creationdate, lang FROM channel WHERE lang = '$lang' AND name = '$name';);
  my $sth = $self->{_dbh}->prepare( $stmt );
  my $rv = $sth->execute() or die $DBI::errstr;
  my @objs = ();
  while(my @row = $sth->fetchrow_array()) {
	my $obj = ChannelObject->new(@row);
    push(@objs, $obj);
  }
  return @objs;
}

sub retrieveChannels {
  my ($self, $lang) = @_;
  my $driver   = "SQLite"; 
  my $database = "./db/chatsqlite3.sqlite";
  my $dsn = "DBI:" . $driver . ":dbname=" . $database;
  my $userid = "";
  my $password = "";
  my $self->{_dbh} = DBI->connect($dsn, $userid, $password, { RaiseError => 1 }) or die $DBI::errstr;
  my $stmt = qq(SELECT id, account_id, name, creationdate, lang FROM channel WHERE lang = '$lang');
  my $sth = $self->{_dbh}->prepare( $stmt );
  my $rv = $sth->execute() or die $DBI::errstr;
  my @objs = ();
  while(my @row = $sth->fetchrow_array()) {
	my $obj = ChannelObject->new(@row);
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
  my $stmt = qq(DELETE FROM channel WHERE id = $id;);
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
  my $accountId = $object->getAccountId();
  my $name = $object->getName();
  my $lang = $object->getLang();
  my $stmt = qq(INSERT INTO channel (account_id, name, creationdate, lang) VALUES ('$accountId', '$name', datetime(current_timestamp, 'localtime'), '$lang'););
  my $sth = $self->{_dbh}->prepare( $stmt );
  my $rv = $sth->execute() or die $DBI::errstr;
}
1;
