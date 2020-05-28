
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
		 Valor MONEY NOT NULL,
		 Descripción VARCHAR(250) NOT NULL,
		 Direccion VARCHAR(250) NOT NULL,
		 Fecha_Creacion DATE NOT NULL,
		 Activo BIT NOT NULL
);
END

-- Insert en tabla propiedad
IF OBJECT_ID('PropiedadInsert') IS NOT NULL
BEGIN 
DROP PROC PropiedadInsert 
END
GO
CREATE PROCEDURE PropiedadInsert
	  @NumPropiedad INT,
	  @Valor MONEY,
	  @Descripción VARCHAR(250),
	  @Direccion VARCHAR(250),
	  @Fecha_Creacion DATE
	 
AS
BEGIN
INSERT INTO Propiedad(
	   NumPropiedad,
	   Valor,
	   Descripción,
	   Direccion,
	   Fecha_Creacion,
	   Activo)
    VALUES (
	   @NumPropiedad,
	   @Valor,
	   @Descripción,
	   @Direccion,
	   @Fecha_Creacion,
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
    SELECT ID_Propiedad, NumPropiedad, Valor, Descripción, Direccion, Fecha_Creacion
    FROM   Propiedad  
    WHERE  (ID_Propiedad = @ID_Propiedad) 
END
GO

-- Update de tabla propiedad
IF OBJECT_ID('PropiedadUpdate') IS NOT NULL
BEGIN 
DROP PROC PropiedadUpdate
END 
GO
CREATE PROC PropiedadUpdate
	 @ID_Propiedad INT,
	 @NumPropiedad INT,
	 @Valor MONEY,
	 @Descripción VARCHAR(250),
	 @Direccion VARCHAR(250),
	 @Fecha_Creacion DATE
  
AS 
BEGIN 
UPDATE Propiedad
SET  NumPropiedad = @NumPropiedad,
	 Valor = @Valor,
	 Descripción	= @Descripción,
	 Direccion = @Direccion,
	 Fecha_Creacion = @Fecha_Creacion
WHERE  (ID_Propiedad = @ID_Propiedad)
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