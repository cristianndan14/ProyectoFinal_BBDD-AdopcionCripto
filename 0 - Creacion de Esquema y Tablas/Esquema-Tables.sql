CREATE SCHEMA IF NOT EXISTS CRIPTO ;

USE CRIPTO ;

-- Describe la fecha de creacion de cada criptomoneda.
CREATE TABLE `criptomoneda` (
  `id_criptomoneda` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `fecha_creacion` date NOT NULL,
  PRIMARY KEY (`id_criptomoneda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
;

-- Describe datos básicos de un pais con respecto a la adopción.
CREATE TABLE `paises` (
  `id_pais` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `habitantes` int NOT NULL,
  `cripto_legal` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
;

-- Wallet de diferentes paises demuestran el nivel de adopcion de los usuarios.
CREATE TABLE `wallet` (
  `id_wallet` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `id_pais` int DEFAULT NULL,
  PRIMARY KEY (`id_wallet`),
  KEY `id_pais` (`id_pais`),
  CONSTRAINT `wallet_ibfk_1` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
;

-- Comercio/servicios que aceptan transferencias de criptomonedas por bienes/servicios.
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
;

-- Usuarios que adoptan cripto como medio de pago o ahorro, mediante una wallet.
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
;

-- Tabla de auditoria cripto.usuarios INSERT
CREATE TABLE `log_auditoria_usuarios` (
  `ID_LOG` int NOT NULL AUTO_INCREMENT,
  `NOMBRE_DE_ACCION` varchar(10) DEFAULT NULL,
  `NOMBRE_TABLA` varchar(50) DEFAULT NULL,
  `USUARIO` varchar(100) DEFAULT NULL,
  `DMLFECHA_UPD_INS_DEL` date DEFAULT NULL,
  `DMLHORA_UPD_INS_DEL` time DEFAULT NULL,
  PRIMARY KEY (`ID_LOG`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
;

-- Tabla de auditoria cripto.usuarios UPDATE
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
;

-- Tabla de auditoria cripto.comercio_servicio INSERT
CREATE TABLE `log_auditoria_comercio_servicio` (
  `ID_LOG` int NOT NULL AUTO_INCREMENT,
  `NOMBRE_DE_ACCION` varchar(10) DEFAULT NULL,
  `NOMBRE_TABLA` varchar(50) DEFAULT NULL,
  `USUARIO` varchar(100) DEFAULT NULL,
  `DMLFECHA_UPD_INS_DEL` date DEFAULT NULL,
  `DMLHORA_UPD_INS_DEL` time DEFAULT NULL,
  PRIMARY KEY (`ID_LOG`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
;

-- Tabla de auditoria cripto.comercio_servicio DELETE
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
;
