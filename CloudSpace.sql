-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 10-06-2017 a las 20:48:38
-- Versión del servidor: 5.7.16-0ubuntu0.16.04.1
-- Versión de PHP: 7.0.8-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `CloudSpace`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivos`
--

CREATE TABLE `archivos` (
  `id_archivo` int(4) NOT NULL,
  `fecha_subida_archivos` date NOT NULL,
  `comentario` varchar(256) NOT NULL,
  `peso_archivo_MB` int(255) NOT NULL,
  `nombre_archivo` int(11) NOT NULL,
  `usuario.id` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos_de_trabajo`
--

CREATE TABLE `equipos_de_trabajo` (
  `id_equipo` int(4) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `nombre_equipo` text NOT NULL,
  `estado` int(1) NOT NULL,
  `usuario.id_usuario` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `equipos_de_trabajo`
--

INSERT INTO `equipos_de_trabajo` (`id_equipo`, `fecha_creacion`, `nombre_equipo`, `estado`, `usuario.id_usuario`) VALUES
(1, '2017-05-28', 'TESTGROUP', 1, 'mariok32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Forma`
--

CREATE TABLE `Forma` (
  `equipos_de_trabajo.id_equipo` int(4) NOT NULL,
  `usuarios.id_usuarios` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Forma`
--

INSERT INTO `Forma` (`equipos_de_trabajo.id_equipo`, `usuarios.id_usuarios`) VALUES
(1, 'mariok32'),
(1, 'mariok322'),
(1, 'mariok322');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Reporte`
--

CREATE TABLE `Reporte` (
  `id_fallos` int(4) NOT NULL,
  `usuarios.id_usuario` varchar(255) NOT NULL,
  `Titulo` varchar(255) NOT NULL,
  `texto` varchar(1000) NOT NULL,
  `fecha_reporte` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Reporte`
--

INSERT INTO `Reporte` (`id_fallos`, `usuarios.id_usuario`, `Titulo`, `texto`, `fecha_reporte`) VALUES
(1, 'mariok32', 'Bienvenido a la plataforma online CloudSpace', 'Cloudspace, es una plataforma de almacenamiento online, multiplataforma y ademas gratuita', '2017-06-04'),
(2, 'mariok32', 'Prueba', 'Prueba', '2017-06-04'),
(3, 'mariok32', 'Prueba', 'Prueba', '2017-06-04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiene`
--

CREATE TABLE `tiene` (
  `equipos_de_trabajo.id_equipo` int(4) NOT NULL,
  `archivos.id_archivo` int(4) NOT NULL,
  `id_relacion` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` varchar(256) NOT NULL,
  `correo_electronico` varchar(256) NOT NULL,
  `tipo_usuario` int(11) NOT NULL,
  `fecha_registro_usuario` date NOT NULL,
  `contraseña` varchar(256) NOT NULL,
  `activado` int(1) DEFAULT NULL,
  `cuota_MB` int(11) NOT NULL,
  `espacio_usuado` int(11) NOT NULL,
  `nombre_usuario` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `correo_electronico`, `tipo_usuario`, `fecha_registro_usuario`, `contraseña`, `activado`, `cuota_MB`, `espacio_usuado`, `nombre_usuario`) VALUES
('mariok32', 'mariok32@hotmail.com', 1, '2017-06-07', 'emulador', 1, 5000, 0, 'Mario López Segura'),
('mariok322', 'mariok32m@gmail.com', 0, '2017-06-07', 'emulador', 1, 5000, 0, 'Mario López Segura');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `archivos`
--
ALTER TABLE `archivos`
  ADD PRIMARY KEY (`id_archivo`);

--
-- Indices de la tabla `equipos_de_trabajo`
--
ALTER TABLE `equipos_de_trabajo`
  ADD PRIMARY KEY (`id_equipo`);

--
-- Indices de la tabla `Reporte`
--
ALTER TABLE `Reporte`
  ADD PRIMARY KEY (`id_fallos`),
  ADD UNIQUE KEY `id_fallos` (`id_fallos`);

--
-- Indices de la tabla `tiene`
--
ALTER TABLE `tiene`
  ADD PRIMARY KEY (`archivos.id_archivo`),
  ADD UNIQUE KEY `archivos.id_archivo` (`archivos.id_archivo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo_electronico` (`correo_electronico`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `archivos`
--
ALTER TABLE `archivos`
  MODIFY `id_archivo` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `equipos_de_trabajo`
--
ALTER TABLE `equipos_de_trabajo`
  MODIFY `id_equipo` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `Reporte`
--
ALTER TABLE `Reporte`
  MODIFY `id_fallos` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tiene`
--
ALTER TABLE `tiene`
  MODIFY `archivos.id_archivo` int(4) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
