
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
		 Fecha DATE NOT NULL DEFAULT GETDATE()
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
	  @NumPropiedad INT,
	  @Valor INT,
	  @Descripción VARCHAR(250),
	  @Direccion VARCHAR(250)
	 
AS
BEGIN TRY
INSERT INTO Propiedad(
	   NumPropiedad,
	   Valor,
	   Direccion,
	   Activo)
    VALUES (
	   @NumPropiedad,
	   convert(varchar,cast(@Valor as money),1),
	   @Direccion,
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
    @ID_Propiedad int
AS 
BEGIN TRY
    SELECT ID_Propiedad, NumPropiedad, Valor, Direccion
    FROM   Propiedad  
    WHERE  (ID_Propiedad = @ID_Propiedad  AND Activo = 1) 
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
	 @NumPropiedad INT,
	 @NewNumPropiedad INT,
	 @Valor INT,
	 @Direccion VARCHAR(250)
AS 
BEGIN TRY
IF(@NewNumPropiedad = '')
BEGIN
	SET @NewNumPropiedad = (SELECT NumPropiedad FROM Propiedad WHERE NumPropiedad = @NumPropiedad)
END
IF(@Valor = '')
BEGIN
	SET @Valor = (SELECT Valor FROM Propiedad WHERE NumPropiedad = @NumPropiedad)
END
IF(@Direccion = '')
BEGIN
	SET @Direccion = (SELECT Direccion FROM Propiedad WHERE NumPropiedad = @NumPropiedad)
END
UPDATE Propiedad
SET  NumPropiedad = @NewNumPropiedad,
	 Valor = cast(@Valor as money),
	 Direccion = @Direccion
WHERE  (NumPropiedad = @NumPropiedad)
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
    @ID_Propiedad int
AS 
BEGIN TRY
DELETE
FROM   Propiedad
WHERE  ID_Propiedad = @ID_Propiedad
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
    @NumPropiedad INT
AS 
BEGIN TRY
    SELECT NumPropiedad, convert(varchar,cast(Valor as int),1), Direccion
	FROM   Propiedad
    WHERE  (NumPropiedad = @NumPropiedad AND Activo = 1) 
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
    @NumPropiedad int
AS 
BEGIN TRY
UPDATE Propiedad
SET	Activo = 0
WHERE  NumPropiedad = @NumPropiedad
END TRY 
BEGIN CATCH
	RAISERROR('Error en la eliminacion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO
