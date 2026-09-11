#!C:\Strawberry\perl\bin\perl.exe
use DBI;
use strict;
package MessageService;

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

sub retrieveMessages {
  my ($self, $channel_id) = @_;
  my $driver   = "SQLite"; 
  my $database = "./db/chatsqlite3.sqlite";
  my $dsn = "DBI:" . $driver . ":dbname=" . $database;
  my $userid = "";
  my $password = "";
  my $self->{_dbh} = DBI->connect($dsn, $userid, $password, { RaiseError => 1 }) or die $DBI::errstr;
  my $stmt = qq(SELECT id, account_id, channel_id, message, creationdate FROM message WHERE channel_id = $channel_id ORDER BY creationdate;);
  my $sth = $self->{_dbh}->prepare( $stmt );
  my $rv = $sth->execute() or die $DBI::errstr;
  my @objs = ();
  while(my @row = $sth->fetchrow_array()) {
	my $obj = MessageObject->new(@row);
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
  my $stmt = qq(DELETE FROM message WHERE id = $id;);
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
  my $channelId = $object->getChannelId();
  my $message = $object->getMessage();
  my $stmt = qq(INSERT INTO message (account_id, channel_id, message, creationdate) VALUES ('$accountId', '$channelId', '$message', datetime(current_timestamp, 'localtime')););
  my $sth = $self->{_dbh}->prepare( $stmt );
  my $rv = $sth->execute() or die $DBI::errstr;
}
1;
