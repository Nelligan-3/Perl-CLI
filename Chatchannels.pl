#!C:\Strawberry\perl\bin\perl.exe
use strict;
require './action/ChannelAction.pl';
require './object/ChannelObject.pl';
require './service/ChannelService_SQLite3.pl';
require './action/LabelTextAction.pl';
require './object/LabelTextObject.pl';
require './service/LabelTextService_SQLite3.pl';
require './Chatmessages.pl';
package Chatchannels;

sub new {
  my $class = shift;
  my $self = {
    _root => shift,
    _lang => shift,
    _account_id => shift,
    _rdbChannel => shift,
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

sub getAccountId {
    my ($self) = @_;
    return $self->{_account_id};
}

sub setAccountId {
    my ($self, $account_id) = @_;
    $self->{_account_id} = $account_id if defined($account_id);
}

sub getRdbChannel{
    my ($self) = @_;
    return $self->{_rdbChannel};
}

sub setRdbChannel {
    my ($self, $rdbChannel) = @_;
    $self->{_rdbChannel} = $rdbChannel if defined($rdbChannel);
}

sub getTxtName {
    my ($self) = @_;
    return $self->{_txtName};
}

sub setTxtName {
    my ($self, $txtName) = @_;
    $self->{_txtName} = $txtName if defined($txtName);
}

sub getTxtMsgBox {
    my ($self) = @_;
    return $self->{_txtMsgBox};
}

sub setTxtMsgBox {
    my ($self, $txtMsgBox) = @_;
    $self->{_txtMsgBox} = $txtMsgBox if defined($txtMsgBox);
}

sub getCLabeltexts {
	my ($self) = @_;
	my $action = LabelTextAction->new();
	$action->setForm(LabelTextObject->new);
	$action->getForm()->setId(0);
	$action->getForm()->setLang($self->getLang());
	$action->getForm()->setPage("channels");
	$action->getForm()->setPosition("");
	$action->getForm()->setLabelText("");
	my %cLabeltexts = $action->doGet();
	$action = undef;
	$self->setTxtMsgBox($cLabeltexts{"1"});
	return %cLabeltexts;
}

sub doSelect {
	my ($self) = @_;
	my $cm = Chatmessages->new;
	$cm->setLang($self->getLang());
	$cm->setAccountId($self->getAccountId());
	$cm->setChannelId($self->getRdbChannel());
	$cm->run();
}

sub getChannels {
	my ($self) = @_;
	my $action = ChannelAction->new();
	$action->setForm(ChannelObject->new);
	$action->getForm()->setId(0);
	$action->getForm()->setAccountId(0);
	$action->getForm()->setName("");
	$action->getForm()->setLang($self->getLang());
	my %jsonChannels = $action->doGet();
	$action = undef;
    foreach my $channel (keys %jsonChannels){
      print($channel . " - " . $jsonChannels{$channel} . "\n");
	}
	return %jsonChannels;
}

sub doInsert {
    my ($self) = @_;
	if($self->getTxtName() eq ""){
      print($self->getTxtMsgBox() . "\n");
	} else{
	  my $action = ChannelAction->new();
	  $action->setForm(ChannelObject->new);
	  $action->getForm()->setId(0);
	  $action->getForm()->setAccountId($self->getAccountId());
	  $action->getForm()->setName($self->getTxtName());
	  $action->getForm()->setLang($self->getLang());
	  $action->doInsert();
	  $action = undef;
	  $self->setTxtName("");
	  $self->getChannels();
	}
}

sub run {
    my ($self) = @_;
    my %cLabeltexts = $self->getCLabeltexts();
	my $input = "";
    my $option = "";
    while($option ne "x"){
      my %channels = $self->getChannels();
	  print("x - " . $cLabeltexts{"lnkLogout"} . ", n - " . $cLabeltexts{"lblName"} . ", # - Blahblah:\n");
      $option = <>;
	  chomp $option;
      if($option eq "n"){
		print($cLabeltexts{"lblName"} . ": ");
		$input = <>;
		chomp $input;
        $self->setTxtName($input);
        $self->doInsert();
      }else{
        foreach my $channel (keys %channels){
          if($channel eq $option){
            $self->setRdbChannel($channel);
            $self->doSelect();
		  }
		}
	  }
	}
}
1;
