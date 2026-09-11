#!C:\Strawberry\perl\bin\perl.exe
require './object/LabelTextObject.pl';
require './service/LabelTextService_SQLite3.pl';
package LabelTextAction;

sub new {
  my $class = shift;
  my $self = {
    _service => shift,
    _form => shift,
	_db => shift,
  };
  return bless $self, $class;
}

sub getForm {
    my ($self) = @_;
    return $self->{_form};
}

sub setForm {
    my ($self, $form) = @_;
    $self->{_form} = $form if defined($form);
}

sub getDb {
    my ($self) = @_;
    return $self->{_db};
}

sub setDb {
    my ($self, $db) = @_;
    $self->{_db} = $db if defined($db);
}

sub doGet {
  my ($self) = @_;
  $self->{_service} = LabelTextService->new;
  @labelTexts = ();
  @labelTexts = $self->{_service}->retrieveLabelTexts($self->{_form}->getPage(), $self->{_form}->getLang());
  %jsonLabelTexts = ();
  foreach $obj (@labelTexts){
	$jsonLabelTexts{$obj->getPosition()} = $obj->getLabelText();
  }
  return %jsonLabelTexts;
}
1;
