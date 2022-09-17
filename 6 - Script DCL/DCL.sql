use mysql;

-- TABLA DE USUARIOS
select * from user ;

-- CREACION DE USUARIOS
-- Usuario invitado
CREATE USER IF NOT EXISTS 'invitado'@'localhost' identified by 'invitado123' ;
-- Usuario admin
CREATE USER IF NOT EXISTS 'admin'@'localhost' identified by 'admin123' ;
-- Usuario superadmin
CREATE USER IF NOT EXISTS 'superadmin'@'localhost' identified by 'superadmin123' ;

-- PERMISOS
-- Lectura de tablas
GRANT SELECT ON cripto.* to 'invitado'@'localhost' ;
-- Lectura de tablas. Inserción y modificación de datos
GRANT SELECT, INSERT, UPDATE ON cripto.* to 'admin'@'localhost' ;
-- Creacion, lectura y eliminación de tablas. Inserción, modificación y eliminación de datos
GRANT CREATE , DROP, SELECT, INSERT, UPDATE , DELETE ON cripto.* to 'superadmin'@'localhost' ;

-- PERMISOS DETALLADOS
SHOW GRANTS FOR 'invitado'@'localhost' ;
SHOW GRANTS FOR 'admin'@'localhost' ;
SHOW GRANTS FOR 'superadmin'@'localhost' ;
