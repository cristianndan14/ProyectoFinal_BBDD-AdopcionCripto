USE cripto;


-- Estado de AUTOCOMMIT y activacion/desactivacion
SHOW VARIABLES LIKE 'autocommit';
set @@autocommit = 1 ; -- Activar
set @@autocommit = 0 ; -- Desactivar


-- TABLA USUARIOS --
SELECT * FROM usuarios;

-- 1° TRANSACTION --
START TRANSACTION;

DELETE FROM usuarios WHERE id_pais = 5 ;

-- ROLLBACK ;
COMMIT ;


-- TABLA CRIPTOMONEDA
SELECT * FROM criptomoneda;

-- 2° TRANSACTION --
START TRANSACTION;

INSERT INTO criptomoneda(id_criptomoneda , nombre , fecha_creacion) VALUE( 16 , 'CHAINLINK' , '2019-04-08');
INSERT INTO criptomoneda(id_criptomoneda , nombre , fecha_creacion) VALUE( 17 , 'LITECOIN' , '2017-10-05');
INSERT INTO criptomoneda(id_criptomoneda , nombre , fecha_creacion) VALUE( 18 , 'VET' , '2018-05-22');
INSERT INTO criptomoneda(id_criptomoneda , nombre , fecha_creacion) VALUE( 19 , 'FTX' , '2017-07-11');
savepoint lote_1;
INSERT INTO criptomoneda(id_criptomoneda , nombre , fecha_creacion) VALUE( 20 , 'NEAR' , '2019-08-11');
INSERT INTO criptomoneda(id_criptomoneda , nombre , fecha_creacion) VALUE( 21 , 'XMR' , '2017-06-14');
INSERT INTO criptomoneda(id_criptomoneda , nombre , fecha_creacion) VALUE( 22 , 'BAT' , '2018-02-22');
INSERT INTO criptomoneda(id_criptomoneda , nombre , fecha_creacion) VALUE( 23 , 'MANA' , '2017-09-11');
savepoint lote_2;

-- release savepoint lote_1;




