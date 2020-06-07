
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
		 Activo BIT NOT NULL
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
BEGIN
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
END

-- Read de tabla propiedad
IF OBJECT_ID('PropiedadRead') IS NOT NULL
BEGIN 
    DROP PROC PropiedadRead
END 
GO
CREATE PROC PropiedadRead
    @ID_Propiedad int
AS 
BEGIN 
    SELECT ID_Propiedad, NumPropiedad, Valor, Direccion
    FROM   Propiedad  
    WHERE  (ID_Propiedad = @ID_Propiedad  AND Activo = 1) 
END
GO

-- Update de tabla propiedad
IF OBJECT_ID('PropiedadUpdate') IS NOT NULL
BEGIN 
DROP PROC PropiedadUpdate
END 
GO
CREATE PROC PropiedadUpdate
	
	 @NumPropiedad INT,
	 @NewNumPropiedad INT,
	 @Valor INT,
	 @Direccion VARCHAR(250)
AS 
BEGIN 
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
	 Valor = @Valor,
	 Direccion = @Direccion
WHERE  (NumPropiedad = @NumPropiedad AND Activo = 1)
END
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
BEGIN 
DELETE
FROM   Propiedad
WHERE  ID_Propiedad = @ID_Propiedad
END
GO