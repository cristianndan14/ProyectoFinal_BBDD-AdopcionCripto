CREATE DATABASE  IF NOT EXISTS `cripto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cripto`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cripto
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comercio_servicio`
--

DROP TABLE IF EXISTS `comercio_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comercio_servicio` (
  `id_comercio_servicio` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `rubro` varchar(20) NOT NULL,
  `descripcion` varchar(144) NOT NULL,
  `id_pais` int DEFAULT NULL,
  `id_criptomoneda` int DEFAULT NULL,
  `id_wallet` int DEFAULT NULL,
  PRIMARY KEY (`id_comercio_servicio`),
  KEY `id_pais` (`id_pais`),
  KEY `id_criptomoneda` (`id_criptomoneda`),
  KEY `id_wallet` (`id_wallet`),
  CONSTRAINT `comercio_servicio_ibfk_1` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id_pais`),
  CONSTRAINT `comercio_servicio_ibfk_2` FOREIGN KEY (`id_criptomoneda`) REFERENCES `criptomoneda` (`id_criptomoneda`),
  CONSTRAINT `comercio_servicio_ibfk_3` FOREIGN KEY (`id_wallet`) REFERENCES `wallet` (`id_wallet`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_LOG_COMERCIO_SERVICIO` AFTER INSERT ON `comercio_servicio` FOR EACH ROW BEGIN
	INSERT INTO LOG_AUDITORIA_COMERCIO_SERVICIO (NOMBRE_DE_ACCION , NOMBRE_TABLA , USUARIO, DMLFECHA_UPD_INS_DEL , DMLHORA_UPD_INS_DEL ) 
								VALUES ( 'INSERT' , 'COMERCIO_SERVICIO' , CURRENT_USER() , CURRENT_DATE() , CURRENT_TIME() );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_LOG_COMERCIO_SERVICIO_2` BEFORE DELETE ON `comercio_servicio` FOR EACH ROW BEGIN
	INSERT INTO LOG_AUDITORIA_COMERCIO_SERVICIO_2 (NOMBRE , ID_COMERCIO_SERVICIO , NOMBRE_DE_ACCION , NOMBRE_TABLA , USUARIO , DMLFECHA_UPD_INS_DEL , DMLHORA_UPD_INS_DEL)
						VALUES ( OLD.NOMBRE , OLD.ID_COMERCIO_SERVICIO , 'DELETE' , 'COMERCIO_SERVICIO' , CURRENT_USER() , CURRENT_DATE() , CURRENT_TIME() );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `criptomoneda`
--

DROP TABLE IF EXISTS `criptomoneda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `criptomoneda` (
  `id_criptomoneda` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `fecha_creacion` date NOT NULL,
  PRIMARY KEY (`id_criptomoneda`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_auditoria_comercio_servicio`
--

DROP TABLE IF EXISTS `log_auditoria_comercio_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_auditoria_comercio_servicio` (
  `ID_LOG` int NOT NULL AUTO_INCREMENT,
  `NOMBRE_DE_ACCION` varchar(10) DEFAULT NULL,
  `NOMBRE_TABLA` varchar(50) DEFAULT NULL,
  `USUARIO` varchar(100) DEFAULT NULL,
  `DMLFECHA_UPD_INS_DEL` date DEFAULT NULL,
  `DMLHORA_UPD_INS_DEL` time DEFAULT NULL,
  PRIMARY KEY (`ID_LOG`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_auditoria_comercio_servicio_2`
--

DROP TABLE IF EXISTS `log_auditoria_comercio_servicio_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_auditoria_comercio_servicio_2` (
  `ID_LOG` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `ID_COMERCIO_SERVICIO` int NOT NULL,
  `NOMBRE_DE_ACCION` varchar(10) DEFAULT NULL,
  `NOMBRE_TABLA` varchar(50) DEFAULT NULL,
  `USUARIO` varchar(100) DEFAULT NULL,
  `DMLFECHA_UPD_INS_DEL` date DEFAULT NULL,
  `DMLHORA_UPD_INS_DEL` time DEFAULT NULL,
  PRIMARY KEY (`ID_LOG`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_auditoria_usuarios`
--

DROP TABLE IF EXISTS `log_auditoria_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_auditoria_usuarios` (
  `ID_LOG` int NOT NULL AUTO_INCREMENT,
  `NOMBRE_DE_ACCION` varchar(10) DEFAULT NULL,
  `NOMBRE_TABLA` varchar(50) DEFAULT NULL,
  `USUARIO` varchar(100) DEFAULT NULL,
  `DMLFECHA_UPD_INS_DEL` date DEFAULT NULL,
  `DMLHORA_UPD_INS_DEL` time DEFAULT NULL,
  PRIMARY KEY (`ID_LOG`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_auditoria_usuarios_2`
--

DROP TABLE IF EXISTS `log_auditoria_usuarios_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_auditoria_usuarios_2` (
  `ID_LOG` int NOT NULL AUTO_INCREMENT,
  `PROFESION` varchar(100) DEFAULT NULL,
  `ID_USUARIO` int NOT NULL,
  `NOMBRE_DE_ACCION` varchar(10) DEFAULT NULL,
  `NOMBRE_TABLA` varchar(50) DEFAULT NULL,
  `USUARIO` varchar(100) DEFAULT NULL,
  `DMLFECHA_UPD_INS_DEL` date DEFAULT NULL,
  `DMLHORA_UPD_INS_DEL` time DEFAULT NULL,
  PRIMARY KEY (`ID_LOG`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paises` (
  `id_pais` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `habitantes` int NOT NULL,
  `cripto_legal` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `profesion` varchar(20) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `id_pais` int DEFAULT NULL,
  `id_criptomoneda` int DEFAULT NULL,
  `id_wallet` int DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_pais` (`id_pais`),
  KEY `id_criptomoneda` (`id_criptomoneda`),
  KEY `id_wallet` (`id_wallet`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id_pais`),
  CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`id_criptomoneda`) REFERENCES `criptomoneda` (`id_criptomoneda`),
  CONSTRAINT `usuarios_ibfk_3` FOREIGN KEY (`id_wallet`) REFERENCES `wallet` (`id_wallet`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_LOG_USUARIOS` AFTER INSERT ON `usuarios` FOR EACH ROW BEGIN
	INSERT INTO LOG_AUDITORIA_USUARIOS (NOMBRE_DE_ACCION , NOMBRE_TABLA , USUARIO, DMLFECHA_UPD_INS_DEL , DMLHORA_UPD_INS_DEL ) 
								VALUES ( 'INSERT' , 'USUARIOS' , CURRENT_USER() , CURRENT_DATE() , CURRENT_TIME() );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_LOG_USUARIOS_2` BEFORE UPDATE ON `usuarios` FOR EACH ROW BEGIN
	INSERT INTO LOG_AUDITORIA_USUARIOS_2 ( PROFESION , ID_USUARIO, NOMBRE_DE_ACCION , NOMBRE_TABLA , USUARIO , DMLFECHA_UPD_INS_DEL , DMLHORA_UPD_INS_DEL)
						VALUES ( CONCAT('REG ANTERIOR: ' , OLD.PROFESION , ' -- REG ACTUAL: ' , NEW.PROFESION) , NEW.ID_USUARIO , 'UPDATE' , 'USUARIOS' , CURRENT_USER() , CURRENT_DATE() , CURRENT_TIME() );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vw_criptolegal_paises`
--

DROP TABLE IF EXISTS `vw_criptolegal_paises`;
/*!50001 DROP VIEW IF EXISTS `vw_criptolegal_paises`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_criptolegal_paises` AS SELECT 
 1 AS `nombre`,
 1 AS `Legalizado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_criptomonedas_comercio_servicios`
--

DROP TABLE IF EXISTS `vw_criptomonedas_comercio_servicios`;
/*!50001 DROP VIEW IF EXISTS `vw_criptomonedas_comercio_servicios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_criptomonedas_comercio_servicios` AS SELECT 
 1 AS `nombre`,
 1 AS `cant_comercio_servicios`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_criptonolegal_paises`
--

DROP TABLE IF EXISTS `vw_criptonolegal_paises`;
/*!50001 DROP VIEW IF EXISTS `vw_criptonolegal_paises`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_criptonolegal_paises` AS SELECT 
 1 AS `nombre`,
 1 AS `No Legalizado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_paises_usuarios`
--

DROP TABLE IF EXISTS `vw_paises_usuarios`;
/*!50001 DROP VIEW IF EXISTS `vw_paises_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_paises_usuarios` AS SELECT 
 1 AS `nombre`,
 1 AS `cant_usuarios`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_wallet_usuarios`
--

DROP TABLE IF EXISTS `vw_wallet_usuarios`;
/*!50001 DROP VIEW IF EXISTS `vw_wallet_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_wallet_usuarios` AS SELECT 
 1 AS `nombre`,
 1 AS `cant_usuarios`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `wallet`
--

DROP TABLE IF EXISTS `wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet` (
  `id_wallet` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `id_pais` int DEFAULT NULL,
  PRIMARY KEY (`id_wallet`),
  KEY `id_pais` (`id_pais`),
  CONSTRAINT `wallet_ibfk_1` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'cripto'
--

--
-- Dumping routines for database 'cripto'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_contar_usuarios_por_pais` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_contar_usuarios_por_pais`( pais VARCHAR(20) ) RETURNS int unsigned
    DETERMINISTIC
BEGIN
DECLARE total INT UNSIGNED; 
SET total = 
(SELECT COUNT(u.id_pais) FROM usuarios as u 
join paises as p 
on u.id_pais = p.id_pais 
WHERE p.nombre = pais ) ;
RETURN total ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_TOTAL_LETRAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_TOTAL_LETRAS`( LETRA CHAR ) RETURNS int
    DETERMINISTIC
BEGIN
DECLARE NUMERO INT;
SELECT COUNT(*) INTO NUMERO FROM USUARIOS 
WHERE PROFESION LIKE CONCAT('%', LETRA , '%');
RETURN NUMERO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insert_criptomoneda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insert_criptomoneda`(
					IN id_criptomonedaParam INT,
                    IN nombreParam VARCHAR(30), 
                    IN fecha_creacionParam DATE )
BEGIN
	INSERT INTO criptomoneda (
		id_criptomoneda,
        nombre,
        fecha_creacion
	)
	VALUES (
		id_criptomonedaParam,
		nombreParam,
		fecha_creacionParam
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ORDENAR_Usuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ORDENAR_Usuarios`(
						INOUT PARAM_ORDER VARCHAR(32),
                        INOUT PARAM_ASC_DESC VARCHAR(4))
BEGIN
SET @t1 = CONCAT('SELECT * FROM usuarios U ORDER BY',' ',PARAM_ORDER,' ',PARAM_ASC_DESC);
PREPARE param_stmt FROM @t1;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_criptolegal_paises`
--

/*!50001 DROP VIEW IF EXISTS `vw_criptolegal_paises`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_criptolegal_paises` AS select `paises`.`nombre` AS `nombre`,'Legalizado' AS `Legalizado` from `paises` where ((0 <> `paises`.`cripto_legal`) is true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_criptomonedas_comercio_servicios`
--

/*!50001 DROP VIEW IF EXISTS `vw_criptomonedas_comercio_servicios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_criptomonedas_comercio_servicios` AS select `c`.`nombre` AS `nombre`,count(`c_s`.`id_criptomoneda`) AS `cant_comercio_servicios` from (`criptomoneda` `c` join `comercio_servicio` `c_s` on((`c_s`.`id_criptomoneda` = `c`.`id_criptomoneda`))) group by `c`.`id_criptomoneda` order by `cant_comercio_servicios` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_criptonolegal_paises`
--

/*!50001 DROP VIEW IF EXISTS `vw_criptonolegal_paises`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_criptonolegal_paises` AS select `paises`.`nombre` AS `nombre`,'No Legalizado' AS `No Legalizado` from `paises` where ((0 <> `paises`.`cripto_legal`) is false) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_paises_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `vw_paises_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_paises_usuarios` AS select `p`.`nombre` AS `nombre`,count(`u`.`id_pais`) AS `cant_usuarios` from (`usuarios` `u` join `paises` `p` on((`u`.`id_pais` = `p`.`id_pais`))) group by `u`.`id_pais` order by `cant_usuarios` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_wallet_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `vw_wallet_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_wallet_usuarios` AS select `w`.`nombre` AS `nombre`,count(`u`.`id_wallet`) AS `cant_usuarios` from (`usuarios` `u` join `wallet` `w` on((`u`.`id_wallet` = `w`.`id_wallet`))) group by `u`.`id_wallet` order by `cant_usuarios` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-17 18:09:53
