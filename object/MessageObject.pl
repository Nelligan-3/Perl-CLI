#!C:\Strawberry\perl\bin\perl.exe
package MessageObject;

sub new {
  my ($class, @row) = @_;
    my $self = {
      _action => "index",
      _lang => "en",
      _id => $row[0],
      _account_id => $row[1],
      _channel_id => $row[2],
      _message => $row[3],
      _creationdate => $row[4],
    };
    return bless $self, $class;
}

sub getAction {
    my ($self) = @_;
    return $self->{_action};
}

sub setAction {
    my ($self, $action) = @_;
    $self->{_lang} = $action if defined($action);
}

sub getLang {
    my ($self) = @_;
    return $self->{_lang};
}

sub setLang {
    my ($self, $lang) = @_;
    $self->{_lang} = $lang if defined($lang);
}

sub getId {
    my ($self) = @_;
    return $self->{_id};
}

sub setId {
    my ($self, $id) = @_;
    $self->{_id} = $id if defined($id);
}

sub getAccountId {
    my ($self) = @_;
    return $self->{_account_id};
}

sub setAccountId {
    my ($self, $account_id) = @_;
    $self->{_account_id} = $account_id if defined($account_id);
}

sub getChannelId {
    my ($self) = @_;
    return $self->{_channel_id};
}

sub setChannelId {
    my ($self, $channel_id) = @_;
    $self->{_channel_id} = $channel_id if defined($channel_id);
}

sub getMessage {
    my ($self) = @_;
    return $self->{_message};
}

sub setMessage {
    my ($self, $message) = @_;
    $self->{_message} = $message if defined($message);
}

sub getCreationdate {
    my ($self) = @_;
    return $self->{_creationdate};
}

sub setCreationdate {
    my ($self, $creationdate) = @_;
    $self->{_creationdate} = $creationdate if defined($creationdate);
}
1;
