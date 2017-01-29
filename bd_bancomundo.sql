-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 27-Jan-2017 às 02:41
-- Versão do servidor: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_bancomundo`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_contas`
--

CREATE TABLE `tb_contas` (
  `IdConta` int(11) NOT NULL,
  `DataAbertura` datetime NOT NULL,
  `ValorAtual` decimal(10,0) NOT NULL DEFAULT '0',
  `IdPessoa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_contas`
--

INSERT INTO `tb_contas` (`IdConta`, `DataAbertura`, `ValorAtual`, `IdPessoa`) VALUES
(1, '2017-01-26 00:00:00', '980', 1),
(2, '2017-01-26 00:00:00', '20', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_pessoas`
--

CREATE TABLE `tb_pessoas` (
  `IdPessoa` int(11) NOT NULL,
  `CPF` varchar(30) NOT NULL,
  `NomePessoa` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_pessoas`
--

INSERT INTO `tb_pessoas` (`IdPessoa`, `CPF`, `NomePessoa`) VALUES
(1, '12345678909', 'Pessoa 1'),
(2, '12345678909', 'Pessoa 2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_contas`
--
ALTER TABLE `tb_contas`
  ADD PRIMARY KEY (`IdConta`),
  ADD KEY `IdPessoa` (`IdPessoa`);

--
-- Indexes for table `tb_pessoas`
--
ALTER TABLE `tb_pessoas`
  ADD PRIMARY KEY (`IdPessoa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_contas`
--
ALTER TABLE `tb_contas`
  MODIFY `IdConta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tb_pessoas`
--
ALTER TABLE `tb_pessoas`
  MODIFY `IdPessoa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tb_contas`
--
ALTER TABLE `tb_contas`
  ADD CONSTRAINT `fk_idpessoa` FOREIGN KEY (`IdPessoa`) REFERENCES `tb_pessoas` (`IdPessoa`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
