
-- CRUD  Propiedad
-- Creacion de tabla propiedad

USE [ProyectoBases]

BEGIN
DROP TABLE Propiedad 
END
GO
BEGIN
	CREATE TABLE Propiedad
	(
		 ID_Propiedad INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		 NumPropiedad INT NOT NULL,
		 Valor INT NOT NULL,
		 Direccion VARCHAR(250) NOT NULL,
		 Activo BIT NOT NULL DEFAULT 1,
		 Fecha DATE NOT NULL DEFAULT GETDATE(),
		 M3Acumulados INT NOT NULL DEFAULT 0,
		 M3AcumuladosUltimoRecibo INT NOT NULL DEFAULT 0
);
END
USE [ProyectoBases]
-- Insert en tabla propiedad
IF OBJECT_ID('PropiedadInsert') IS NOT NULL
BEGIN 
DROP PROC PropiedadInsert 
END
GO
CREATE PROCEDURE PropiedadInsert
	  @inNumPropiedad INT,
	  @inValor INT,
	  @inDescripción VARCHAR(250),
	  @inDireccion VARCHAR(250)
	 
AS
BEGIN TRY
INSERT INTO Propiedad(
	   NumPropiedad,
	   Valor,
	   Direccion,
	   Activo)
    VALUES (
	   @inNumPropiedad,
	   convert(varchar,cast(@inValor as money),1),
	   @inDireccion,
	   1)
END TRY 
BEGIN CATCH
	RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO


-- Read de tabla propiedad
IF OBJECT_ID('PropiedadRead') IS NOT NULL
BEGIN 
    DROP PROC PropiedadRead
END 
GO
CREATE PROC PropiedadRead
    @inID_Propiedad int
AS 
BEGIN TRY
    SELECT ID_Propiedad, NumPropiedad, Valor, Direccion
    FROM   Propiedad  
    WHERE  (ID_Propiedad = @inID_Propiedad  AND Activo = 1) 
END TRY 
BEGIN CATCH
	RAISERROR('Error en la datos no validos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO

-- Update de tabla propiedad
IF OBJECT_ID('PropiedadUpdateB') IS NOT NULL
BEGIN 
DROP PROC PropiedadUpdateB
END 
GO
CREATE PROC PropiedadUpdateB
	 @inNumPropiedad INT,
	 @inNewNumPropiedad INT,
	 @inValor INT,
	 @inDireccion VARCHAR(250)
AS 
BEGIN TRY
IF(@inNewNumPropiedad = '')
BEGIN
	SET @inNewNumPropiedad = (SELECT NumPropiedad FROM Propiedad WHERE NumPropiedad = @inNumPropiedad)
END
IF(@inValor = '')
BEGIN
	SET @inValor = (SELECT Valor FROM Propiedad WHERE NumPropiedad = @inNumPropiedad)
END
IF(@inDireccion = '')
BEGIN
	SET @inDireccion = (SELECT Direccion FROM Propiedad WHERE NumPropiedad = @inNumPropiedad)
END
UPDATE Propiedad
SET  NumPropiedad = @inNewNumPropiedad,
	 Valor = cast(@inValor as money),
	 Direccion = @inDireccion
WHERE  (NumPropiedad = @inNumPropiedad)
END TRY
BEGIN CATCH
	RAISERROR('Error en la actualizacion de datos fallida', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO

-- Delete de tabla propiedad
IF OBJECT_ID('PropiedadDelete') IS NOT NULL
BEGIN 
DROP PROC PropiedadDelete
END 
GO
CREATE PROC PropiedadDelete 
    @inID_Propiedad int
AS 
BEGIN TRY
DELETE
FROM   Propiedad
WHERE  ID_Propiedad = @inID_Propiedad
END TRY 
BEGIN CATCH
	RAISERROR('Error en la eliminacion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO

------------------------Procedimientos extras --------------------------
-- Realiza un search por medio del numero de propiedad
IF OBJECT_ID('PropiedadSearch') IS NOT NULL
BEGIN 
DROP PROC PropiedadSearch
END 
GO
CREATE PROC PropiedadSearch
    @inNumPropiedad INT
AS 
BEGIN TRY
    SELECT NumPropiedad, convert(varchar,cast(Valor as int),1), Direccion
	FROM   Propiedad
    WHERE  (NumPropiedad = @inNumPropiedad AND Activo = 1) 
END TRY 
BEGIN CATCH
	RAISERROR('Error en la datos no validos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO


-- Delete de tabla propiedad por numero de propiedad
IF OBJECT_ID('PropiedadDeleteByNum') IS NOT NULL
BEGIN 
DROP PROC PropiedadDeleteByNum
END 
GO
CREATE PROC PropiedadDeleteByNum 
    @inNumPropiedad int
AS 
BEGIN TRY
UPDATE Propiedad
SET	Activo = 0
WHERE  NumPropiedad = @inNumPropiedad
END TRY 
BEGIN CATCH
	RAISERROR('Error en la eliminacion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO
