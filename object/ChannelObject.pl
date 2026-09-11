#!C:\Strawberry\perl\bin\perl.exe
package ChannelObject;

sub new {
  my ($class, @row) = @_;
    my $self = {
      _action => "index",
      _id => $row[0],
      _account_id => $row[1],
      _name => $row[2],
      _lang => $row[3],
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

sub getName {
    my ($self) = @_;
    return $self->{_name};
}

sub setName {
    my ($self, $name) = @_;
    $self->{_name} = $name if defined($name);
}

sub getLang {
    my ($self) = @_;
    return $self->{_lang};
}

sub setLang {
    my ($self, $lang) = @_;
    $self->{_lang} = $lang if defined($lang);
}
1;
