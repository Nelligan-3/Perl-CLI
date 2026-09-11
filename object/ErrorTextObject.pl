#!C:\Strawberry\perl\bin\perl.exe
package ErrorTextObject;

sub new {
  my ($class, @row) = @_;
    my $self = {
      _action => "get",
      _sid => 0,
      _id => $row[0],
      _errortext_id => $row[1],
      _lang => $row[2],
      _errortext => $row[3],
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

sub getSid {
    my ($self) = @_;
    return $self->{_sid};
}

sub setSid {
    my ($self, $sid) = @_;
    $self->{_sid} = $sid if defined($sid);
}

sub getId {
    my ($self) = @_;
    return $self->{_id};
}

sub setId {
    my ($self, $id) = @_;
    $self->{_id} = $id if defined($id);
}

sub getErrortext_Id {
    my ($self) = @_;
    return $self->{_errortext_id};
}

sub setErrortext_Id {
    my ($self, $errortext_id) = @_;
    $self->{_errortext_id} = $errortext_id if defined($errortext_id);
}

sub getLang {
    my ($self) = @_;
    return $self->{_lang};
}

sub setLang {
    my ($self, $lang) = @_;
    $self->{_lang} = $lang if defined($lang);
}

sub getErrortext {
    my ($self) = @_;
    return $self->{_errortext};
}

sub setErrortext {
    my ($self, $errortext) = @_;
    $self->{_errortext} = $errortext if defined($errortext);
}
1;
