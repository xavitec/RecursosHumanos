-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-11-2018 a las 20:32:55
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `recurso_humano`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia_entrada`
--

CREATE TABLE `asistencia_entrada` (
  `id_entrada` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `id_empleado` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia_salida`
--

CREATE TABLE `asistencia_salida` (
  `id_salida` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id_empleado` int(10) NOT NULL,
  `horas_extras` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `id_cargo` int(11) NOT NULL,
  `Descripcion_cargo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`id_cargo`, `Descripcion_cargo`) VALUES
(1, 'Gerente'),
(2, 'Vendedor'),
(3, 'adminn');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `cod_ciudad` int(11) NOT NULL,
  `Descripcion_ciudad` varchar(45) NOT NULL,
  `cod_provincia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`cod_ciudad`, `Descripcion_ciudad`, `cod_provincia`) VALUES
(1, 'Quevedo', 6),
(2, 'Guayaquil', 1),
(3, 'Quito', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato`
--

CREATE TABLE `contrato` (
  `id_contrato` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `Descripcion_contrato` varchar(100) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `id_estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `Id_departamento` int(11) NOT NULL,
  `nom_departamento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`Id_departamento`, `nom_departamento`) VALUES
(7, 'FINANZAS'),
(17, 'QUEJAS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_nomina`
--

CREATE TABLE `detalle_nomina` (
  `id_dt_nomina` int(11) NOT NULL,
  `cedula` int(10) NOT NULL,
  `hora_no_trabajada` int(10) NOT NULL,
  `sueldo` int(10) NOT NULL,
  `decimo_tercero` int(10) NOT NULL,
  `decimo_cuarto` int(10) NOT NULL,
  `vacaciones` time NOT NULL,
  `utilidades` int(10) NOT NULL,
  `aportaciones` int(10) NOT NULL,
  `horas_trabajadas` int(110) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id` int(11) NOT NULL,
  `cedula` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `e_mail` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `lugar_nacimiento` varchar(100) NOT NULL,
  `estado_civil` varchar(50) NOT NULL,
  `genero` varchar(50) NOT NULL,
  `nacionalidad` varchar(50) NOT NULL,
  `id_turno` int(11) NOT NULL,
  `id_cargo` int(11) NOT NULL,
  `sueldo` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_departamento`
--

CREATE TABLE `empleado_departamento` (
  `Id_emp_depa` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `Id_estado` int(11) NOT NULL,
  `Descripcion_estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`Id_estado`, `Descripcion_estado`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `liquidacion`
--

CREATE TABLE `liquidacion` (
  `id_liqui` int(11) NOT NULL,
  `liquidacion_cedula` int(11) NOT NULL,
  `sueldo` decimal(10,2) NOT NULL,
  `vacaciones` int(10) NOT NULL,
  `meses_trabajados` int(10) NOT NULL,
  `prima_antigua` decimal(10,2) NOT NULL,
  `indemnizacion` decimal(10,2) NOT NULL,
  `tres_meses_sueldo` decimal(10,2) NOT NULL,
  `total_liquidacion` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multas`
--

CREATE TABLE `multas` (
  `id_multas` int(11) NOT NULL,
  `id_empleado` int(10) NOT NULL,
  `Descripcion_multa` varchar(100) NOT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina`
--

CREATE TABLE `nomina` (
  `Id_nomina` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `id_dt_nomima` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `cod_provincia` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`cod_provincia`, `descripcion`) VALUES
(1, 'Guayas'),
(2, 'Azuay'),
(3, 'Pichincha'),
(4, 'El Oro'),
(5, 'Cotopaxi'),
(6, 'Los Rios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `id_sucursal` int(11) NOT NULL,
  `Descripcion_sucursal` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `cod_ciudad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`id_sucursal`, `Descripcion_sucursal`, `direccion`, `telefono`, `cod_ciudad`) VALUES
(62, 'XAVITEC', '6632 STIRLING RD # CB720-7', '9543676039', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE `turno` (
  `id_turno` int(11) NOT NULL,
  `hora_turno` int(10) NOT NULL,
  `time` varchar(10) NOT NULL,
  `hora_turno2` int(11) NOT NULL,
  `time2` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `turno`
--

INSERT INTO `turno` (`id_turno`, `hora_turno`, `time`, `hora_turno2`, `time2`) VALUES
(1, 8, 'am', 12, 'pm'),
(2, 8, 'am', 16, 'pm'),
(3, 12, 'pm', 16, 'pm');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_estado` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_estado`, `username`, `password`) VALUES
(1, 'admin', 'admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asistencia_entrada`
--
ALTER TABLE `asistencia_entrada`
  ADD PRIMARY KEY (`id_entrada`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `asistencia_salida`
--
ALTER TABLE `asistencia_salida`
  ADD PRIMARY KEY (`id_salida`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id_cargo`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`cod_ciudad`),
  ADD KEY `cod_provincia` (`cod_provincia`);

--
-- Indices de la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`id_contrato`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`Id_departamento`),
  ADD UNIQUE KEY `nom_departamento` (`nom_departamento`);

--
-- Indices de la tabla `detalle_nomina`
--
ALTER TABLE `detalle_nomina`
  ADD PRIMARY KEY (`id_dt_nomina`),
  ADD KEY `nomina_cedula` (`cedula`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_cedula` (`cedula`),
  ADD KEY `id_turno` (`id_turno`),
  ADD KEY `id_cargo` (`id_cargo`),
  ADD KEY `sueldo` (`sueldo`);

--
-- Indices de la tabla `empleado_departamento`
--
ALTER TABLE `empleado_departamento`
  ADD PRIMARY KEY (`Id_emp_depa`),
  ADD KEY `id_empleado` (`id_empleado`),
  ADD KEY `id_departamento` (`id_departamento`),
  ADD KEY `id_sucursal` (`id_sucursal`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`Id_estado`);

--
-- Indices de la tabla `liquidacion`
--
ALTER TABLE `liquidacion`
  ADD PRIMARY KEY (`id_liqui`),
  ADD KEY `id_empleado` (`liquidacion_cedula`),
  ADD KEY `liqui_sueldo` (`sueldo`);

--
-- Indices de la tabla `multas`
--
ALTER TABLE `multas`
  ADD PRIMARY KEY (`id_multas`),
  ADD KEY `multa` (`id_empleado`);

--
-- Indices de la tabla `nomina`
--
ALTER TABLE `nomina`
  ADD PRIMARY KEY (`Id_nomina`),
  ADD KEY `id_empleado` (`id_empleado`),
  ADD KEY `id_dt_nomima` (`id_dt_nomima`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`cod_provincia`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`id_sucursal`),
  ADD UNIQUE KEY `Descripcion_sucursal` (`Descripcion_sucursal`),
  ADD KEY `cod_ciudad` (`cod_ciudad`);

--
-- Indices de la tabla `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`id_turno`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_estado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asistencia_entrada`
--
ALTER TABLE `asistencia_entrada`
  MODIFY `id_entrada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT de la tabla `asistencia_salida`
--
ALTER TABLE `asistencia_salida`
  MODIFY `id_salida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `cod_ciudad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `contrato`
--
ALTER TABLE `contrato`
  MODIFY `id_contrato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `Id_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `detalle_nomina`
--
ALTER TABLE `detalle_nomina`
  MODIFY `id_dt_nomina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT de la tabla `empleado_departamento`
--
ALTER TABLE `empleado_departamento`
  MODIFY `Id_emp_depa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `Id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `liquidacion`
--
ALTER TABLE `liquidacion`
  MODIFY `id_liqui` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `multas`
--
ALTER TABLE `multas`
  MODIFY `id_multas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT de la tabla `nomina`
--
ALTER TABLE `nomina`
  MODIFY `Id_nomina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `cod_provincia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `id_sucursal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `turno`
--
ALTER TABLE `turno`
  MODIFY `id_turno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asistencia_entrada`
--
ALTER TABLE `asistencia_entrada`
  ADD CONSTRAINT `cedula` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `asistencia_salida`
--
ALTER TABLE `asistencia_salida`
  ADD CONSTRAINT `cedula_id` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `ciudad` FOREIGN KEY (`cod_provincia`) REFERENCES `provincia` (`cod_provincia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `contrato_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`Id_estado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contrato_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_nomina`
--
ALTER TABLE `detalle_nomina`
  ADD CONSTRAINT `nomina_cedula` FOREIGN KEY (`cedula`) REFERENCES `empleado` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `cargo` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`id_turno`) REFERENCES `turno` (`id_turno`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleado_departamento`
--
ALTER TABLE `empleado_departamento`
  ADD CONSTRAINT `empleado_departamento_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empleado_departamento_ibfk_2` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`Id_departamento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empleado_departamento_sucursal` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `liquidacion`
--
ALTER TABLE `liquidacion`
  ADD CONSTRAINT `liqui_sueldo` FOREIGN KEY (`sueldo`) REFERENCES `empleado` (`sueldo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `liquidacion` FOREIGN KEY (`liquidacion_cedula`) REFERENCES `empleado` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `multas`
--
ALTER TABLE `multas`
  ADD CONSTRAINT `multa` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `nomina`
--
ALTER TABLE `nomina`
  ADD CONSTRAINT `nomina_detalle` FOREIGN KEY (`id_dt_nomima`) REFERENCES `detalle_nomina` (`id_dt_nomina`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nomina_id_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD CONSTRAINT `cod_ciudad` FOREIGN KEY (`cod_ciudad`) REFERENCES `ciudad` (`cod_ciudad`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
