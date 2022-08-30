SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `same`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_agenda`
--

CREATE TABLE `t_agenda` (
  `cod_local` double NOT NULL,
  `data` date NOT NULL,
  `hora` varchar(5) NOT NULL,
  `cod_paciente` double DEFAULT NULL,
  `cod_medico` double NOT NULL,
  `confirmado` varchar(1) NOT NULL DEFAULT 'n' COMMENT '0=sim; 1=nao',
  `atendido` varchar(1) NOT NULL DEFAULT 'n' COMMENT '0=sim; 1=nao',
  `cod_convenio` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_atendimento`
--

CREATE TABLE `t_atendimento` (
  `data` date NOT NULL,
  `hora` varchar(5) NOT NULL,
  `cod_paciente` double NOT NULL,
  `cod_medico` double NOT NULL,
  `anamnese` varchar(4000) NOT NULL,
  `diagnose` varchar(4000) NOT NULL,
  `medicamento` varchar(4000) NOT NULL,
  `cod_local` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_atendimento`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_convenio`
--

CREATE TABLE `t_convenio` (
  `cod_convenio` int(10) UNSIGNED NOT NULL,
  `nome_convenio` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_convenio`
--

INSERT INTO `t_convenio` (`cod_convenio`, `nome_convenio`) VALUES
(0, 'SELECIONE UM CONVENIO...');

UPDATE `t_convenio` SET `cod_convenio`=0 WHERE `nome_convenio` LIKE 'SELECIONE UM%';
-- --------------------------------------------------------

--
-- Table structure for table `t_dual`
--

CREATE TABLE `t_dual` (
  `field_1` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_dual`
--

INSERT INTO `t_dual` (`field_1`) VALUES
(' ');

-- --------------------------------------------------------

--
-- Table structure for table `t_especialidade`
--

CREATE TABLE `t_especialidade` (
  `cod_especialidade` int(10) UNSIGNED NOT NULL,
  `nome_especialidade` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_especialidade`
--

INSERT INTO `t_especialidade` (`cod_especialidade`, `nome_especialidade`) VALUES
(0, 'SELECIONE UMA ESPECIALIDADE...');

-- --------------------------------------------------------

--
-- Table structure for table `t_exame`
--

CREATE TABLE `t_exame` (
  `cod_exame` double NOT NULL,
  `nome_exame` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_exame`
--

INSERT INTO `t_exame` (`cod_exame`, `nome_exame`) VALUES
(0, 'SELECIONE UM EXAME...');

-- --------------------------------------------------------

--
-- Table structure for table `t_local`
--

CREATE TABLE `t_local` (
  `cod_local` double NOT NULL,
  `nome_local` varchar(50) NOT NULL,
  `endereco_local` varchar(50) NOT NULL,
  `telefone_local` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_local`
--

INSERT INTO `t_local` (`cod_local`, `nome_local`, `endereco_local`, `telefone_local`) VALUES
(0, 'SELECIONE UM LOCAL...', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `t_medico`
--

CREATE TABLE `t_medico` (
  `cod_medico` double NOT NULL,
  `nome_medico` varchar(50) NOT NULL,
  `cod_crm` varchar(20) NOT NULL,
  `cpf_medico` varchar(11) NOT NULL,
  `cod_especialidade` int(10) UNSIGNED NOT NULL,
  `telefone1` varchar(15) DEFAULT NULL,
  `telefone2` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_medico`
--

INSERT INTO `t_medico` (`cod_medico`, `nome_medico`, `cod_crm`, `cpf_medico`, `cod_especialidade`, `telefone1`, `telefone2`) VALUES
(0, 'SELECIONE UM MEDICO...', '', '', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_medico_convenio`
--

CREATE TABLE `t_medico_convenio` (
  `cod_convenio` int(10) UNSIGNED NOT NULL,
  `cod_medico` double NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_paciente`
--

CREATE TABLE `t_paciente` (
  `cod_paciente` double NOT NULL,
  `nome_paciente` varchar(50) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `data_nasc` date NOT NULL,
  `nome_mae` varchar(50) NOT NULL,
  `nome_pai` varchar(50) NOT NULL,
  `sexo` varchar(1) NOT NULL COMMENT '0=masculino; 1=feminino',
  `e_mail` varchar(100) NOT NULL,
  `peso` double NOT NULL,
  `altura` double NOT NULL,
  `tipo_sangue` int(10) UNSIGNED NOT NULL,
  `cpf_paciente` varchar(11) NOT NULL,
  `cpf_proprio` varchar(1) NOT NULL COMMENT '0=sim;1=nao',
  `nome_cpf` varchar(50) NOT NULL,
  `telefone1` varchar(15) DEFAULT NULL,
  `telefone2` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_paciente`
--

INSERT INTO `t_paciente` (`cod_paciente`, `nome_paciente`, `endereco`, `data_nasc`, `nome_mae`, `nome_pai`, `sexo`, `e_mail`, `peso`, `altura`, `tipo_sangue`, `cpf_paciente`, `cpf_proprio`, `nome_cpf`, `telefone1`, `telefone2`) VALUES
(0, 'SELECIONE UM PACIENTE...', '', '0000-00-00', '', '', '', '', 0, 0, 1, '', '', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_paciente_convenio`
--

CREATE TABLE `t_paciente_convenio` (
  `cod_paciente` double NOT NULL DEFAULT '0',
  `cod_convenio` int(10) UNSIGNED NOT NULL,
  `data_ini` date NOT NULL,
  `data_fim` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_paciente_procedimento`
--

CREATE TABLE `t_paciente_procedimento` (
  `cod_paciente` double NOT NULL,
  `data_proce` date NOT NULL,
  `cod_proce` double NOT NULL,
  `cod_medico` double NOT NULL,
  `cod_convenio` int(10) UNSIGNED NOT NULL,
  `observacoes` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_pedido_exame`
--

CREATE TABLE `t_pedido_exame` (
  `cod_pedido_exame` double UNSIGNED NOT NULL,
  `cod_paciente` double UNSIGNED NOT NULL,
  `data_exame` date NOT NULL,
  `cod_exame` double NOT NULL DEFAULT '0',
  `cod_medico` double NOT NULL,
  `resultado` varchar(10000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_procedimento`
--

CREATE TABLE `t_procedimento` (
  `cod_proce` double NOT NULL,
  `nome_proce` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_procedimento`
--

INSERT INTO `t_procedimento` (`cod_proce`, `nome_proce`) VALUES
(0, 'SELECIONE UM PROCEDIMENTO...');
UPDATE `t_procedimento` SET `cod_proce`=0 WHERE `nome_proce` LIKE 'SELECIONE UM%';

-- --------------------------------------------------------

--
-- Table structure for table `t_procedimento_preco`
--

CREATE TABLE `t_procedimento_preco` (
  `cod_proce` double NOT NULL,
  `data_ini` date NOT NULL,
  `data_fim` datetime DEFAULT NULL,
  `valor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_processo`
--

CREATE TABLE `t_processo` (
  `id_processo` double NOT NULL,
  `nome_processo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_processo`
--

INSERT INTO `t_processo` (`id_processo`, `nome_processo`) VALUES
( 1, 'CADASTRO DE CONVENIOS'),
( 2, 'CADASTRO DE TABELA CONVENIO'),
(14, 'CADASTRO DE TABELA PROCEDIMENTO'),
( 3, 'CADASTRO DE ESPECIALIDADES'),
( 4, 'CADASTRO DE EXAMES'),
( 5, 'CADASTRO DE PROCEDIMENTOS'),
( 6, 'CADASTRO DE LOCAIS'),
( 7, 'CADASTRO DE MEDICOS'),
( 8, 'CADASTRO DE PACIENTES'),
( 9, 'GERAR AGENDA DE ATENDIMENTO'),
(10, 'AGENDAR CONSULTA'),
(11, 'CONSULTAS AGENDADAS'),
(12, 'SOLICITACAO DE EXAMES'),
(13, 'EXECUCAO DE PROCEDIMENTOS'),
(15, 'RELATORIO FECHAMENTO PERIODO'),
(16, 'CONSULTAS POR CONVENIO'),
(17, 'PROCEDIMENTOS POR CONVENIO'),
(98, 'CADASTRO DE USUARIOS'),
(99, 'AUTORIZACOES');

-- --------------------------------------------------------

--
-- Table structure for table `t_role`
--

CREATE TABLE `t_role` (
  `role_id` varchar(1) NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tabela de roles';

--
-- Dumping data for table `t_role`
--

INSERT INTO `t_role` (`role_id`, `role_name`) VALUES
('0', 'Administrador'),
('1', 'Usuário');

-- --------------------------------------------------------

--
-- Table structure for table `t_tabela_preco`
--

CREATE TABLE `t_tabela_preco` (
  `cod_convenio` int(10) UNSIGNED NOT NULL,
  `data_ini` date NOT NULL,
  `data_fim` date DEFAULT NULL,
  `valor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_tabela_procedimento`
--

CREATE TABLE `t_tabela_procedimento` (
  `cod_proce` int(10) UNSIGNED NOT NULL,
  `cod_convenio` int(10) UNSIGNED NOT NULL,
  `data_ini` date NOT NULL,
  `data_fim` date DEFAULT NULL,
  `valor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_telefone`
--

CREATE TABLE `t_telefone` (
  `cod_telefone` double NOT NULL,
  `cod_medico` double DEFAULT NULL,
  `cod_paciente` double DEFAULT NULL,
  `ddd` varchar(3) NOT NULL,
  `numero` varchar(9) NOT NULL,
  `tipo` varchar(1) NOT NULL COMMENT '0=residencia; 1=celular; 2=trabalho; 3=recado',
  `observacao` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_tipo_sangue`
--

CREATE TABLE `t_tipo_sangue` (
  `cod_tipo_sangue` int(10) UNSIGNED NOT NULL,
  `nome_tipo_sangue` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_tipo_sangue`
--

INSERT INTO `t_tipo_sangue` (`cod_tipo_sangue`, `nome_tipo_sangue`) VALUES
(1, 'a+'),
(2, 'a-'),
(3, 'ab+'),
(4, 'ab-'),
(5, 'o+'),
(6, 'o-'),
(7, 'b+'),
(8, 'b-');

-- --------------------------------------------------------

--
-- Table structure for table `t_user_processo`
--

CREATE TABLE `t_user_processo` (
  `loggin_name` varchar(20) NOT NULL,
  `id_processo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_user_processo`
--

INSERT INTO `t_user_processo` (`loggin_name`, `id_processo`) VALUES
('admin', 1),
('admin', 2),
('admin', 3),
('admin', 4),
('admin', 5),
('admin', 6),
('admin', 7),
('admin', 8),
('admin', 9),
('admin', 10),
('admin', 11),
('admin', 12),
('admin', 13),
('admin', 14),
('admin', 15),
('admin', 16),
('admin', 17),
('admin', 18),
('admin', 19),
('admin', 20),
('admin', 21),
('admin', 22),
('admin', 98),
('admin', 99);

-- --------------------------------------------------------

--
-- Table structure for table `t_usuarios`
--

CREATE TABLE `t_usuarios` (
  `login` varchar(15) NOT NULL,
  `senha` varchar(15) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `perfil` int(10) UNSIGNED DEFAULT '0',
  `cod_medico` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_usuarios`
--

INSERT INTO `t_usuarios` (`login`, `senha`, `nome`, `perfil`, `cod_medico`) VALUES
('admin', '@dmin', 'admin', 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_agenda`
--
ALTER TABLE `t_agenda`
  ADD PRIMARY KEY (`cod_local`,`data`,`hora`,`cod_medico`) USING BTREE,
  ADD KEY `fk_t_agenda_1` (`cod_paciente`),
  ADD KEY `fk_t_agenda_2` (`cod_medico`),
  ADD KEY `fk_t_agenda_3` (`cod_local`);

--
-- Indexes for table `t_atendimento`
--
ALTER TABLE `t_atendimento`
  ADD PRIMARY KEY (`data`,`hora`,`cod_paciente`,`cod_medico`) USING BTREE,
  ADD KEY `fk_t_atendimento_2` (`cod_medico`),
  ADD KEY `fk_t_atendimento_1` (`cod_paciente`);

--
-- Indexes for table `t_convenio`
--
ALTER TABLE `t_convenio`
  ADD PRIMARY KEY (`cod_convenio`);

--
-- Indexes for table `t_especialidade`
--
ALTER TABLE `t_especialidade`
  ADD PRIMARY KEY (`cod_especialidade`);

--
-- Indexes for table `t_exame`
--
ALTER TABLE `t_exame`
  ADD PRIMARY KEY (`cod_exame`);

--
-- Indexes for table `t_local`
--
ALTER TABLE `t_local`
  ADD PRIMARY KEY (`cod_local`);

--
-- Indexes for table `t_medico`
--
ALTER TABLE `t_medico`
  ADD PRIMARY KEY (`cod_medico`),
  ADD KEY `fk_t_medico_1` (`cod_especialidade`);

--
-- Indexes for table `t_medico_convenio`
--
ALTER TABLE `t_medico_convenio`
  ADD PRIMARY KEY (`cod_convenio`,`data_inicio`,`cod_medico`),
  ADD KEY `fk_t_medico_convenio_2` (`cod_medico`);

--
-- Indexes for table `t_paciente`
--
ALTER TABLE `t_paciente`
  ADD PRIMARY KEY (`cod_paciente`,`tipo_sangue`) USING BTREE,
  ADD KEY `fk_t_paciente_1` (`tipo_sangue`);

--
-- Indexes for table `t_paciente_convenio`
--
ALTER TABLE `t_paciente_convenio`
  ADD PRIMARY KEY (`cod_paciente`,`cod_convenio`,`data_ini`) USING BTREE,
  ADD KEY `fk_t_paciente_convenio_2` (`cod_convenio`);

--
-- Indexes for table `t_paciente_procedimento`
--
ALTER TABLE `t_paciente_procedimento` ADD PRIMARY KEY( `cod_paciente`, `data_proce`, `cod_proce`, `cod_medico`);
--
-- Indexes for table `t_pedido_exame`
--
ALTER TABLE `t_pedido_exame`
  ADD PRIMARY KEY (`cod_pedido_exame`),
  ADD KEY `fk_t_pedido_exame_3` (`cod_exame`),
  ADD KEY `fk_t_pedido_exame_1` (`cod_paciente`),
  ADD KEY `fk_t_pedido_exame_2` (`cod_medico`);

--
-- Indexes for table `t_procedimento`
--
ALTER TABLE `t_procedimento`
  ADD PRIMARY KEY (`cod_proce`);

--
-- Indexes for table `t_procedimento_preco`
--
ALTER TABLE `t_procedimento_preco`
  ADD PRIMARY KEY (`cod_proce`,`data_ini`);

--
-- Indexes for table `t_tabela_procedimento`
--
ALTER TABLE `t_tabela_procedimento`
  ADD PRIMARY KEY (`cod_proce`,`cod_convenio`,`data_ini`);

--
-- Indexes for table `t_processo`
--
ALTER TABLE `t_processo`
  ADD PRIMARY KEY (`id_processo`);

--
-- Indexes for table `t_tabela_preco`
--
ALTER TABLE `t_tabela_preco`
  ADD PRIMARY KEY (`cod_convenio`,`data_ini`);

--
-- Indexes for table `t_telefone`
--
ALTER TABLE `t_telefone`
  ADD PRIMARY KEY (`cod_telefone`),
  ADD KEY `fk_t_telefone_1` (`cod_medico`),
  ADD KEY `fk_t_telefone_2` (`cod_paciente`);

--
-- Indexes for table `t_tipo_sangue`
--
ALTER TABLE `t_tipo_sangue`
  ADD PRIMARY KEY (`cod_tipo_sangue`);

--
-- Indexes for table `t_user_processo`
--
ALTER TABLE `t_user_processo`
  ADD PRIMARY KEY (`loggin_name`,`id_processo`);

--
-- Indexes for table `t_usuarios`
--
ALTER TABLE `t_usuarios`
  ADD PRIMARY KEY (`login`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_convenio`
--
ALTER TABLE `t_convenio` CHANGE `cod_convenio` `cod_convenio` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
INSERT INTO `t_convenio` (`cod_convenio`, `nome_convenio`) VALUES
(1, 'PARTICULAR'),
(2, 'GOLDEN CROSS'),
(3, 'AMIL'),
(4, 'UNIMED'),
(5, 'ASSIM'),
(6, 'GEAP');

--
-- AUTO_INCREMENT for table `t_especialidade`
--
ALTER TABLE `t_especialidade`
  MODIFY `cod_especialidade` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
INSERT INTO `t_especialidade` (`cod_especialidade`, `nome_especialidade`) VALUES
(1, 'CLINICO GERAL');

--
-- AUTO_INCREMENT for table `t_exame`
--
ALTER TABLE `t_exame`
  MODIFY `cod_exame` double NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_local`
--
ALTER TABLE `t_local`
  MODIFY `cod_local` double NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_medico`
--
ALTER TABLE `t_medico`
  MODIFY `cod_medico` double NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_paciente`
--
ALTER TABLE `t_paciente`
  MODIFY `cod_paciente` double NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_pedido_exame`
--
ALTER TABLE `t_pedido_exame`
  MODIFY `cod_pedido_exame` double UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_procedimento`
--
ALTER TABLE `t_procedimento`
  MODIFY `cod_proce` double NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_telefone`
--
ALTER TABLE `t_telefone`
  MODIFY `cod_telefone` double NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_tipo_sangue`
--
ALTER TABLE `t_tipo_sangue`
  MODIFY `cod_tipo_sangue` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_agenda`
--
ALTER TABLE `t_agenda`
  ADD CONSTRAINT `fk_t_agenda_1` FOREIGN KEY (`cod_paciente`) REFERENCES `t_paciente` (`cod_paciente`),
  ADD CONSTRAINT `fk_t_agenda_2` FOREIGN KEY (`cod_medico`) REFERENCES `t_medico` (`cod_medico`),
  ADD CONSTRAINT `fk_t_agenda_3` FOREIGN KEY (`cod_local`) REFERENCES `t_local` (`cod_local`);

--
-- Constraints for table `t_atendimento`
--
ALTER TABLE `t_atendimento`
  ADD CONSTRAINT `fk_t_atendimento_1` FOREIGN KEY (`cod_paciente`) REFERENCES `t_paciente` (`cod_paciente`),
  ADD CONSTRAINT `fk_t_atendimento_2` FOREIGN KEY (`cod_medico`) REFERENCES `t_medico` (`cod_medico`);

--
-- Constraints for table `t_medico`
--
ALTER TABLE `t_medico`
  ADD CONSTRAINT `fk_t_medico_1` FOREIGN KEY (`cod_especialidade`) REFERENCES `t_especialidade` (`cod_especialidade`);

--
-- Constraints for table `t_medico_convenio`
--
ALTER TABLE `t_medico_convenio`
  ADD CONSTRAINT `fk_t_medico_convenio_1` FOREIGN KEY (`cod_convenio`) REFERENCES `t_convenio` (`cod_convenio`),
  ADD CONSTRAINT `fk_t_medico_convenio_2` FOREIGN KEY (`cod_medico`) REFERENCES `t_medico` (`cod_medico`);

--
-- Constraints for table `t_paciente`
--
ALTER TABLE `t_paciente`
  ADD CONSTRAINT `fk_t_paciente_1` FOREIGN KEY (`tipo_sangue`) REFERENCES `t_tipo_sangue` (`cod_tipo_sangue`);

--
-- Constraints for table `t_paciente_convenio`
--
ALTER TABLE `t_paciente_convenio`
  ADD CONSTRAINT `fk_t_paciente_convenio_1` FOREIGN KEY (`cod_paciente`) REFERENCES `t_paciente` (`cod_paciente`),
  ADD CONSTRAINT `fk_t_paciente_convenio_2` FOREIGN KEY (`cod_convenio`) REFERENCES `t_convenio` (`cod_convenio`);

--
-- Constraints for table `t_paciente_procedimento`
--
ALTER TABLE `t_paciente_procedimento`
  ADD CONSTRAINT `fk_t_paciente_procedimento_1` FOREIGN KEY (`cod_proce`) REFERENCES `t_procedimento` (`cod_proce`),
  ADD CONSTRAINT `fk_t_paciente_procedimento_2` FOREIGN KEY (`cod_paciente`) REFERENCES `t_paciente` (`cod_paciente`);

--
-- Constraints for table `t_pedido_exame`
--
ALTER TABLE `t_pedido_exame`
  ADD CONSTRAINT `fk_t_pedido_exame_1` FOREIGN KEY (`cod_paciente`) REFERENCES `t_paciente` (`cod_paciente`),
  ADD CONSTRAINT `fk_t_pedido_exame_2` FOREIGN KEY (`cod_medico`) REFERENCES `t_medico` (`cod_medico`),
  ADD CONSTRAINT `fk_t_pedido_exame_3` FOREIGN KEY (`cod_exame`) REFERENCES `t_exame` (`cod_exame`);

--
-- Constraints for table `t_procedimento_preco`
--
ALTER TABLE `t_procedimento_preco`
  ADD CONSTRAINT `fk_t_procedimento_preco_1` FOREIGN KEY (`cod_proce`) REFERENCES `t_procedimento` (`cod_proce`);

--
-- Constraints for table `t_tabela_preco`
--
ALTER TABLE `t_tabela_preco`
  ADD CONSTRAINT `fk_t_tabela_preco_1` FOREIGN KEY (`cod_convenio`) REFERENCES `t_convenio` (`cod_convenio`);

--
-- Constraints for table `t_telefone`
--
ALTER TABLE `t_telefone`
  ADD CONSTRAINT `fk_t_telefone_1` FOREIGN KEY (`cod_medico`) REFERENCES `t_medico` (`cod_medico`),
  ADD CONSTRAINT `fk_t_telefone_2` FOREIGN KEY (`cod_paciente`) REFERENCES `t_paciente` (`cod_paciente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
