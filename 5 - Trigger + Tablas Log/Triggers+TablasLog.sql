USE cripto ;


/*-------------------------- TABLA LOG DE USUARIOS -------------------------------------*/

drop table if exists LOG_AUDITORIA_USUARIOS;
CREATE TABLE IF NOT EXISTS LOG_AUDITORIA_USUARIOS
(
ID_LOG INT AUTO_INCREMENT ,
NOMBRE_DE_ACCION VARCHAR(10) ,
NOMBRE_TABLA VARCHAR(50) ,
USUARIO VARCHAR(100) ,
DMLFECHA_UPD_INS_DEL DATE ,
DMLHORA_UPD_INS_DEL TIME ,
PRIMARY KEY (ID_LOG)
);


drop table if exists LOG_AUDITORIA_USUARIOS_2;
CREATE TABLE IF NOT EXISTS LOG_AUDITORIA_USUARIOS_2
(
ID_LOG INT AUTO_INCREMENT ,
PROFESION VARCHAR(100) DEFAULT NULL ,
ID_USUARIO INT NOT NULL,
NOMBRE_DE_ACCION VARCHAR(10) ,
NOMBRE_TABLA VARCHAR(50) ,
USUARIO VARCHAR(100) ,
DMLFECHA_UPD_INS_DEL DATE ,
DMLHORA_UPD_INS_DEL TIME ,
PRIMARY KEY (ID_LOG)
);


-- AFTER INSERT USUARIOS >>>>>> Ingresar nuevos usuarios a la tabla usuarios.
DROP TRIGGER IF EXISTS TRG_LOG_USUARIOS ;
DELIMITER //
CREATE TRIGGER TRG_LOG_USUARIOS 
AFTER INSERT 
ON CRIPTO.USUARIOS
FOR EACH ROW
BEGIN
	INSERT INTO LOG_AUDITORIA_USUARIOS (NOMBRE_DE_ACCION , NOMBRE_TABLA , USUARIO, DMLFECHA_UPD_INS_DEL , DMLHORA_UPD_INS_DEL ) 
				VALUES ( 'INSERT' , 'USUARIOS' , CURRENT_USER() , CURRENT_DATE() , CURRENT_TIME() );
END
//DELIMITER ;



INSERT INTO USUARIOS (id_usuario , profesion , fecha_nacimiento , id_pais , id_criptomoneda , id_wallet) 
		VALUES ( 7 , 'Contador' , '2000-05-09' , 1 , 1 , 2 );
SELECT * FROM LOG_AUDITORIA_USUARIOS;



-- BEFORE UPDATE USUARIOS >>> Cambiar profesion del usuario.
DROP TRIGGER IF EXISTS TRG_LOG_USUARIOS_2 ;
DELIMITER //
CREATE TRIGGER TRG_LOG_USUARIOS_2 
BEFORE UPDATE 
ON CRIPTO.USUARIOS
FOR EACH ROW
BEGIN
	INSERT INTO LOG_AUDITORIA_USUARIOS_2 ( PROFESION , ID_USUARIO, NOMBRE_DE_ACCION , NOMBRE_TABLA , USUARIO , DMLFECHA_UPD_INS_DEL , DMLHORA_UPD_INS_DEL)
				VALUES ( CONCAT('REG ANTERIOR: ' , OLD.PROFESION , ' -- REG ACTUAL: ' , NEW.PROFESION) , NEW.ID_USUARIO , 'UPDATE' , 'USUARIOS' , CURRENT_USER() , CURRENT_DATE() , CURRENT_TIME() );
END
//DELIMITER ;


UPDATE CRIPTO.USUARIOS SET PROFESION = 'TRADER' WHERE ID_USUARIO = 18 ;
SELECT * FROM LOG_AUDITORIA_USUARIOS_2 ;





/*-------------------------- TABLA LOG DE COMERCIO_SERVICIO -------------------------------------*/

drop table if exists LOG_AUDITORIA_COMERCIO_SERVICIO;
CREATE TABLE IF NOT EXISTS LOG_AUDITORIA_COMERCIO_SERVICIO
(
ID_LOG INT AUTO_INCREMENT ,
NOMBRE_DE_ACCION VARCHAR(10) ,
NOMBRE_TABLA VARCHAR(50) ,
USUARIO VARCHAR(100) ,
DMLFECHA_UPD_INS_DEL DATE ,
DMLHORA_UPD_INS_DEL TIME ,
PRIMARY KEY (ID_LOG)
);


drop table if exists LOG_AUDITORIA_COMERCIO_SERVICIO_2;
CREATE TABLE IF NOT EXISTS LOG_AUDITORIA_COMERCIO_SERVICIO_2
(
ID_LOG INT AUTO_INCREMENT ,
NOMBRE VARCHAR(100) DEFAULT NULL ,
ID_COMERCIO_SERVICIO INT NOT NULL,
NOMBRE_DE_ACCION VARCHAR(10) ,
NOMBRE_TABLA VARCHAR(50) ,
USUARIO VARCHAR(100) ,
DMLFECHA_UPD_INS_DEL DATE ,
DMLHORA_UPD_INS_DEL TIME ,
PRIMARY KEY (ID_LOG)
);


-- AFTER INSERT COMERCIO O SERVICIO >>>>>> Ingresar nuevos comercios o servicios a la tabla comercio_servicio.
DROP TRIGGER IF EXISTS TRG_LOG_COMERCIO_SERVICIO ;
DELIMITER //
CREATE TRIGGER TRG_LOG_COMERCIO_SERVICIO
AFTER INSERT 
ON CRIPTO.COMERCIO_SERVICIO
FOR EACH ROW
BEGIN
	INSERT INTO LOG_AUDITORIA_COMERCIO_SERVICIO (NOMBRE_DE_ACCION , NOMBRE_TABLA , USUARIO, DMLFECHA_UPD_INS_DEL , DMLHORA_UPD_INS_DEL ) 
						VALUES ( 'INSERT' , 'COMERCIO_SERVICIO' , CURRENT_USER() , CURRENT_DATE() , CURRENT_TIME() );
END
//DELIMITER ;



INSERT INTO COMERCIO_SERVICIO (id_COMERCIO_SERVICIO , nombre , rubro , descripcion , id_pais , id_criptomoneda , id_wallet) 
			VALUES ( 2 , 'Los pollos hermanos' , 'FastFood' , 'Cadena de comida r??pida' , 1 , 1 , 2 );
SELECT * FROM LOG_AUDITORIA_COMERCIO_SERVICIO;



-- BEFORE DELETE COMERCIO O SERVICIO >>>>>> Registro de eliminacion de comercio o servicios de la tabla comercio_servicio.
DROP TRIGGER IF EXISTS TRG_LOG_COMERCIO_SERVICIO_2 ;
DELIMITER //
CREATE TRIGGER TRG_LOG_COMERCIO_SERVICIO_2
BEFORE DELETE 
ON CRIPTO.COMERCIO_SERVICIO
FOR EACH ROW
BEGIN
	INSERT INTO LOG_AUDITORIA_COMERCIO_SERVICIO_2 (NOMBRE , ID_COMERCIO_SERVICIO , NOMBRE_DE_ACCION , NOMBRE_TABLA , USUARIO , DMLFECHA_UPD_INS_DEL , DMLHORA_UPD_INS_DEL)
					VALUES ( OLD.NOMBRE , OLD.ID_COMERCIO_SERVICIO , 'DELETE' , 'COMERCIO_SERVICIO' , CURRENT_USER() , CURRENT_DATE() , CURRENT_TIME() );
END
//DELIMITER ;
                        
SELECT * FROM LOG_AUDITORIA_COMERCIO_SERVICIO_2 ;
SELECT * FROM CRIPTO.COMERCIO_SERVICIO WHERE ID_COMERCIO_SERVICIO = 22 ;
DELETE FROM CRIPTO.COMERCIO_SERVICIO WHERE ID_COMERCIO_SERVICIO = 22  ;
