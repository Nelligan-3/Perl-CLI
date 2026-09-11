--
-- Structure de la table `Channel`
--

DROP TABLE IF EXISTS `Channel`;
CREATE TABLE IF NOT EXISTS `Channel` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `account_id` int(11) NOT NULL
  CONSTRAINT `fk_channel_account_id` REFERENCES `account` (`id`) ON DELETE RESTRICT,
  `name` varchar(30) NOT NULL,
  `creationdate` datetime NOT NULL,
  `lang` varchar(3) NOT NULL default 'en'
);

-- --------------------------------------------------------

--
-- Structure de la table `Errortext`
--

DROP TABLE IF EXISTS `Errortext`;
CREATE TABLE IF NOT EXISTS `Errortext` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `errortext_id` int(10) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `errortext` text NOT NULL
);

--
-- Contenu de la table `Errortext`
--

INSERT INTO `Errortext` (`id`, `errortext_id`, `lang`, `errortext`) VALUES
(1, 1, 'en', 'Login failed for supplied account name and password!');
INSERT INTO `Errortext` (`id`, `errortext_id`, `lang`, `errortext`) VALUES
(2, 1, 'fr', 'La connexion a &eacute;chou&eacute; pour les nom d''utilisateur et mot de passe fourni!');
INSERT INTO `Errortext` (`id`, `errortext_id`, `lang`, `errortext`) VALUES
(3, 2, 'en', 'Your new account has been created.');
INSERT INTO `Errortext` (`id`, `errortext_id`, `lang`, `errortext`) VALUES
(4, 2, 'fr', 'Votre nouveau compte a &eacute;t&eacute; cr&eacute;&eacute;.');
INSERT INTO `Errortext` (`id`, `errortext_id`, `lang`, `errortext`) VALUES
(5, 3, 'en', 'Account creation failed! Check that all fields were filled, that passwords match, or that the account name is not already taken.');
INSERT INTO `Errortext` (`id`, `errortext_id`, `lang`, `errortext`) VALUES
(6, 3, 'fr', '&Eacute;chec de la cr&eacute;ation du compte! V&eacute;rifiez que tous les champs sont remplis, que les mots de passe correspondent, ou que le nom d''utilisateur n''est pas d&eacute;j&agrave; utilis&eacute;.');
INSERT INTO `Errortext` (`id`, `errortext_id`, `lang`, `errortext`) VALUES
(7, 4, 'en', 'You have been successfully logged out.');
INSERT INTO `Errortext` (`id`, `errortext_id`, `lang`, `errortext`) VALUES
(8, 4, 'fr', 'Votre connexion est termin&eacute;e.');
INSERT INTO `Errortext` (`id`, `errortext_id`, `lang`, `errortext`) VALUES
(9, 5, 'en', 'Your channel have been created.');
INSERT INTO `Errortext` (`id`, `errortext_id`, `lang`, `errortext`) VALUES
(10, 5, 'fr', 'Votre canal a &eacute;t&eacute; cr&eacute;&eacute;.');
INSERT INTO `Errortext` (`id`, `errortext_id`, `lang`, `errortext`) VALUES
(11, 6, 'en', 'Your message have been saved.');
INSERT INTO `Errortext` (`id`, `errortext_id`, `lang`, `errortext`) VALUES
(12, 6, 'fr', 'Votre message a &eacute;t&eacute; enregistr&eacute;.');
INSERT INTO `Errortext` (`id`, `errortext_id`, `lang`, `errortext`) VALUES
(13, 1, 'es', 'Fall&oacute; el inicio de sesi&oacute;n para el nombre de cuenta y la contrase&ntilde;a proporcionados!!');
INSERT INTO `Errortext` (`id`, `errortext_id`, `lang`, `errortext`) VALUES
(14, 1, 'pt', 'Autentica&ccedil;&atilde;o falhou para o nome de conta e senha fornecidos!');
INSERT INTO `Errortext` (`id`, `errortext_id`, `lang`, `errortext`) VALUES
(15, 2, 'es', 'Tu nueva cuenta ha sido creada.');
INSERT INTO `Errortext` (`id`, `errortext_id`, `lang`, `errortext`) VALUES
(16, 2, 'pt', 'Sua nova conta foi criada.');
INSERT INTO `Errortext` (`id`, `errortext_id`, `lang`, `errortext`) VALUES
(17, 3, 'es', 'No se pudo crear la cuenta! Comprueba que todos los campos han sido cumplimentados, que las contrase&ntilde;as coinciden o que el nombre de la cuenta a&uacute;n no ha sido tomado.');
INSERT INTO `Errortext` (`id`, `errortext_id`, `lang`, `errortext`) VALUES
(18, 3, 'pt', 'Falha na cria&ccedil;&atilde;o da conta! Verifique se todos os campos foram preenchidos, se as senhas correspondem ou se o nome da conta ainda n&atilde;o foi tomado.');
INSERT INTO `Errortext` (`id`, `errortext_id`, `lang`, `errortext`) VALUES
(19, 4, 'es', 'Has sido desconectado con &eacute;xito.');
INSERT INTO `Errortext` (`id`, `errortext_id`, `lang`, `errortext`) VALUES
(20, 4, 'pt', 'Voc&ecirc; foi desconectado com sucesso.');
INSERT INTO `Errortext` (`id`, `errortext_id`, `lang`, `errortext`) VALUES
(21, 5, 'es', 'Tu canal ha sido creado.');
INSERT INTO `Errortext` (`id`, `errortext_id`, `lang`, `errortext`) VALUES
(22, 5, 'pt', 'Seu canal foi criado.');
INSERT INTO `Errortext` (`id`, `errortext_id`, `lang`, `errortext`) VALUES
(23, 6, 'es', 'Tu mensaje ha sido guardado.');
INSERT INTO `Errortext` (`id`, `errortext_id`, `lang`, `errortext`) VALUES
(24, 6, 'pt', 'Sua mensagem foi salva.');

-- --------------------------------------------------------

--
-- Structure de la table `Message`
--

DROP TABLE IF EXISTS `Message`;
CREATE TABLE IF NOT EXISTS `Message` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `account_id` int(10) NOT NULL
  CONSTRAINT `fk_message_account_id` REFERENCES `account` (`id`) ON DELETE RESTRICT,
  `channel_id` int(10) NOT NULL,
  `message` text NOT NULL,
  `creationdate` datetime NOT NULL
);

-- --------------------------------------------------------

--
-- Structure de la table `Labeltext`
--

DROP TABLE IF EXISTS `Labeltext`;
CREATE TABLE IF NOT EXISTS `Labeltext` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `page` varchar(20) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `position` varchar(20) NOT NULL,
  `labeltext` varchar(255) NOT NULL
);

--
-- Contenu de la table `Labeltext`
--

INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(1, 'index', 'en', 'lblAccountname', 'Account name');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(2, 'index', 'en', 'lblPassword', 'Password');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(3, 'index', 'fr', 'lblAccountname', 'Nom d''utilisateur');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(4, 'index', 'fr', 'lblPassword', 'Mot de passe');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(5, 'index', 'en', 'cmdNewAccount', 'Create account');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(6, 'index', 'fr', 'cmdNewAccount', 'Cr&eacute;er un compte');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(7, 'index', 'en', 'cmdLogin', 'Enter');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(8, 'index', 'fr', 'cmdLogin', 'Entrer');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(9, 'index', 'en', 'lblFormLogin', 'Login');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(10, 'index', 'fr', 'lblFormLogin', 'Authentification');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(11, 'index', 'en', 'lblFormAccount', 'New Account');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(12, 'index', 'fr', 'lblFormAccount', 'Nouveau compte');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(13, 'index', 'en', 'lblNewAccountname', 'New accountname');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(14, 'index', 'en', 'lblNewPassword', 'New password');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(15, 'index', 'fr', 'lblNewAccountname', 'Nouveau nom d''utilisateur');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(16, 'index', 'fr', 'lblNewPassword', 'Nouveau mot de passe');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(17, 'index', 'en', 'lblNewFirstname', 'First name');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(18, 'index', 'fr', 'lblNewFirstname', 'Pr&eacute;nom');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(19, 'index', 'en', 'lblNewLastname', 'Last name');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(20, 'index', 'fr', 'lblNewLastname', 'Nom');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(21, 'index', 'en', 'lblNewPassword2', 'Confirm password');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(22, 'index', 'fr', 'lblNewPassword2', 'Confirmer le mot de passe');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(23, 'channels', 'en', 'lblName', 'New channel name');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(24, 'channels', 'fr', 'lblName', 'Nom du nouveau canal');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(25, 'channels', 'en', 'cmdNewChannel', 'Add new channel');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(26, 'channels', 'fr', 'cmdNewChannel', 'Ajouter un nouveau canal');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(27, 'messages', 'en', 'lblMessage', 'Enter your message');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(28, 'messages', 'fr', 'lblMessage', 'Entrer votre message');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(29, 'messages', 'en', 'cmdNewMessage', 'Send');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(30, 'messages', 'fr', 'cmdNewMessage', 'Envoyer');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(31, 'messages', 'en', 'lnkReturn', 'Return');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(32, 'messages', 'fr', 'lnkReturn', 'Retour');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(33, 'channels', 'en', 'lnkLogout', 'Logout');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(34, 'channels', 'fr', 'lnkLogout', 'D&eacute;connexion');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(35, 'return', 'en', 'lnkReturn', 'Return');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(36, 'return', 'fr', 'lnkReturn', 'Retour');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(37, 'index', 'en', '1', 'Account creation failed! Check all fields were filled and that passwords match.');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(38, 'index', 'fr', '1', 'Echec de la creation du compte! Verifiez que tous les champs sont remplis et que les mots de passe correspondent.');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(39, 'channels', 'en', '1', 'The field is empty.');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(40, 'channels', 'fr', '1', 'Le champ est vide.');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(41, 'messages', 'en', '1', 'The field is empty.');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(42, 'messages', 'fr', '1', 'Le champ est vide.');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(43, 'index', 'en', 'rdbLang', 'Language');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(44, 'index', 'fr', 'rdbLang', 'Langue');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(45, 'index', 'en', 'rdbForm', 'Account');
INSERT INTO `Labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(46, 'index', 'fr', 'rdbForm', 'Compte');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(47, 'index', 'es', 'lblAccountname', 'Nombre de cuenta');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(48, 'index', 'es', 'lblPassword', 'Contrase&ntilde;a');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(49, 'index', 'pt', 'lblAccountname', 'Nome de conta');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(50, 'index', 'pt', 'lblPassword', 'Senha');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(51, 'index', 'es', 'cmdNewAccount', 'Crear una cuenta');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(52, 'index', 'pt', 'cmdNewAccount', 'Criar uma conta');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(53, 'index', 'es', 'cmdLogin', 'Entrar');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(54, 'index', 'pt', 'cmdLogin', 'Entrar');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(55, 'index', 'es', 'lblFormLogin', 'Acceso');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(56, 'index', 'pt', 'lblFormLogin', 'Acessar');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(57, 'index', 'es', 'lblFormAccount', 'Nueva cuenta');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(58, 'index', 'pt', 'lblFormAccount', 'Nova conta');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(59, 'index', 'es', 'lblNewAccountname', 'Nuevo nombre de cuenta');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(60, 'index', 'es', 'lblNewPassword', 'Nueva contrase&ntilde;a');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(61, 'index', 'pt', 'lblNewAccountname', 'Novo nome de conta');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(62, 'index', 'pt', 'lblNewPassword', 'Nova senha');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(63, 'index', 'es', 'lblNewFirstname', 'Primer nombre');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(64, 'index', 'pt', 'lblNewFirstname', 'Primeiro nome');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(65, 'index', 'es', 'lblNewLastname', 'Apellido');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(66, 'index', 'pt', 'lblNewLastname', 'Apelido');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(67, 'index', 'es', 'lblNewPassword2', 'Confirmar la contrase&ntilde;a');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(68, 'index', 'pt', 'lblNewPassword2', 'Confirme a senha');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(69, 'channels', 'es', 'lblName', 'Nuevo nombre de canal');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(70, 'channels', 'pt', 'lblName', 'Novo nome de canal');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(71, 'channels', 'es', 'cmdNewChannel', 'A&ntilde;adir un nuevo canal');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(72, 'channels', 'pt', 'cmdNewChannel', 'Adicionar um novo canal');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(73, 'messages', 'es', 'lblMessage', 'Escriba su mensaje');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(74, 'messages', 'pt', 'lblMessage', 'Insira a sua mensagem');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(75, 'messages', 'es', 'cmdNewMessage', 'Enviar');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(76, 'messages', 'pt', 'cmdNewMessage', 'Enviar');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(77, 'messages', 'es', 'lnkReturn', 'Volver');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(78, 'messages', 'pt', 'lnkReturn', 'Voltar');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(79, 'channels', 'es', 'lnkLogout', 'Cerrar la sesi&oacute;n');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(80, 'channels', 'pt', 'lnkLogout', 'Encerrar a sess&atilde;o');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(81, 'return', 'es', 'lnkReturn', 'Volver');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(82, 'return', 'pt', 'lnkReturn', 'Voltar');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(83, 'index', 'es', '1', 'No se pudo crear la cuenta! Comprueba que todos los campos est&aacute;n rellenados y que las contrase&ntilde;as coinciden.');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(84, 'index', 'pt', '1', 'Falha na cria&ccedil;&aacute;o da conta! Verifique se todos os campos foram preenchidos e se as senhas correspondem.');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(85, 'channels', 'es', '1', 'El campo est&aacute; vacío.');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(86, 'channels', 'pt', '1', 'O campo estiver vazio.');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(87, 'messages', 'es', '1', 'El campo est&aacute; vacío.');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(88, 'messages', 'pt', '1', 'O campo estiver vazio.');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(89, 'index', 'es', 'rdbLang', 'Idioma');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(90, 'index', 'pt', 'rdbLang', 'Lingua');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(91, 'index', 'es', 'rdbForm', 'Cuenta');
INSERT INTO `labeltext` (`id`, `page`, `lang`, `position`, `labeltext`) VALUES
(92, 'index', 'pt', 'rdbForm', 'Conta');

-- --------------------------------------------------------

--
-- Structure de la table `Account`
--

DROP TABLE IF EXISTS `Account`;
CREATE TABLE IF NOT EXISTS `Account` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `accountname` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `creationdate` timestamp NOT NULL default '0000-00-00 00:00:00'
);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `Channel`
--
--ALTER TABLE `Channel` ADD CONSTRAINT `fk_channel_account_id` FOREIGN KEY (`account_id`) REFERENCES `Account` (`id`);

CREATE TRIGGER fki_channel_account_id
  BEFORE INSERT ON Channel
  FOR EACH ROW BEGIN
      SELECT RAISE(ROLLBACK, 'insert on table "Channel" violates foreign key constraint "fk_channel_account_id"')
      WHERE  NEW.account_id IS NOT NULL
             AND (SELECT id FROM Account WHERE id = new.account_id) IS NULL;
  END;
  
  CREATE TRIGGER fku_channel_account_id
  BEFORE UPDATE ON Channel
  FOR EACH ROW BEGIN
      SELECT RAISE(ROLLBACK, 'update on table "Channel" violates foreign key constraint "fk_channel_account_id"')
      WHERE NEW.account_id IS NOT NULL
            AND (SELECT id FROM Account WHERE id = NEW.account_id) IS NULL;
  END;
  
  CREATE TRIGGER fkd_channel_account_id
  BEFORE DELETE ON Account
  FOR EACH ROW BEGIN
      SELECT RAISE(ROLLBACK, 'delete on table "Account" violates foreign key constraint "fk_channel_account_id"')
      WHERE (SELECT account_id FROM Channel WHERE account_id = OLD.id) IS NOT NULL;
  END;

--
-- Contraintes pour la table `Message`
--
--ALTER TABLE `Message` ADD CONSTRAINT `fk_message_account_id` FOREIGN KEY (`account_id`) REFERENCES `Account` (`id`);

CREATE TRIGGER fki_message_account_id
  BEFORE INSERT ON Message
  FOR EACH ROW BEGIN
      SELECT RAISE(ROLLBACK, 'insert on table "Message" violates foreign key constraint "fk_message_account_id"')
      WHERE  NEW.account_id IS NOT NULL
             AND (SELECT id FROM Account WHERE id = new.account_id) IS NULL;
  END;
  
CREATE TRIGGER fku_message_account_id
  BEFORE UPDATE ON Message
  FOR EACH ROW BEGIN
      SELECT RAISE(ROLLBACK, 'update on table "Message" violates foreign key constraint "fk_message_account_id"')
      WHERE NEW.account_id IS NOT NULL
            AND (SELECT id FROM Account WHERE id = NEW.account_id) IS NULL;
  END;
  
CREATE TRIGGER fkd_message_account_id
  BEFORE DELETE ON Account
  FOR EACH ROW BEGIN
      SELECT RAISE(ROLLBACK, 'delete on table "Account" violates foreign key constraint "fk_message_account_id"')
      WHERE (SELECT account_id FROM Message WHERE account_id = OLD.id) IS NOT NULL;
  END;
