-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-05-2024 a las 19:19:26
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sgvp-rimdeca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE `almacen` (
  `idAlmacen` int(11) UNSIGNED NOT NULL,
  `idProducto` int(11) UNSIGNED NOT NULL,
  `stock` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `almacen`
--

INSERT INTO `almacen` (`idAlmacen`, `idProducto`, `stock`) VALUES
(3, 3, 47),
(4, 4, 60),
(5, 9, 110),
(6, 10, 18),
(7, 7, 35),
(8, 11, 58),
(9, 13, 43);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boleta`
--

CREATE TABLE `boleta` (
  `idBoleta` int(11) UNSIGNED NOT NULL,
  `idVenta` int(11) UNSIGNED NOT NULL,
  `nombre_completo` varchar(244) DEFAULT NULL,
  `dni` char(8) DEFAULT NULL,
  `direccion` varchar(500) DEFAULT NULL,
  `numero_de_serie` varchar(244) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `boleta`
--

INSERT INTO `boleta` (`idBoleta`, `idVenta`, `nombre_completo`, `dni`, `direccion`, `numero_de_serie`) VALUES
(35, 56, 'MARTIN ALBERTO VIZCARRA CORNEJO', '04412417', 'Av. Lima #51', '001'),
(36, 59, 'DINA ERCILIA BOLUARTE ZEGARRA', '06256217', 'Av. Lima #54', '002');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) UNSIGNED NOT NULL,
  `categoria` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `categoria`) VALUES
(3, 'SELLOS HIDRAULICOS'),
(4, 'ACOPLES HIDRAULICOS'),
(5, 'ACEITES HIDRAULICOS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `idDetalleVenta` int(11) UNSIGNED NOT NULL,
  `idVenta` int(11) UNSIGNED NOT NULL,
  `idAlmacen` int(11) UNSIGNED NOT NULL,
  `cantidad` int(100) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`idDetalleVenta`, `idVenta`, `idAlmacen`, `cantidad`) VALUES
(59, 56, 6, 2),
(60, 57, 8, 2),
(61, 58, 9, 2),
(62, 59, 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idEmpleado` int(11) UNSIGNED NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(155) DEFAULT NULL,
  `dni` char(8) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  `fecha_de_ingreso` date DEFAULT NULL,
  `rol` varchar(20) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idEmpleado`, `nombres`, `apellidos`, `dni`, `telefono`, `fecha_de_ingreso`, `rol`, `correo`, `contraseña`) VALUES
(2, 'Jhon Alexander', 'Llapapasca Montes', '88888888', '999999999', '2024-05-01', 'Administrador', 'jhonllapapasca@rimdeca.com', '123456'),
(3, 'Jose Eduardo', 'Angeles Bravo', '88888888', '999999999', '2024-05-21', 'Administrador', 'eduardoangeles@rimdeca.com', 'RIMDECA'),
(4, 'Brayan', 'Delgado Ramos', '88888888', '999999999', '2024-05-21', 'Empleado', 'brayandelgado@rimdeca.com', 'RIMDECA'),
(5, 'Fabian', 'Paico Carrillo', '88888888', '999999999', '2024-05-21', 'Empleado', 'fabianpaico@rimdeca.com', 'RIMDECA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `idFactura` int(11) UNSIGNED NOT NULL,
  `idVenta` int(11) UNSIGNED NOT NULL,
  `nombre_comercial` varchar(200) DEFAULT NULL,
  `ruc` char(20) DEFAULT NULL,
  `direccion` varchar(500) DEFAULT NULL,
  `numero_de_serie` varchar(244) DEFAULT NULL,
  `igv` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`idFactura`, `idVenta`, `nombre_comercial`, `ruc`, `direccion`, `numero_de_serie`, `igv`) VALUES
(1, 57, 'GLORIA SA', '20100190797', 'AV. REPUBLICA DE PANAMA NRO. 2461 URB. TA CATALINA  (ENTRE VIA EXPRESA Y REPUBLICA DE PANAMA)', '001', 90),
(2, 58, 'NEP SA', '20263322496', 'CAL.LUIS GALVANI NRO. 493 URB.  LOTIZACION INDUSTRIALTA ROSA  (ANTES AV. LOS CASTILLOS C.3 Z.I STA ROSA)', '002', 180);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) UNSIGNED NOT NULL,
  `idCategoria` int(11) UNSIGNED NOT NULL,
  `idProveedor` int(11) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `idCategoria`, `idProveedor`, `nombre`, `precio`) VALUES
(3, 3, 3, 'LIMPIADOR METALICO', 45),
(4, 3, 3, 'RETEN', 105),
(5, 3, 3, 'DAS', 125),
(6, 3, 3, 'BAFER', 50),
(7, 4, 4, 'ACOPLE JIC', 20),
(8, 4, 4, 'ACOPLE ESPIGA', 45),
(9, 4, 4, 'ACOPLES ESPIGA ASIENTO PLANO', 63),
(10, 4, 4, 'ACOPLES BRIDA CAT INTERLOCK', 103),
(11, 5, 5, 'BALDE DE ACEITE HIDRAULICO 68 VISTONY', 250),
(12, 5, 5, 'BALDE DE ACEITE DE TRANSMISION', 300),
(13, 5, 5, 'BALDE A CEITE HIDRAULICO CAT', 500),
(14, 5, 5, 'LIQUIDO DE FRENO 13 ONZAS', 33);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `idProveedor` int(11) UNSIGNED NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `ruc` char(20) DEFAULT NULL,
  `direccion` varchar(500) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`idProveedor`, `nombre`, `ruc`, `direccion`, `telefono`) VALUES
(3, 'EMPRESA S.A.C. 01', '2022451235798123', 'Av. Chiclayo #20', '999999999'),
(4, 'EMPRESA S.A.C. 02', '3022451235798123', 'Av. Mexico #150', '999999999'),
(5, 'EMPRESA S.A.C. 03', '3022451235798123', 'Av. Leguia #45', '999999999');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `idVenta` int(11) UNSIGNED NOT NULL,
  `idEmpleado` int(11) UNSIGNED NOT NULL,
  `monto_total` double DEFAULT NULL,
  `fecha_de_emision` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`idVenta`, `idEmpleado`, `monto_total`, `fecha_de_emision`) VALUES
(56, 5, 206, '2024-05-21'),
(57, 5, 590, '2024-05-21'),
(58, 4, 1180, '2024-05-21'),
(59, 4, 135, '2024-05-21');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`idAlmacen`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `boleta`
--
ALTER TABLE `boleta`
  ADD PRIMARY KEY (`idBoleta`),
  ADD KEY `idVenta` (`idVenta`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`idDetalleVenta`),
  ADD KEY `idVenta` (`idVenta`),
  ADD KEY `idAlmacen` (`idAlmacen`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idEmpleado`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`idFactura`),
  ADD KEY `idVenta` (`idVenta`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `idCategoria` (`idCategoria`),
  ADD KEY `idProveedor` (`idProveedor`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idProveedor`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`idVenta`),
  ADD KEY `idEmpleado` (`idEmpleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacen`
--
ALTER TABLE `almacen`
  MODIFY `idAlmacen` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `boleta`
--
ALTER TABLE `boleta`
  MODIFY `idBoleta` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `idDetalleVenta` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idEmpleado` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `idFactura` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `idProveedor` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `idVenta` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD CONSTRAINT `almacen_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`);

--
-- Filtros para la tabla `boleta`
--
ALTER TABLE `boleta`
  ADD CONSTRAINT `boleta_ibfk_1` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`);

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`),
  ADD CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`idAlmacen`) REFERENCES `almacen` (`idAlmacen`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
