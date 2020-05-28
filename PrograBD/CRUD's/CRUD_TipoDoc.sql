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

-- Insert en tabla TipoDoc 
IF OBJECT_ID('TipoDocInsert') IS NOT NULL
BEGIN 
DROP PROC TipoDocInsert
END
GO
CREATE PROCEDURE TipoDocInsert
	  @TipoDoc INT,
	  @Tipo Varchar (100)
AS
BEGIN
INSERT INTO TipoDoc(TipoDoc,
					Tipo)
    VALUES (@TipoDoc,
			@Tipo)
END

-- Read de tabla TipoDoc 
IF OBJECT_ID('TipoDocRead') IS NOT NULL
BEGIN 
    DROP PROC TipoDocRead
END 
GO
CREATE PROC TipoDocRead
	@TipoDoc INT,
    @ID_TDoc int
AS 
BEGIN 
    SELECT ID_TDoc, TipoDoc, Tipo
	FROM   TipoDoc
    WHERE  (ID_TDoc = @ID_TDoc) 
END
GO

-- Update de tabla TipoDoc 
IF OBJECT_ID('TipoDocUpdate') IS NOT NULL
BEGIN 
DROP PROC TipoDocUpdate
END 
GO
CREATE PROC TipoDocUpdate
	 @TipoDoc INT,
	 @ID_TDoc INT,
	 @Tipo Varchar (100) 
AS 
BEGIN 
UPDATE TipoDoc
SET  Tipo= @Tipo, TipoDoc = @TipoDoc
WHERE  (ID_TDoc = @ID_TDoc)
END
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
BEGIN 
DELETE
FROM  TipoDoc 
WHERE  ID_TDoc= @ID_TDoc
 
END
GO
