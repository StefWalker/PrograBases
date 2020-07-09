
-- CRUD  Concepto Cobro Porcentual
-- Creacion de tabla Concepto Cobro Porcentual

USE [ProyectoBases]

BEGIN
DROP TABLE CC_Porcentual 
END
GO
BEGIN
	CREATE TABLE CC_Porcentual
	(
	  ID_Por INT PRIMARY KEY REFERENCES ConceptoCobro(ID_CC) NOT NULL,
	  Porcentaje INT NOT NULL
	);
END

-- Insert en tabla Concepto Cobro Porcentual
IF OBJECT_ID('CCPorcentualInsert') IS NOT NULL
BEGIN 
DROP PROC CCPorcentualInsert 
END
GO
CREATE PROCEDURE CCPorcentualInsert
	 @ID_Por INT,
	 @Porcentaje INT
AS
BEGIN TRY
INSERT INTO CC_Porcentual(
	 ID_Por,
	 Porcentaje)
	 VALUES(
	 @ID_Por,
	 @Porcentaje)
END TRY
BEGIN CATCH
	RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO

-- Read en tabla Concepto Cobro Porcentual
IF OBJECT_ID('CCPorcentualRead') IS NOT NULL
BEGIN 
    DROP PROC CCPorcentualRead
END 
GO
CREATE PROC CCPorcentualRead
	@ID_Por int
AS 
BEGIN TRY
    SELECT ID_Por, Porcentaje
    FROM   CC_Porcentual  
    WHERE  (ID_Por = @ID_Por) 
END TRY 
BEGIN CATCH
	RAISERROR('Error en la datos no validos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO

-- Update en tabla Concepto Cobro Porcentual
IF OBJECT_ID('CCPorcentualUpdate') IS NOT NULL
BEGIN 
DROP PROC CCPorcentualUpdate
END 
GO
CREATE PROC CCPorcentualUpdate
	 @ID_Por int,
	 @Porcentaje INT
AS 
BEGIN TRY
UPDATE CC_Porcentual
SET Porcentaje = @Porcentaje
WHERE  (ID_Por = @ID_Por)
END TRY
BEGIN CATCH
	RAISERROR('Error en la actualizacion de datos fallida', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO

-- Delete en tabla Concepto Cobro Porcentual
IF OBJECT_ID('CCPorcentualDelete') IS NOT NULL
BEGIN 
DROP PROC CCPorcentualDelete
END 
GO
CREATE PROC CCPorcentualDelete 
    @ID_Por int
AS 
BEGIN TRY
DELETE
FROM   CC_Porcentual
WHERE  ID_Por = @ID_Por
END TRY 
BEGIN CATCH
	RAISERROR('Error en la eliminacion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO