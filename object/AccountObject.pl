#!C:\Strawberry\perl\bin\perl.exe
package AccountObject;

sub new {
  my ($class, @row) = @_;
    my $self = {
      _action => "index",
      _lang => "en",
      _id => $row[0],
      _accountname => $row[1],
      _password => $row[2],
      _firstname => $row[3],
      _lastname => $row[4],
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

sub getAccountname {
    my ($self) = @_;
    return $self->{_accountname};
}

sub setAccountname {
    my ($self, $accountname) = @_;
    $self->{_accountname} = $accountname if defined($accountname);
}

sub getPassword {
    my ($self) = @_;
    return $self->{_password};
}

sub setPassword {
    my ($self, $password) = @_;
    $self->{_password} = $password if defined($password);
}

sub getFirstname {
    my ($self) = @_;
    return $self->{_firstname};
}

sub setFirstname {
    my ($self, $firstname) = @_;
    $self->{_firstname} = $firstname if defined($firstname);
}

sub getLastname {
    my ($self) = @_;
    return $self->{_lastname};
}

sub setLastname {
    my ($self, $lastname) = @_;
    $self->{_lastname} = $lastname if defined($lastname);
}
1;
