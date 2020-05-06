-- CRUD  Propietario
-- Creacion de tabla rpropietario 

USE [ProyectoBases]

BEGIN
DROP TABLE Propietario
END
GO
BEGIN
	CREATE TABLE Propietario 
	(
	  ID_Propietario INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	  Identificacion INT NOT NULL,
      Nombre VARCHAR(100) NOT NULL
	);
END

-- Insert en tabla propietario 
IF OBJECT_ID('InsertPropietario') IS NOT NULL
BEGIN 
DROP PROC InsertPropietario
END
GO
CREATE PROCEDURE InsertPropietario
	  @Identificacion INT,
	  @Nombre VARCHAR (100)
	 
AS
BEGIN
INSERT INTO Propietario(
	   Identificacion,
	   Nombre)
    VALUES (
	   @Identificacion,
	   @Nombre)
END

-- Read de tabla propietario 
IF OBJECT_ID('ReadPropietario') IS NOT NULL
BEGIN 
    DROP PROC ReadPropietario
END 
GO
CREATE PROC ReadPropietario
    @ID_Propietario int
AS 
BEGIN 
    SELECT ID_Propietario,Identificacion,Nombre 
    FROM   Propietario
    WHERE  (ID_Propietario = @ID_Propietario) 
END
GO

-- Update de tabla propietario 
IF OBJECT_ID('PropietarioUpdate') IS NOT NULL
BEGIN 
DROP PROC PropietarioUpdate
END 
GO
CREATE PROC PropietarioUpdate
	 @ID_Propietario INT,
	 @Identificacion INT,
	 @Nombre VARCHAR (100)
AS 
BEGIN 
UPDATE Propietario
SET  Identificacion= @Identificacion,
	 Nombre = @Nombre
WHERE  (ID_Propietario = @ID_Propietario)
END
GO

-- Delete de tabla propietario
IF OBJECT_ID('PropietarioDelete') IS NOT NULL
BEGIN 
DROP PROC PropietarioDelete
END 
GO
CREATE PROC PropietarioDelete 
    @ID_Propietario int
AS 
BEGIN 
DELETE
FROM   Propietario
WHERE  ID_Propietario = @ID_Propietario
 
END
GO