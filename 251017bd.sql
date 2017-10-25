-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-10-2017 a las 14:02:22
-- Versión del servidor: 10.1.25-MariaDB
-- Versión de PHP: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `incrementar_visitas` (IN `id` BIGINT UNSIGNED)  UPDATE  Productos SET  visitas=visitas + 1 WHERE id_producto=id LIMIT 1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `todo_categorias` ()  SELECT * FROM categorias$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `todo_detalle_factura` ()  SELECT * FROM detalle_factura$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `todo_factura` (IN `id_usuario` INT(255))  SELECT * FROM factura WHERE id_usuario=(`id_usuario` )$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `todo_producto` ()  SELECT * FROM productos ORDER BY id_producto DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `todo_usuario` ()  SELECT * FROM usuario$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categorias` int(15) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `describcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categorias`, `nombre`, `describcion`) VALUES
(1, 'electro fiesta', ''),
(2, 'otra categori', ''),
(4, 'led 4k', ''),
(5, 'televisores lcd', ''),
(6, 'televisores plasma', ''),
(7, 'lavadoras', ''),
(8, 'lavadoras', ''),
(9, 'prueba', ''),
(10, 'aaaaaaaaaa', 'aaaaaaaaaaaa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `id` bigint(255) NOT NULL,
  `id_dueno` bigint(255) NOT NULL,
  `id_producto` bigint(255) NOT NULL,
  `contenido` longtext COLLATE utf8_unicode_ci NOT NULL,
  `fecha` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`id`, `id_dueno`, `id_producto`, `contenido`, `fecha`) VALUES
(1, 21, 9, 'hola', '21/07/2017 12:32 am'),
(2, 0, 9, 'fhnj', '21/07/2017 12:34 am'),
(3, 21, 9, 'NO\n', '21/07/2017 12:35 am'),
(4, 21, 9, 'HOLA', '21/07/2017 12:39 am'),
(5, 21, 9, 'JAJJAJAJAJAJAAAAAAAAAAAAAAAAAAAA', '21/07/2017 12:58 am');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config`
--

CREATE TABLE `config` (
  `id` tinyint(1) NOT NULL,
  `timer` int(70) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `config`
--

INSERT INTO `config` (`id`, `timer`) VALUES
(1, 1508425676);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

CREATE TABLE `detalle_factura` (
  `id_detalle` bigint(255) NOT NULL,
  `id_factura` bigint(20) NOT NULL,
  `cantidad_productos` int(10) NOT NULL,
  `total` int(11) NOT NULL,
  `id_producto` bigint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_factura`
--

INSERT INTO `detalle_factura` (`id_detalle`, `id_factura`, `cantidad_productos`, `total`, `id_producto`) VALUES
(1, 1, 1, 30000, 11),
(2, 1, 5, 1000000, 12),
(3, 1, 8, 212000, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fabricantes`
--

CREATE TABLE `fabricantes` (
  `Clave_fabricante` int(11) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fabricantes`
--

INSERT INTO `fabricantes` (`Clave_fabricante`, `Nombre`) VALUES
(1, 'Memoria'),
(2, 'Kingston'),
(3, 'Play Station'),
(4, 'DVD'),
(5, 'Libro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_factura` bigint(20) NOT NULL,
  `fecha` varchar(25) NOT NULL,
  `total` int(40) NOT NULL,
  `id_usuario` bigint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_factura`, `fecha`, `total`, `id_usuario`) VALUES
(1, '24/10/2017', 1242000, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id_marca` bigint(20) NOT NULL,
  `nombre` varchar(80) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` bigint(255) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `precio` decimal(50,0) NOT NULL,
  `caracteristicas` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `imagen` text COLLATE utf8_unicode_ci NOT NULL,
  `id_categorias` bigint(20) NOT NULL DEFAULT '1',
  `estado` int(1) NOT NULL DEFAULT '1',
  `cantidad` bigint(20) NOT NULL,
  `fecha` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario` bigint(255) NOT NULL,
  `visitas` bigint(255) NOT NULL DEFAULT '0',
  `cantidad_mensajes` bigint(255) NOT NULL,
  `id_marca` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `precio`, `caracteristicas`, `descripcion`, `imagen`, `id_categorias`, `estado`, `cantidad`, `fecha`, `id_usuario`, `visitas`, `cantidad_mensajes`, `id_marca`) VALUES
(1, 'extractor', '20000', 'carcaterisitrcas', 'sdjkbhjae', 'extractor.PNG', 1, 1, 10, '18/052017', 0, 192, 4, 0),
(3, 'nevera', '20000', 'carcaterisitrcas', 'sdjkbhjae', 'nevera.png', 1, 1, 10, '1/08/2016', 0, 18, 1, 0),
(4, 'televisor', '212000', 'caracterisitcas', 'djejnva', 'televisor.png', 1, 1, 10, '6/01/2017', 0, 93, 2, 0),
(5, 'estarf', '50000', 'es blanco\r\n3000000 caballos de fuerza', 'modelo ker315646\r\n153456454\r\n\r\nfgfxbgdg', 'extractor.PNG', 1, 1, 10, '', 18, 3, 0, 0),
(8, 'prueba', '200000', 'jhasdvfhjvhjv\r\nsadlkfnkajsbvj\r\nasdklfbvksbvjkl\r\najsdkjvbajsv\r\nasdijghbvkjz<v\r\nsdjbvjk<znv\r\nkijsdbvgjklnzalñ\r\nobhdkvjnz<lñs\r\nhjsdkvjbnz<vg\r\na`ñphvkljzxm´<f<kbjgvlkza<añdhblkjas+\r\nz<dkv´p\r\nz<djklñas<n´ñvbhjsdk\r\nç´hdjbñsd2.4asdfopk\r\n´pvkbvzhjxvmlñaseioñdviw2489tq24\'978945\'¡v1ewfwafawef', '2ebhajks´ñasmdlkazsdkfbvkjansdñlvj´paz<smdkldkndhhjdhdjnvgbvfjnfjsdzjkjszh<ksdhjnszljdhf´sdjflkasndjfhasjdhfjkasdhfhasdgfgasdghasdfsdafjksdahjkdsghdsafgsdahgsdagsdhgsdaghsdahjasdhjsdghsdghghsghssghghsghsghsghsghsghsghsghsghghsghjhjsghsghsghjsghsghsghsghsghsghghsghsghsghsghsghghsghsghsghghsghsghsghsghjjhsjhsghsghghshjsghjshjshhjsghsghsghghsghsghsghsghsghsgh', 'extractor.PNG', 2, 1, 10, '29/05/2017 02:33 am', 21, 204, 3, 0),
(9, 'vb nmeba', '20002000', 'jhasdvfhjvhjv\r\nsadlkfnkajsbvj\r\nasdklfbvksbvjkl\r\najsdkjvbajsv\r\nasdijghbvkjz<v\r\nsdjbvjk<znv\r\nkijsdbvgjklnzalñ\r\nobhdkvjnz<lñs\r\nhjsdkvjbnz<vg\r\na`ñphvkljzxm´<f<kbjgvlkza<añdhblkjas+\r\nz<dkv´p\r\nz<djklñas<n´ñvbhjsdk\r\nç´hdjbñsd2.4asdfopk\r\n´pvkbvzhjxvmlñaseioñdviw2489tq24\'978945\'¡v1ewfwafawef', '2ebhajks´ñasmdlkazsdkfbvkjansdñlvj´paz<smdkldkndhhjdhdjnvgbvfjnfjsdzjkjszh<ksdhjnszljdhf´sdjflkasndjfhasjdhfjkasdhfhasdgfgasdghasdfsdafjksdahjkdsghdsafgsdahgsdagsdhgsdaghsdahjasdhjsdghsdghghsghssghghsghsghsghsghsghsghsghsghghsghjhjsghsghsghjsghsghsghsghsghsghghsghsghsghsghsghghsghsghsghghsghsghsghsghjjhsjhsghsghghshjsghjshjshhjsghsghsghghsghsghsghsghsghsgh', 'extractor.PNG', 2, 1, 10, '29/05/2017 02:34 am', 21, 49, 1, 0),
(10, 'hidro labadopra', '30000', 'jhasdvfhjvhjv\r\nsadlkfnkajsbvj\r\nasdklfbvksbvjkl\r\najsdkjvbajsv\r\nasdijghbvkjz<v\r\nsdjbvjk<znv\r\nkijsdbvgjklnzalñ\r\nobhdkvjnz<lñs\r\nhjsdkvjbnz<vg\r\na`ñphvkljzxm´<f<kbjgvlkza<añdhblkjas+\r\nz<dkv´p\r\nz<djklñas<n´ñvbhjsdk\r\nç´hdjbñsd2.4asdfopk\r\n´pvkbvzhjxvmlñaseioñdviw2489tq24\'978945\'¡v1ewfwafawef', '2ebhajks´ñasmdlkazsdkfbvkjansdñlvj´paz<smdkldkndhhjdhdjnvgbvfjnfjsdzjkjszh<ksdhjnszljdhf´sdjflkasndjfhasjdhfjkasdhfhasdgfgasdghasdfsdafjksdahjkdsghdsafgsdahgsdagsdhgsdaghsdahjasdhjsdghsdghghsghssghghsghsghsghsghsghsghsghsghghsghjhjsghsghsghjsghsghsghsghsghsghghsghsghsghsghsghghsghsghsghghsghsghsghsghjjhsjhsghsghghshjsghjshjshhjsghsghsghghsghsghsghsghsghsgh', 'hidrolavadora.PNG', 1, 1, 10, '29/05/2017 02:40 am', 21, 0, 0, 0),
(11, 'hidro labadopra', '30000', 'jhasdvfhjvhjv\r\nsadlkfnkajsbvj\r\nasdklfbvksbvjkl\r\najsdkjvbajsv\r\nasdijghbvkjz<v\r\nsdjbvjk<znv\r\nkijsdbvgjklnzalñ\r\nobhdkvjnz<lñs\r\nhjsdkvjbnz<vg\r\na`ñphvkljzxm´<f<kbjgvlkza<añdhblkjas+\r\nz<dkv´p\r\nz<djklñas<n´ñvbhjsdk\r\nç´hdjbñsd2.4asdfopk\r\n´pvkbvzhjxvmlñaseioñdviw2489tq24\'978945\'¡v1ewfwafawef', '2ebhajks´ñasmdlkazsdkfbvkjansdñlvj´paz<smdkldkndhhjdhdjnvgbvfjnfjsdzjkjszh<ksdhjnszljdhf´sdjflkasndjfhasjdhfjkasdhfhasdgfgasdghasdfsdafjksdahjkdsghdsafgsdahgsdagsdhgsdaghsdahjasdhjsdghsdghghsghssghghsghsghsghsghsghsghsghsghghsghjhjsghsghsghjsghsghsghsghsghsghghsghsghsghsghsghghsghsghsghghsghsghsghsghjjhsjhsghsghghshjsghjshjshhjsghsghsghghsghsghsghsghsghsgh', 'hidrolavadora.PNG', 1, 1, 10, '29/05/2017 02:41 am', 21, 5, 0, 0),
(12, 'horno', '200000', 'hola hola\r\nholaholav\r\nvvvholaholavvholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholavvvvvholaholaholavvvvholavvvholavvholaholaholaholaholaholav', 'holavvholaholavholavholaholaholaholaholaholaholahola', 'horno empotrar.PNG', 2, 1, 10, '28/05/2017 08:57 pm', 21, 31, 0, 0),
(13, 'horno', '200000', 'hola hola\r\nholaholav\r\nvvvholaholavvholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholavvvvvholaholaholavvvvholavvvholavvholaholaholaholaholaholav', 'holavvholaholavholavholaholaholaholaholaholaholahola', 'horno empotrar.PNG', 2, 1, 10, '28/05/2017 08:59 pm', 21, 35, 0, 0),
(14, 'horno', '200000', 'hola hola\r\nholaholav\r\nvvvholaholavvholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholavvvvvholaholaholavvvvholavvvholavvholaholaholaholaholaholav', 'holavvholaholavholavholaholaholaholaholaholaholahola', 'horno empotrar.PNG', 2, 1, 10, '28/05/2017 09:04 pm', 21, 13, 0, 0),
(15, 'horno', '200000', 'hola hola\r\nholaholav\r\nvvvholaholavvholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholavvvvvholaholaholavvvvholavvvholavvholaholaholaholaholaholav', 'holavvholaholavholavholaholaholaholaholaholaholahola', 'horno empotrar.PNG', 2, 1, 10, '28/05/2017 09:04 pm', 21, 0, 0, 0),
(16, 'horno', '200000', 'hola hola\r\nholaholav\r\nvvvholaholavvholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholavvvvvholaholaholavvvvholavvvholavvholaholaholaholaholaholav', 'holavvholaholavholavholaholaholaholaholaholaholahola', 'horno empotrar.PNG', 2, 1, 10, '28/05/2017 09:05 pm', 21, 0, 0, 0),
(17, 'horno', '200000', 'hola hola\r\nholaholav\r\nvvvholaholavvholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholavvvvvholaholaholavvvvholavvvholavvholaholaholaholaholaholav', 'holavvholaholavholavholaholaholaholaholaholaholahola', 'horno empotrar.PNG', 2, 1, 10, '28/05/2017 09:06 pm', 21, 0, 0, 0),
(18, 'horno', '200000', 'hola hola\r\nholaholav\r\nvvvholaholavvholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholavvvvvholaholaholavvvvholavvvholavvholaholaholaholaholaholav', 'holavvholaholavholavholaholaholaholaholaholaholahola', 'horno empotrar.PNG', 2, 1, 10, '28/05/2017 09:08 pm', 21, 0, 0, 0),
(19, 'horno', '50000', 'fafaffa\r\nfafaffafafaffa\r\nfafaffafafaffavfafaffafafaffafafaffavvvvfafaffavfafaffafafaffafafaffafafaffafafaffafafaffafafaffafafaffafafaffafafaffafafaffafafaffafafaffafafaffafafaffafafaffafafaffafafaffafafaffafafaffafafaffafafaffafafaffafafaffavfafaffavvvvvvvv', 'fafaffafafaffavfafaffafafaffafafaffavfafaffav\r\nfafaffa\r\nfafaffa\r\nfafaffavfafaffa', 'horno empotrar.PNG', 1, 1, 10, '28/05/2017 09:24 pm', 21, 0, 0, 0),
(21, 'horno', '510', 'fafaffaxhxdfhgafaffafafaffafafaffafafaffafafaffafafaffafafaffafafaffafafaffafafaffafafaffafafaffafafaffafafaffafafaffafafaffafafaffafafaffavfafaffavvvvvvvv', 'fafaffafafaffavfafaffafafaffafafaffavfafaffav\r\nfafaffa\r\nfafafxfgbfa\r\nfafafbgfavfafaffa', 'horno empotrar.PNG', 2, 1, 10, '28/05/2017 09:25 pm', 21, 0, 0, 0),
(22, 'microondas', '50000', '        <li>[b]Negrita[/b]</li>\r\n                <li>[i]Italic[/i]</li>\r\n                <li>[u]Subrayado[/u]</li>\r\n                <li>[s]Tachado[/s]</li>\r\n                <li>[img]URL image[/img]</li>\r\n                <li>[center]Centrar[/center]</li>\r\n                <li>[h1]Titulo gigante[/h1]</li>\r\n                <li>[h2]Titulo medianamete grande[/h2]</li>\r\n                <li>[h3]Titulo mediano[/h3]</li>\r\n                <li>[h4]Titulo normal[/h4]</li>\r\n                <li>[h5]Titulo pequeño[/h5]</li>\r\n                <li>[h6]Titulo muy pequeño[/h6]</li>\r\n                <li>[quote]Cita[/quote]</li>\r\n                <li>[size=20]Texto en 20px[/size]</li>\r\n                <li>[url=URL LINK]Texto a hacer clic[/url]</li>\r\n                <li>[font=Arial]Texto en arial[/font]</li>\r\n                <li>[bgimage=URL IMAGEN]Texto donde habrá imagen de fondo[/bgimage]</li>\r\n                <li>[color=red]Color Rojo[/color]</li>\r\n                <li>[bgcolor=red]Color de fondo Rojo[/bgcolor]</li>', '        <li>[b]Negrita[/b]</li>\r\n                <li>[i]Italic[/i]</li>\r\n                <li>[u]Subrayado[/u]</li>\r\n                <li>[s]Tachado[/s]</li>\r\n                <li>[img]URL image[/img]</li>\r\n                <li>[center]Centrar[/center]</li>\r\n                <li>[h1]Titulo gigante[/h1]</li>\r\n                <li>[h2]Titulo medianamete grande[/h2]</li>\r\n                <li>[h3]Titulo mediano[/h3]</li>\r\n                <li>[h4]Titulo normal[/h4]</li>\r\n                <li>[h5]Titulo pequeño[/h5]</li>\r\n                <li>[h6]Titulo muy pequeño[/h6]</li>\r\n                <li>[quote]Cita[/quote]</li>\r\n                <li>[size=20]Texto en 20px[/size]</li>\r\n                <li>[url=URL LINK]Texto a hacer clic[/url]</li>\r\n                <li>[font=Arial]Texto en arial[/font]</li>\r\n                <li>[bgimage=URL IMAGEN]Texto donde habrá imagen de fondo[/bgimage]</li>\r\n                <li>[color=red]Color Rojo[/color]</li>\r\n                <li>[bgcolor=red]Color de fondo Rojo[/bgcolor]</li>', 'microondas.PNG', 1, 1, 10, '07/06/2017 05:09 pm', 21, 1, 0, 0),
(23, 'microondas', '50000', '        <li>[b]Negrita[/b]</li>\r\n                <li>[i]Italic[/i]</li>\r\n                <li>[u]Subrayado[/u]</li>\r\n                <li>[s]Tachado[/s]</li>\r\n                <li>[img]URL image[/img]</li>\r\n                <li>[center]Centrar[/center]</li>\r\n                <li>[h1]Titulo gigante[/h1]</li>\r\n                <li>[h2]Titulo medianamete grande[/h2]</li>\r\n                <li>[h3]Titulo mediano[/h3]</li>\r\n                <li>[h4]Titulo normal[/h4]</li>\r\n                <li>[h5]Titulo pequeño[/h5]</li>\r\n                <li>[h6]Titulo muy pequeño[/h6]</li>\r\n                <li>[quote]Cita[/quote]</li>\r\n                <li>[size=20]Texto en 20px[/size]</li>\r\n                <li>[url=URL LINK]Texto a hacer clic[/url]</li>\r\n                <li>[font=Arial]Texto en arial[/font]</li>\r\n                <li>[bgimage=URL IMAGEN]Texto donde habrá imagen de fondo[/bgimage]</li>\r\n                <li>[color=red]Color Rojo[/color]</li>\r\n                <li>[bgcolor=red]Color de fondo Rojo[/bgcolor]</li>', '        <li>[b]Negrita[/b]</li>\r\n                <li>[i]Italic[/i]</li>\r\n                <li>[u]Subrayado[/u]</li>\r\n                <li>[s]Tachado[/s]</li>\r\n                <li>[img]URL image[/img]</li>\r\n                <li>[center]Centrar[/center]</li>\r\n                <li>[h1]Titulo gigante[/h1]</li>\r\n                <li>[h2]Titulo medianamete grande[/h2]</li>\r\n                <li>[h3]Titulo mediano[/h3]</li>\r\n                <li>[h4]Titulo normal[/h4]</li>\r\n                <li>[h5]Titulo pequeño[/h5]</li>\r\n                <li>[h6]Titulo muy pequeño[/h6]</li>\r\n                <li>[quote]Cita[/quote]</li>\r\n                <li>[size=20]Texto en 20px[/size]</li>\r\n                <li>[url=URL LINK]Texto a hacer clic[/url]</li>\r\n                <li>[font=Arial]Texto en arial[/font]</li>\r\n                <li>[bgimage=URL IMAGEN]Texto donde habrá imagen de fondo[/bgimage]</li>\r\n                <li>[color=red]Color Rojo[/color]</li>\r\n                <li>[bgcolor=red]Color de fondo Rojo[/bgcolor]</li>', 'licuadora.PNG', 9, 1, 10, '07/06/2017 05:09 pm', 21, 9, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

CREATE TABLE `respuestas` (
  `id` bigint(255) NOT NULL,
  `id_dueno` int(255) NOT NULL,
  `id_producto` int(255) NOT NULL,
  `contenido` longtext COLLATE utf8_unicode_ci NOT NULL,
  `fecha` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `respuesta` bigint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `respuestas`
--

INSERT INTO `respuestas` (`id`, `id_dueno`, `id_producto`, `contenido`, `fecha`, `respuesta`) VALUES
(6, 18, 3, 'otar pregunta\r\n', '05/06/2017 04:51 pm', 0),
(7, 18, 4, 'hola esta es un aprueba ', '05/06/2017 05:39 pm', 0),
(8, 18, 8, 'este es un comentario', '05/06/2017 09:07 pm', 0),
(9, 18, 1, 'esta es una pregunta', '05/06/2017 09:17 pm', 0),
(10, 21, 1, 'esta una pregunta', '15/06/2017 05:10 pm', 0),
(11, 21, 8, 'xdf', '20/07/2017 10:10 pm', 0),
(12, 21, 8, 'fmkhjfgm', '21/07/2017 12:23 am', 0),
(13, 21, 9, 'que mas', '21/07/2017 12:29 am', 0),
(14, 21, 4, 'trdshs', '26/09/2017 10:12 am', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` bigint(255) NOT NULL,
  `nombre` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `permisos` int(1) NOT NULL DEFAULT '0',
  `activo` int(1) NOT NULL DEFAULT '0',
  `keyreg` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `keypass` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `newpass` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ultima_conexion` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(70) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `firma` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rango` varchar(70) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'usuario',
  `fecha_registro` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '29/05/2017',
  `estadisticas` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mensajes` int(15) NOT NULL DEFAULT '0',
  `respuesta` bigint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `email`, `password`, `permisos`, `activo`, `keyreg`, `keypass`, `newpass`, `ultima_conexion`, `img`, `firma`, `rango`, `fecha_registro`, `estadisticas`, `mensajes`, `respuesta`) VALUES
(10, 'pedro', '1', '12345', 1, 0, '', '', '0', '0', 'default.jpg', '', 'usuario', '29/05/2017', 'a', 0, 0),
(12, 'man', 'ghhgghgh|@HDF', '1234', 2, 0, '', '', '0', '0', 'default.jpg', '', 'usuario', '29/05/2017', 'b', 0, 0),
(14, 'sebas', 'sebas@gmail.com', 'd41d8cd98f00b204e9800998ecf842', 1, 0, '', '', '0', '0', 'default.jpg', '', 'usuario', '29/05/2017', 'c', 0, 0),
(18, 'toño', 'juan508sebastian@gmail.com', '65402f90ef3ceb04c9a50fe3b5aa895d', 1, 0, '', '', '0', '1507552953', 'default.jpg', '', 'usuario', '29/05/2017', 'd', 4, 0),
(21, 'pato', 'juan508sebastian@gmail.com', '65402f90ef3ceb04c9a50fe3b5aa895d', 2, 1, '', '', '', '1508425676', 'default.jpg', '', 'usuario', '29/05/2017', 'e', 7, 0),
(22, 'julio', 'julio@gmial.com', '65402f90ef3ceb04c9a50fe3b5aa895d', 1, 0, 'b240623d2724d0bfc918669096bce1e2', '', '', '0', 'default.jpg', '', 'usuario', '29/05/2017', 'f', 0, 0),
(23, 'sapo', 'mepuentes06@misena.edu.co', 'be5a8b995abf618247705f284688c579', 0, 0, 'd51370dfc873eb70ec15ba19d3737154', '', '', '', 'default.jpg', '', 'usuario', '09/10/17', '', 0, 0),
(24, 'pepito', 'mehfc@mnvcn.com', '123', 0, 0, 'e777babecf3d786e62bc64f6fb560fd4', '', '', '', 'default.jpg', '', 'usuario', '13/10/2017', '', 0, 0),
(25, 'usu', 'dfgdf@dxc.com', '65402f90ef3ceb04c9a50fe3b5aa895d', 0, 0, '5697467251ec99abf25cf4dbf824df60', '', '', '1507899646', 'default.jpg', '', 'usuario', '13/10/17', '', 0, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categorias`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_factura` (`id_factura`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `fabricantes`
--
ALTER TABLE `fabricantes`
  ADD PRIMARY KEY (`Clave_fabricante`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_usuario_2` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categorias` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `config`
--
ALTER TABLE `config`
  MODIFY `id` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  MODIFY `id_detalle` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_factura` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id_marca` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD CONSTRAINT `detalle_factura_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`),
  ADD CONSTRAINT `detalle_factura_ibfk_3` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
