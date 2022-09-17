USE cripto ;

-- ordenar usuarios segun campo
drop procedure if exists SP_ORDENAR_Usuarios ;
DELIMITER //
CREATE PROCEDURE `SP_ORDENAR_Usuarios`(
						INOUT PARAM_ORDER VARCHAR(32),
                        INOUT PARAM_ASC_DESC VARCHAR(4))
BEGIN
SET @t1 = CONCAT('SELECT * FROM usuarios U ORDER BY',' ',PARAM_ORDER,' ',PARAM_ASC_DESC);
PREPARE param_stmt FROM @t1;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;
END //
DELIMITER ;

SET @PARAM_ORDER = 'fecha_nacimiento'; -- colocar campo
SET @PARAM_ASC_DESC = 'DESC'; -- colocar orden ASC o DESC
CALL SP_ORDENAR (@PARAM_ORDER ,@PARAM_ASC_DESC);


-- Insertar nuevos registros de criptomonedas.
drop procedure if exists SP_insert_criptomoneda ;
DELIMITER //
CREATE PROCEDURE `SP_insert_criptomoneda`(
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
END//
DELIMITER ;

CALL SP_insert_criptomoneda( 50 , 'CHZ' , '2017-12-18' ); -- Colocamos los datos correspondientes a ingresar
SELECT * FROM CRIPTOMONEDA ;



