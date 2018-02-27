-- phpMyAdmin SQL Dump
-- version 4.1.14.8
-- http://www.phpmyadmin.net
--
-- Servidor: db722399904.db.1and1.com
-- Tiempo de generación: 27-02-2018 a las 12:17:13
-- Versión del servidor: 5.5.59-0+deb7u1-log
-- Versión de PHP: 5.4.45-0+deb7u12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `db722399904`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carga`
--

CREATE TABLE IF NOT EXISTS `carga` (
  `id_carga` int(11) NOT NULL AUTO_INCREMENT,
  `id_depachadora` int(11) NOT NULL,
  `id_pipa` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad_carga` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `precio_carga` int(11) NOT NULL,
  PRIMARY KEY (`id_carga`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cities`
--

INSERT INTO `cities` (`id`, `name`) VALUES
(1, 'mexico'),
(2, 'orizaba'),
(3, 'cd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `despachadora`
--

CREATE TABLE IF NOT EXISTS `despachadora` (
  `id_despachadora` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `clave` varchar(3) NOT NULL,
  `codigo_despachadora` varchar(100) NOT NULL,
  `latitud_despachadora` int(11) NOT NULL,
  `longitud_despachadora` int(11) NOT NULL,
  `nombre` int(11) NOT NULL,
  `litros_despachadora` int(11) NOT NULL,
  `litros_costo_despachadora` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `id_detalle_venta` int(11) NOT NULL AUTO_INCREMENT,
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad_litros_vendidos` int(11) NOT NULL,
  `costo_total_vendido` int(11) NOT NULL,
  PRIMARY KEY (`id_detalle_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pipa`
--

CREATE TABLE IF NOT EXISTS `pipa` (
  `id_pipa` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `litros_reales` int(11) NOT NULL,
  `costo_litros` int(11) NOT NULL,
  `placas` varchar(50) NOT NULL,
  `clave` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_producto` int(11) NOT NULL,
  `precio_producto` int(11) NOT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `id_status` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(3) NOT NULL,
  `descripcion_status` varchar(50) NOT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE IF NOT EXISTS `tipo_usuario` (
  `id_tipousuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipousuario` varchar(100) NOT NULL,
  `descripcion_tipousuario` text NOT NULL,
  PRIMARY KEY (`id_tipousuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(400) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono_usuario` int(11) NOT NULL,
  `contrasenia` varchar(40) NOT NULL,
  `latitud_usuario` text NOT NULL,
  `longitud_usuario` text NOT NULL,
  `id_tipousuario` int(11) NOT NULL,
  `clave` varchar(3) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre_completo`, `correo`, `telefono_usuario`, `contrasenia`, `latitud_usuario`, `longitud_usuario`, `id_tipousuario`, `clave`) VALUES
(1, 'Eduardo Mendez', 'eduardo.mendez@gmail.com', 2722727, 'Eduardo193@', '123123.123..123', '123.123.12.3', 1, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE IF NOT EXISTS `venta` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `id_pipa` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `codigo_venta` text NOT NULL,
  `clave` varchar(3) NOT NULL,
  PRIMARY KEY (`id_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
