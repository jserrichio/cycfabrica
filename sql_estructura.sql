-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-03-2017 a las 18:14:28
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `drmorant_cyc`
--
CREATE DATABASE IF NOT EXISTS `drmorant_cyc` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `drmorant_cyc`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avio`
--

CREATE TABLE `avio` (
  `id_avio` int(11) NOT NULL,
  `nombre_avio` varchar(255) DEFAULT NULL,
  `descripcion_avio` varchar(255) DEFAULT NULL,
  `precio_avio` decimal(5,2) DEFAULT NULL,
  `stock_avio` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `nombre_cli` varchar(255) NOT NULL,
  `dni_cli` varchar(255) DEFAULT NULL,
  `telefono_cli` varchar(255) DEFAULT NULL,
  `direccion_cli` varchar(255) DEFAULT NULL,
  `localidad_cli` varchar(255) DEFAULT NULL,
  `email_cli` varchar(255) DEFAULT NULL,
  `saldo` decimal(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cobro`
--

CREATE TABLE `cobro` (
  `id_cobro` int(11) NOT NULL,
  `forma_de_pago` varchar(50) DEFAULT NULL,
  `monto` float DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_taller` int(11) DEFAULT NULL,
  `num_cheque` varchar(50) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `banco` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cobro de los talleres por parte de la empresa';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `corte`
--

CREATE TABLE `corte` (
  `id_corte` int(11) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `id_taller` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `cantidad_restante` int(11) DEFAULT NULL,
  `costo_unidad` decimal(10,2) DEFAULT NULL,
  `costo_total` decimal(10,2) DEFAULT NULL,
  `observacion_corte` varchar(1000) DEFAULT NULL,
  `costura_corte` varchar(1000) DEFAULT NULL,
  `fliselina` tinyint(1) NOT NULL,
  `tira` tinyint(1) NOT NULL,
  `muestra` tinyint(1) NOT NULL,
  `num_corte` int(11) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `corte_color_capas`
--

CREATE TABLE `corte_color_capas` (
  `idcorte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `corte_entrega`
--

CREATE TABLE `corte_entrega` (
  `id_corte_entrega` int(11) NOT NULL,
  `id_corte` int(11) DEFAULT NULL,
  `controlado_por` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `cantidad_entregada` int(11) DEFAULT NULL,
  `cantidad_fallada` int(11) DEFAULT NULL,
  `pagar` decimal(10,2) DEFAULT NULL,
  `deuda` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `corte_pend`
--

CREATE TABLE `corte_pend` (
  `idcorte_pend` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_corte_avio`
--

CREATE TABLE `detalle_corte_avio` (
  `id_detalle_corte_avio` int(11) NOT NULL,
  `id_corte` int(11) DEFAULT NULL,
  `id_avio` int(11) DEFAULT NULL,
  `cantidad` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_corte_producto`
--

CREATE TABLE `detalle_corte_producto` (
  `id_detalle_corte_producto` int(11) NOT NULL,
  `id_corte` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `talle` varchar(10) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id_detalle` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` float NOT NULL,
  `talle` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `foto_avio`
--

CREATE TABLE `foto_avio` (
  `id_foto_avio` int(11) NOT NULL,
  `id_avio` int(11) NOT NULL,
  `foto_avio` longblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `foto_producto`
--

CREATE TABLE `foto_producto` (
  `id_foto_producto` int(11) NOT NULL,
  `id_prod` int(11) NOT NULL,
  `foto_prod` longblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `forma_de_pago` varchar(255) DEFAULT NULL,
  `banco` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `dias` int(11) DEFAULT NULL,
  `fecha_cheque` date DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `num_cheque` varchar(50) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `control` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_prod` int(11) NOT NULL,
  `nombre_prod` varchar(255) NOT NULL,
  `num_prod` int(11) DEFAULT NULL,
  `descripcion_prod` varchar(255) DEFAULT NULL,
  `tipo_prod` varchar(255) NOT NULL,
  `sexo_prod` varchar(255) NOT NULL,
  `foto_prod` longblob,
  `precio_unitario` decimal(5,2) DEFAULT NULL,
  `precio_xmayor` decimal(5,2) DEFAULT NULL,
  `activo` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_taller`
--

CREATE TABLE `producto_taller` (
  `id_producto_taller` int(11) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `id_taller` int(11) DEFAULT NULL,
  `costo` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taller`
--

CREATE TABLE `taller` (
  `id_taller` int(11) NOT NULL,
  `dni_taller` varchar(255) DEFAULT NULL,
  `nombre_taller` varchar(255) DEFAULT NULL,
  `telefono_taller` varchar(255) DEFAULT NULL,
  `direccion_taller` varchar(255) DEFAULT NULL,
  `localidad_taller` varchar(255) DEFAULT NULL,
  `mail_taller` varchar(255) DEFAULT NULL,
  `saldo_taller` decimal(10,2) NOT NULL DEFAULT '0.00',
  `saldo_afavor_empresa` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tipo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talle_bolsa`
--

CREATE TABLE `talle_bolsa` (
  `id_talle_bolsa` int(11) NOT NULL,
  `id_prod` int(11) DEFAULT NULL,
  `1` int(11) DEFAULT NULL,
  `2` int(11) DEFAULT NULL,
  `3` int(11) DEFAULT NULL,
  `4` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talle_cinturon`
--

CREATE TABLE `talle_cinturon` (
  `id_talle_cinturon` int(11) NOT NULL,
  `id_prod` int(11) DEFAULT NULL,
  `90` int(11) DEFAULT NULL,
  `95` int(11) DEFAULT NULL,
  `100` int(11) DEFAULT NULL,
  `105` int(11) DEFAULT NULL,
  `110` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talle_corte_pendiente_n`
--

CREATE TABLE `talle_corte_pendiente_n` (
  `idtalleccc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talle_corte_pendiente_p`
--

CREATE TABLE `talle_corte_pendiente_p` (
  `id_talleccp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talle_corte_pendiente_r`
--

CREATE TABLE `talle_corte_pendiente_r` (
  `idtcpr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talle_media`
--

CREATE TABLE `talle_media` (
  `id_talle_media` int(11) NOT NULL,
  `id_prod` int(11) DEFAULT NULL,
  `negro` int(11) DEFAULT NULL,
  `gris` int(11) DEFAULT NULL,
  `azul` int(11) DEFAULT NULL,
  `aero` int(11) DEFAULT NULL,
  `blanca` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talle_ninos`
--

CREATE TABLE `talle_ninos` (
  `id_talle_ninos` int(11) NOT NULL,
  `id_prod` int(11) NOT NULL,
  `1` int(11) NOT NULL,
  `2` int(11) NOT NULL,
  `4` int(11) NOT NULL,
  `6` int(11) NOT NULL,
  `8` int(11) NOT NULL,
  `10` int(11) NOT NULL,
  `12` int(11) NOT NULL,
  `14` int(11) NOT NULL,
  `16` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talle_pantalon`
--

CREATE TABLE `talle_pantalon` (
  `id_talle_pantalon` int(11) NOT NULL,
  `id_prod` int(11) NOT NULL,
  `26` int(11) DEFAULT NULL,
  `28` int(11) DEFAULT NULL,
  `30` int(11) DEFAULT NULL,
  `32` int(11) DEFAULT NULL,
  `34` int(11) DEFAULT NULL,
  `36` int(11) DEFAULT NULL,
  `38` int(11) DEFAULT NULL,
  `40` int(11) DEFAULT NULL,
  `42` int(11) DEFAULT NULL,
  `44` int(11) DEFAULT NULL,
  `46` int(11) DEFAULT NULL,
  `48` int(11) DEFAULT NULL,
  `50` int(11) DEFAULT NULL,
  `52` int(11) DEFAULT NULL,
  `54` int(11) DEFAULT NULL,
  `56` int(11) DEFAULT NULL,
  `58` int(11) DEFAULT NULL,
  `60` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talle_remera`
--

CREATE TABLE `talle_remera` (
  `id_talle_remera` int(11) NOT NULL,
  `id_prod` int(11) NOT NULL,
  `xs` int(11) DEFAULT NULL,
  `s` int(11) DEFAULT NULL,
  `m` int(11) DEFAULT NULL,
  `l` int(11) DEFAULT NULL,
  `xl` int(11) DEFAULT NULL,
  `xxl` int(11) DEFAULT NULL,
  `xxxl` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha_venta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_pago` date DEFAULT NULL,
  `Subtotal` decimal(10,2) NOT NULL,
  `cc` int(11) DEFAULT NULL,
  `deuda` decimal(10,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `avio`
--
ALTER TABLE `avio`
  ADD PRIMARY KEY (`id_avio`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `cobro`
--
ALTER TABLE `cobro`
  ADD PRIMARY KEY (`id_cobro`);

--
-- Indices de la tabla `corte`
--
ALTER TABLE `corte`
  ADD PRIMARY KEY (`id_corte`);

--
-- Indices de la tabla `corte_color_capas`
--
ALTER TABLE `corte_color_capas`
  ADD PRIMARY KEY (`idcorte`);

--
-- Indices de la tabla `corte_entrega`
--
ALTER TABLE `corte_entrega`
  ADD PRIMARY KEY (`id_corte_entrega`);

--
-- Indices de la tabla `corte_pend`
--
ALTER TABLE `corte_pend`
  ADD PRIMARY KEY (`idcorte_pend`);

--
-- Indices de la tabla `detalle_corte_avio`
--
ALTER TABLE `detalle_corte_avio`
  ADD PRIMARY KEY (`id_detalle_corte_avio`);

--
-- Indices de la tabla `detalle_corte_producto`
--
ALTER TABLE `detalle_corte_producto`
  ADD PRIMARY KEY (`id_detalle_corte_producto`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id_detalle`);

--
-- Indices de la tabla `foto_avio`
--
ALTER TABLE `foto_avio`
  ADD PRIMARY KEY (`id_foto_avio`);

--
-- Indices de la tabla `foto_producto`
--
ALTER TABLE `foto_producto`
  ADD PRIMARY KEY (`id_foto_producto`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_pago`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_prod`);

--
-- Indices de la tabla `producto_taller`
--
ALTER TABLE `producto_taller`
  ADD PRIMARY KEY (`id_producto_taller`);

--
-- Indices de la tabla `taller`
--
ALTER TABLE `taller`
  ADD PRIMARY KEY (`id_taller`);

--
-- Indices de la tabla `talle_bolsa`
--
ALTER TABLE `talle_bolsa`
  ADD PRIMARY KEY (`id_talle_bolsa`);

--
-- Indices de la tabla `talle_cinturon`
--
ALTER TABLE `talle_cinturon`
  ADD PRIMARY KEY (`id_talle_cinturon`);

--
-- Indices de la tabla `talle_corte_pendiente_n`
--
ALTER TABLE `talle_corte_pendiente_n`
  ADD PRIMARY KEY (`idtalleccc`);

--
-- Indices de la tabla `talle_corte_pendiente_p`
--
ALTER TABLE `talle_corte_pendiente_p`
  ADD PRIMARY KEY (`id_talleccp`);

--
-- Indices de la tabla `talle_corte_pendiente_r`
--
ALTER TABLE `talle_corte_pendiente_r`
  ADD PRIMARY KEY (`idtcpr`);

--
-- Indices de la tabla `talle_media`
--
ALTER TABLE `talle_media`
  ADD PRIMARY KEY (`id_talle_media`);

--
-- Indices de la tabla `talle_ninos`
--
ALTER TABLE `talle_ninos`
  ADD PRIMARY KEY (`id_talle_ninos`);

--
-- Indices de la tabla `talle_pantalon`
--
ALTER TABLE `talle_pantalon`
  ADD PRIMARY KEY (`id_talle_pantalon`);

--
-- Indices de la tabla `talle_remera`
--
ALTER TABLE `talle_remera`
  ADD PRIMARY KEY (`id_talle_remera`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `avio`
--
ALTER TABLE `avio`
  MODIFY `id_avio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;
--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT de la tabla `cobro`
--
ALTER TABLE `cobro`
  MODIFY `id_cobro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=847;
--
-- AUTO_INCREMENT de la tabla `corte`
--
ALTER TABLE `corte`
  MODIFY `id_corte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1178;
--
-- AUTO_INCREMENT de la tabla `corte_color_capas`
--
ALTER TABLE `corte_color_capas`
  MODIFY `idcorte` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `corte_entrega`
--
ALTER TABLE `corte_entrega`
  MODIFY `id_corte_entrega` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1649;
--
-- AUTO_INCREMENT de la tabla `corte_pend`
--
ALTER TABLE `corte_pend`
  MODIFY `idcorte_pend` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `detalle_corte_avio`
--
ALTER TABLE `detalle_corte_avio`
  MODIFY `id_detalle_corte_avio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1871;
--
-- AUTO_INCREMENT de la tabla `detalle_corte_producto`
--
ALTER TABLE `detalle_corte_producto`
  MODIFY `id_detalle_corte_producto` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23193;
--
-- AUTO_INCREMENT de la tabla `foto_avio`
--
ALTER TABLE `foto_avio`
  MODIFY `id_foto_avio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT de la tabla `foto_producto`
--
ALTER TABLE `foto_producto`
  MODIFY `id_foto_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;
--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=248;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_prod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=294;
--
-- AUTO_INCREMENT de la tabla `producto_taller`
--
ALTER TABLE `producto_taller`
  MODIFY `id_producto_taller` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `taller`
--
ALTER TABLE `taller`
  MODIFY `id_taller` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT de la tabla `talle_bolsa`
--
ALTER TABLE `talle_bolsa`
  MODIFY `id_talle_bolsa` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `talle_cinturon`
--
ALTER TABLE `talle_cinturon`
  MODIFY `id_talle_cinturon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `talle_corte_pendiente_n`
--
ALTER TABLE `talle_corte_pendiente_n`
  MODIFY `idtalleccc` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `talle_corte_pendiente_p`
--
ALTER TABLE `talle_corte_pendiente_p`
  MODIFY `id_talleccp` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `talle_corte_pendiente_r`
--
ALTER TABLE `talle_corte_pendiente_r`
  MODIFY `idtcpr` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `talle_media`
--
ALTER TABLE `talle_media`
  MODIFY `id_talle_media` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `talle_ninos`
--
ALTER TABLE `talle_ninos`
  MODIFY `id_talle_ninos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT de la tabla `talle_pantalon`
--
ALTER TABLE `talle_pantalon`
  MODIFY `id_talle_pantalon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `talle_remera`
--
ALTER TABLE `talle_remera`
  MODIFY `id_talle_remera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;
--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3463;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
