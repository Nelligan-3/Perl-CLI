#!C:\Strawberry\perl\bin\perl.exe
require './object/ChannelObject.pl';
require './service/ChannelService_SQLite3.pl';
package ChannelAction;

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
  $self->{_service} = ChannelService->new;
  $self->{_service}->insert($self->{_form});
}

sub doGet {
  my ($self) = @_;
  $self->{_service} = ChannelService->new;
  my @channels = $self->{_service}->retrieveChannels($self->{_form}->getLang());
  my %jsonChannels = ();
  foreach my $channel (@channels){
    $jsonChannels{$channel->getId()} = $channel->getName();
  }
  return %jsonChannels;
}
1;
