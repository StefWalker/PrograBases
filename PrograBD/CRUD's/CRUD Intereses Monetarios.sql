-- CRUD  Concepto Intereses Monetarios
-- Creacion de tabla Intereses Monetarios

USE [ProyectoBases]

BEGIN
DROP TABLE Intereses_Monetarios 
END
GO
BEGIN
	CREATE TABLE Intereses_Monetarios
	(
	  ID_IM INT PRIMARY KEY REFERENCES ConceptoCobro(ID_CC) NOT NULL,
	  Monto Decimal NOT NULL
	);
END

-- Insert en tabla Intereses Monetarios
IF OBJECT_ID('InteresesInsert') IS NOT NULL
BEGIN 
DROP PROC InteresesInsert 
END
GO
CREATE PROCEDURE InteresesInsert
	 @inID_IM INT,
	 @inMonto Decimal
AS
BEGIN TRY
INSERT INTO Intereses_Monetarios(
	 ID_IM,
	 Monto)
	 VALUES(
	 @inID_IM,
	 @inMonto)
	 return 1
END TRY
BEGIN CATCH
	RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

-- Read en tabla Intereses Monetarios
IF OBJECT_ID('InteresesRead') IS NOT NULL
BEGIN 
    DROP PROC InteresesRead
END 
GO
CREATE PROC InteresesRead
	@inID_IM int
AS 
BEGIN TRY
    SELECT ID_IM, Monto
    FROM   Intereses_Monetarios
    WHERE  (ID_IM = @inID_IM)
	return 1
END TRY
BEGIN CATCH
	RAISERROR('Error en la datos no validos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

-- Update en tabla Intereses Monetarios
IF OBJECT_ID('InteresesUpdate') IS NOT NULL
BEGIN 
DROP PROC InteresesUpdate
END 
GO
CREATE PROC InteresesUpdate
	 @inID_IM int,
	 @inMonto Decimal
AS 
BEGIN TRY
UPDATE Intereses_Monetarios
SET  Monto = @inMonto
WHERE  (ID_IM = @inID_IM)
return 1
END TRY
BEGIN CATCH
	RAISERROR('Error en la actualizacion de datos fallida', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

-- Delete en tabla Intereses Monetarios
IF OBJECT_ID('InteresesDelete') IS NOT NULL
BEGIN 
DROP PROC InteresesDelete
END 
GO
CREATE PROC InteresesDelete 
    @inID_IM int
AS 
BEGIN TRY
DELETE
FROM   Intereses_Monetarios
WHERE  ID_IM = @inID_IM
return 1
END TRY
BEGIN CATCH
	RAISERROR('Error en la eliminacion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO
