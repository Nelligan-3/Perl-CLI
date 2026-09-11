#!C:\Strawberry\perl\bin\perl.exe
use strict;
require './action/AccountAction.pl';
require './object/AccountObject.pl';
require './service/AccountService_SQLite3.pl';
require './action/LabelTextAction.pl';
require './object/LabelTextObject.pl';
require './service/LabelTextService_SQLite3.pl';
require './Chatchannels.pl';
package Chataccounts;

sub new {
  my $class = shift;
  my $self = {
    _root => shift,
    _lang => shift,
    _txtAccountname => shift,
    _txtPassword => shift,
    _txtNewAccountname => shift,
    _txtNewPassword => shift,
    _txtNewPassword2 => shift,
    _txtNewFirstname => shift,
    _txtNewLastname => shift,
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

sub getTxtAccountname {
    my ($self) = @_;
    return $self->{_txtAccountname};
}

sub setTxtAccountname {
    my ($self, $txtAccountname) = @_;
    $self->{_txtAccountname} = $txtAccountname if defined($txtAccountname);
}

sub getTxtPassword {
    my ($self) = @_;
    return $self->{_txtPassword};
}

sub setTxtPassword {
    my ($self, $txtPassword) = @_;
    $self->{_txtPassword} = $txtPassword if defined($txtPassword);
}

sub getTxtNewAccountname {
    my ($self) = @_;
    return $self->{_txtNewAccountname};
}

sub setTxtNewAccountname {
    my ($self, $txtNewAccountname) = @_;
    $self->{_txtNewAccountname} = $txtNewAccountname if defined($txtNewAccountname);
}

sub getTxtNewPassword {
    my ($self) = @_;
    return $self->{_txtNewPassword};
}

sub setTxtNewPassword {
    my ($self, $txtNewPassword) = @_;
    $self->{_txtNewPassword} = $txtNewPassword if defined($txtNewPassword);
}

sub getTxtNewPassword2 {
    my ($self) = @_;
    return $self->{_txtNewPassword2};
}

sub setTxtNewPassword2 {
    my ($self, $txtNewPassword2) = @_;
    $self->{_txtNewPassword2} = $txtNewPassword2 if defined($txtNewPassword2);
}

sub getTxtNewFirstname {
    my ($self) = @_;
    return $self->{_txtNewFirstname};
}

sub setTxtNewFirstname {
    my ($self, $txtNewFirstname) = @_;
    $self->{_txtNewFirstname} = $txtNewFirstname if defined($txtNewFirstname);
}

sub getTxtNewLastname {
    my ($self) = @_;
    return $self->{_txtNewLastname};
}

sub setTxtNewLastname {
    my ($self, $txtNewLastname) = @_;
    $self->{_txtNewLastname} = $txtNewLastname if defined($txtNewLastname);
}

sub getTxtMsgBox {
    my ($self) = @_;
    return $self->{_txtMsgBox};
}

sub setTxtMsgBox {
    my ($self, $txtMsgBox) = @_;
    $self->{_txtMsgBox} = $txtMsgBox if defined($txtMsgBox);
}

sub doInsert {
    my ($self) = @_;
	if($self->getTxtNewAccountname() eq '' || $self->getTxtNewPassword() eq '' || $self->getTxtNewPassword2() eq '' || $self->getTxtNewPassword() ne $self->getTxtNewPassword2() || $self->getTxtNewFirstname() eq '' || $self->getTxtNewLastname() eq ''){
      print($self->getTxtMsgBox() . "\n");
	} else{
	  my $action = AccountAction->new();
	  $action->setForm(AccountObject->new);
	  $action->getForm()->setId(0);
	  $action->getForm()->setAccountname($self->getTxtNewAccountname());
	  $action->getForm()->setPassword($self->getTxtNewPassword());
	  $action->getForm()->setFirstname($self->getTxtNewFirstname());
	  $action->getForm()->setLastname($self->getTxtNewLastname());
	  $action->getForm()->setLang($self->getLang());
      my $errortext = $action->doInsert();
	  $action = undef;
      print($errortext . "\n");
	  $self->setTxtNewAccountname('');
	  $self->setTxtNewPassword('');
	  $self->setTxtNewPassword2('');
	  $self->setTxtNewFirstname('');
	  $self->setTxtNewLastname('');
	}
}

sub doLogin {
    my ($self) = @_;
	my $action = AccountAction->new();
	$action->setForm(AccountObject->new);
	$action->getForm()->setId(0);
	$action->getForm()->setAccountname($self->getTxtAccountname());
	$action->getForm()->setPassword($self->getTxtPassword());
	$action->getForm()->setFirstname("");
	$action->getForm()->setLastname("");
	$action->getForm()->setLang($self->getLang());
	my @errortext = $action->doLogin();
	$action = undef;
	if($errortext[0][0] == 0){
      print($errortext[0][1] . "\n");
	} else {
      my $cc = Chatchannels->new();
	  $cc->setAccountId($errortext[0][0]);
	  $cc->setLang($self->getLang());
	  $cc->run();
	}
}

sub getALabeltexts {
	my ($self) = @_;
	my $action = LabelTextAction->new();
	$action->setForm(LabelTextObject->new());
	$action->getForm()->setId(0);
	$action->getForm()->setLang($self->getLang());
	$action->getForm()->setPage("index");
	$action->getForm()->setPosition("");
	$action->getForm()->setLabelText("");
	my %aLabeltexts = $action->doGet();
	$action = undef;
	$self->setTxtMsgBox($aLabeltexts{"1"});
	return %aLabeltexts;
}

sub run {
    my ($self) = @_;
    my $option = "";
	my $input = "";
    my %aLabeltexts;
    while($option ne "x"){
      %aLabeltexts = $self->getALabeltexts();
      print("x - Bye, en - English, fr - Fran&ccedil;ais, es - Espa&ntilde;ol, pt - Portugu&ecirc;s, a - " . $aLabeltexts{"lblFormLogin"} . ", n - " . $aLabeltexts{"lblFormAccount"} . ":\n");
	  $option = <>;
	  chomp $option;
      if($option eq "en"){
        $self->setLang("en");
      %aLabeltexts = $self->getALabeltexts();
      }elsif($option eq "fr"){
        $self->setLang("fr");
      %aLabeltexts = $self->getALabeltexts();
      }elsif($option eq "es"){
        $self->setLang("es");
      %aLabeltexts = $self->getALabeltexts();
      }elsif($option eq "pt"){
        $self->setLang("pt");
      %aLabeltexts = $self->getALabeltexts();
      }elsif($option eq "a"){
		print($aLabeltexts{"lblAccountname"} . ": ");
		$input = <>;
		chomp $input;
        $self->setTxtAccountname($input);
		print($aLabeltexts{"lblPassword"} . ": ");
		$input = <>;
		chomp $input;
        $self->setTxtPassword($input);
        $self->doLogin();
      }elsif($option eq "n"){
		print($aLabeltexts{"lblNewAccountname"} . ": ");
		$input = <>;
		chomp $input;
        $self->setTxtNewAccountname($input);
		print($aLabeltexts{"lblNewPassword"} . ": ");
		$input = <>;
		chomp $input;
        $self->setTxtNewPassword($input);
		print($aLabeltexts{"lblNewPassword2"} . ": ");
		$input = <>;
		chomp $input;
        $self->setTxtNewPassword2($input);
		print($aLabeltexts{"lblNewFirstname"} . ": ");
		$input = <>;
		chomp $input;
        $self->setTxtNewFirstname($input);
		print($aLabeltexts{"lblNewLastname"} . ": ");
		$input = <>;
		chomp $input;
        $self->setTxtNewLastname($input);
        $self->doInsert();
	  }
	}
}
1;

my $chat = Chataccounts->new;
$chat->setLang("en");
$chat->run();
