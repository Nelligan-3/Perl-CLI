#!C:\Strawberry\perl\bin\perl.exe
require './object/AccountObject.pl';
require './service/AccountService_SQLite3.pl';
require './object/ErrorTextObject.pl';
require './service/ErrorTextService_SQLite3.pl';
package AccountAction;

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

sub doInsert {
  my ($self) = @_;
  my $errortextService = ErrorTextService->new;
  $self->{_service} = AccountService->new;
  my @len = $self->{_service}->retrieveAccount($self->{_form}->getAccountname());
  $found = @len;
  if($found == 0){
	  $self->{_service}->insert($self->{_form});
	  @errortexts = $errortextService->retrieveErrortext(2, $self->{_form}->getLang());
  } else {
	  @errortexts = $errortextService->retrieveErrortext(3, $self->{_form}->getLang());
  }
  return $errortexts[0]->getErrortext();
}

sub doLogin {
  my ($self) = @_;
  my $errortextService = ErrorTextService->new;
  $self->{_service} = AccountService->new;
  @len = $self->{_service}->retrieveAccount($self->{_form}->getAccountname());
  $found = @len;
  if(($found > 0) && ($len[0]->getPassword() eq $self->{_form}->getPassword())){
	return [$len[0]->getId(), ""];
  } else {
    @errortexts = $errortextService->retrieveErrortext(1, $self->{_form}->getLang());
    return [0, $errortexts[0]->getErrortext()];
  }
}
1;
