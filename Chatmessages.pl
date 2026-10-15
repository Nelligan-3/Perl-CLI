#!C:\Strawberry\perl\bin\perl.exe
use strict;
require './action/MessageAction.pl';
require './object/MessageObject.pl';
require './service/MessageService_SQLite3.pl';
require './action/LabelTextAction.pl';
require './object/LabelTextObject.pl';
require './service/LabelTextService_SQLite3.pl';
package Chatmessages;

sub new {
  my $class = shift;
  my $self = {
    _root => shift,
    _lang => shift,
    _channel_id => shift,
    _account_id => shift,
    _txtName => shift,
    _txtMsgBox => shift,
  };
  bless $self, $class;
  return $self;
}

sub getLang {
    my ($self) = @_;
    return $self->{_lang};
}

sub setLang {
    my ($self, $lang) = @_;
    $self->{_lang} = $lang if defined($lang);
}

sub getChannelId {
    my ($self) = @_;
    return $self->{_channel_id};
}

sub setChannelId {
    my ($self, $channel_id) = @_;
    $self->{_channel_id} = $channel_id if defined($channel_id);
}

sub getAccountId {
    my ($self) = @_;
    return $self->{_account_id};
}

sub setAccountId {
    my ($self, $account_id) = @_;
    $self->{_account_id} = $account_id if defined($account_id);
}

sub getTxtMessage {
    my ($self) = @_;
    return $self->{_txtMessage};
}

sub setTxtMessage {
    my ($self, $txtMessage) = @_;
    $self->{_txtMessage} = $txtMessage if defined($txtMessage);
}

sub getTxtMsgBox {
    my ($self) = @_;
    return $self->{_txtMsgBox};
}

sub setTxtMsgBox {
    my ($self, $txtMsgBox) = @_;
    $self->{_txtMsgBox} = $txtMsgBox if defined($txtMsgBox);
}

sub getMLabeltexts {
	my ($self) = @_;
	my $action = LabelTextAction->new();
	$action->setForm(LabelTextObject->new);
	$action->getForm()->setId(0);
	$action->getForm()->setLang($self->getLang());
	$action->getForm()->setPage("messages");
	$action->getForm()->setPosition("");
	$action->getForm()->setLabelText("");
	my %mLabeltexts = $action->doGet();
	$action = undef;
	$self->setTxtMsgBox($mLabeltexts{"1"});
	return %mLabeltexts;
}

sub getMessages {
	my ($self) = @_;
	my $action = MessageAction->new();
	$action->setForm(MessageObject->new);
	$action->getForm()->setId(0);
	$action->getForm()->setAccountId(0);
	$action->getForm()->setChannelId($self->getChannelId());
	$action->getForm()->setMessage("");
	$action->getForm()->setLang($self->getLang());
	my %jsonMessages = $action->doGet();
	$action = undef;
    foreach my $message (keys %jsonMessages){
	  print($jsonMessages{$message}{"accountname"} . " : " . $jsonMessages{$message}{"time"} . "\n" . $jsonMessages{$message}{"message"} . "\n\n");
	}
}

sub doInsert {
	my ($self) = @_;
	my $amessage = $self->getTxtMessage();
	$amessage =~ s/unistr\u0028//g;
	$amessage =~ s/\u000a\u0029//g;
	$self->setTxtMessage($amessage);
	if($self->getTxtMessage() eq ""){
	  print($self->getTxtMsgBox() . "\n");
	} else{
	  my $action = MessageAction->new();
	  $action->setForm(MessageObject->new);
	  $action->getForm()->setId(0);
	  $action->getForm()->setAccountId($self->getAccountId());
	  $action->getForm()->setChannelId($self->getChannelId());
	  $action->getForm()->setMessage($self->getTxtMessage());
	  $action->getForm()->setLang($self->getLang());
	  $action->doInsert();
	  $action = undef;
	  $self->setTxtMessage("");
	  $self->getMessages();
	}
}

sub run {
    my ($self) = @_;
    my %mLabeltexts = $self->getMLabeltexts();
	my $input = "";
    my $option = "";
    while($option ne "x"){
      $self->getMessages();
	  print("x - " . $mLabeltexts{"lnkReturn"} . ", n - " . $mLabeltexts{"lblMessage"} . ": ");
      $option = <>;
	  chomp $option;
      if($option eq "n"){
		print($mLabeltexts{"lblMessage"} . ": ");
		$input = <>;
		chomp $input;
        $self->setTxtMessage($input);
        $self->doInsert();
	  }
	}
}
1;
