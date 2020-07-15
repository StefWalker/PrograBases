
-- CRUD  Concepto Cobro Fijo
-- Creacion de tabla Concepto Cobro Fijo

USE [ProyectoBases]

BEGIN
DROP TABLE CC_Fijo 
END
GO
BEGIN
	CREATE TABLE CC_Fijo
	(
	  ID_Fijo INT PRIMARY KEY REFERENCES ConceptoCobro(ID_CC) NOT NULL,
	  Monto Money NOT NULL
	);
END


USE [ProyectoBases]
-- Insert en tabla Concepto Cobro Fijo
IF OBJECT_ID('CCFijoInsert') IS NOT NULL
BEGIN 
DROP PROC CCFijoInsert 
END
GO
CREATE PROCEDURE CCFijoInsert
	 @inID_Fijo INT,
	 @inMonto Money
AS
BEGIN TRY
INSERT INTO CC_Fijo(
	 ID_Fijo,
	 Monto)
	 VALUES(
	 @inID_Fijo,
	 @inMonto)
	 return 1
END TRY
BEGIN CATCH
	RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

-- Read en tabla Concepto Cobro Fijo
IF OBJECT_ID('CCFijoRead') IS NOT NULL
BEGIN 
    DROP PROC CCFijoRead
END 
GO
CREATE PROC CCFijoRead
	@inID_Fijo int
AS 
BEGIN TRY
    SELECT ID_Fijo, Monto
    FROM   CC_Fijo  
    WHERE  (ID_Fijo = @inID_Fijo) 
	return 1
END TRY
BEGIN CATCH
	RAISERROR('Error en la datos no validos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

-- Update en tabla Concepto Cobro Fijo
IF OBJECT_ID('CCFijoUpdate') IS NOT NULL
BEGIN 
DROP PROC CCFijoUpdate
END 
GO
CREATE PROC CCFijoUpdate
	 @inID_Fijo int,
	 @inMonto Money
AS 
BEGIN TRY
UPDATE CC_Fijo
SET  Monto = @inMonto
WHERE  (ID_Fijo = @inID_Fijo)
return 1
END TRY
BEGIN CATCH
	RAISERROR('Error en la actualizacion de datos fallida', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

-- Delete en tabla Concepto Cobro Fijo
IF OBJECT_ID('CCFijoDelete') IS NOT NULL
BEGIN 
DROP PROC CCFijoDelete
END 
GO
CREATE PROC CCFijoDelete 
    @inID_Fijo int
AS 
BEGIN TRY
DELETE
FROM   CC_Fijo
WHERE  ID_Fijo = @inID_Fijo
return 1 
END TRY
BEGIN CATCH
	RAISERROR('Error en la eliminacion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO