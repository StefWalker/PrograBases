-- CRUD  TipoDoc 
-- Creacion de tabla TipoDoc  

USE [ProyectoBases]

BEGIN
DROP TABLE TipoDoc
END
GO
BEGIN
	CREATE TABLE TipoDoc 
	(
		ID_TDoc INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		TipoDoc INT NOT NULL,
		Tipo VARCHAR(100) NOT NULL
	);
END

--Insert en tabla TipoDoc 
IF OBJECT_ID('TipoDocInsert') IS NOT NULL
BEGIN 
DROP PROC TipoDocInsert
END
GO
CREATE PROCEDURE TipoDocInsert
	  @inTipoDoc INT,
	  @inTipo Varchar (100)
AS
BEGIN TRY
INSERT INTO TipoDoc(TipoDoc,
					Tipo)
    VALUES (@inTipoDoc,
			@inTipo)
			return 1
END TRY
BEGIN CATCH
	RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

-- Read de tabla TipoDoc 
IF OBJECT_ID('TipoDocRead') IS NOT NULL
BEGIN 
    DROP PROC TipoDocRead
END 
GO
CREATE PROC TipoDocRead
	@inID_TDoc int
AS 
BEGIN TRY
    SELECT ID_TDoc, TipoDoc, Tipo
	FROM   TipoDoc
    WHERE  (ID_TDoc = @inID_TDoc) 
	return 1
END TRY
BEGIN CATCH
	RAISERROR('Error en la datos no validos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

-- Update de tabla TipoDoc 
IF OBJECT_ID('TipoDocUpdate') IS NOT NULL
BEGIN 
DROP PROC TipoDocUpdate
END 
GO
CREATE PROC TipoDocUpdate
	 @inTipoDoc INT,
	 @inID_TDoc INT,
	 @inTipo Varchar (100) 
AS 
BEGIN TRY
UPDATE TipoDoc
SET  Tipo= @inTipo, TipoDoc = @inTipoDoc
WHERE  (ID_TDoc = @inID_TDoc)
return 1
END TRY
BEGIN CATCH
	RAISERROR('Error en la actualizacion de datos fallida', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

-- Delete de tabla TipoDoc
IF OBJECT_ID('TipoDocDelete') IS NOT NULL
BEGIN 
DROP PROC TipoDocDelete 
END 
GO
CREATE PROC TipoDocDelete
    @ID_TDoc int
AS 
BEGIN TRY
DELETE
FROM  TipoDoc 
return 1
END TRY
BEGIN CATCH
	RAISERROR('Error en la eliminacion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

-------------------------Procedimientos extras-----------------------------
-- Search Tipo Documento
IF OBJECT_ID('TipoDocSearch') IS NOT NULL
BEGIN 
DROP PROC TipoDocSearch
END 
GO
CREATE PROC TipoDocSearch
    @inTipoDoc INT
AS 
BEGIN TRY
    SELECT ID_TDoc, TipoDoc, Tipo
	FROM   TipoDoc
    WHERE  (TipoDoc = @inTipoDoc) 
	return 1
END TRY
BEGIN CATCH
	RAISERROR('Error en la datos no validos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO