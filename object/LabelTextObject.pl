#!C:\Strawberry\perl\bin\perl.exe
package LabelTextObject;

sub new {
  my ($class, @row) = @_;
    my $self = {
      _action => "index",
      _id => $row[0],
      _page => $row[1],
      _lang => $row[2],
      _position => $row[3],
      _labeltext => $row[4],
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

sub getPage {
    my ($self) = @_;
    return $self->{_page};
}

sub setPage {
    my ($self, $page) = @_;
    $self->{_page} = $page if defined($page);
}

sub getLang {
    my ($self) = @_;
    return $self->{_lang};
}

sub setLang {
    my ($self, $lang) = @_;
    $self->{_lang} = $lang if defined($lang);
}

sub getPosition {
    my ($self) = @_;
    return $self->{_position};
}

sub setPosition {
    my ($self, $position) = @_;
    $self->{_position} = $position if defined($position);
}

sub getLabelText {
    my ($self) = @_;
    return $self->{_labeltext};
}

sub setLabelText {
    my ($self, $labeltext) = @_;
    $self->{_labeltext} = $labeltext if defined($labeltext);
}
1;
