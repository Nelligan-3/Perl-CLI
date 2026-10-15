#!C:\Strawberry\perl\bin\perl.exe
require './object/MessageObject.pl';
require './service/MessageService_SQLite3.pl';
require './object/AccountObject.pl';
require './service/AccountService_SQLite3.pl';
package MessageAction;

sub new {
  my $class = shift;
  my $self = {
    _service => shift,
    _form => shift,
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
  $self->{_service} = MessageService->new;
  $self->{_service}->insert($self->{_form});
}

sub doGet {
  my ($self) = @_;
  $self->{_service} = MessageService->new;
  @messages = $self->{_service}->retrieveMessages($self->{_form}->getChannelId());
  my $accountService = AccountService->new;
  my %jsonMessages = ();
  foreach $message (@messages){
    my %jsonMessage = ();
    my @account = $accountService->retrieveAccountById($message->getAccountId());
    my $found = @account;
	if ($found > 0) {
      $jsonMessage{'accountname'} = $account[0]->getAccountname();
      $jsonMessage{'time'} = $message->getCreationdate();
      $jsonMessage{'message'} = $message->getMessage();
      $jsonMessages{$message->getId()} = \%jsonMessage;
	} else {
      $jsonMessage{'accountname'} = $message->getId();
      $jsonMessage{'time'} = $message->getCreationdate();
      $jsonMessage{'message'} = $message->getMessage();
      $jsonMessages{$message->getId()} = \%jsonMessage;
	}
  }
  return %jsonMessages;
}
1;
