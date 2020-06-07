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
	  Identificacion VARCHAR(250) NOT NULL,
	  Nombre VARCHAR(100) NOT NULL,
      Activo BIT NOT NULL,
	  ID_TDoc INT NOT NULL,
	  FOREIGN KEY (ID_TDoc) REFERENCES TipoDoc(ID_TDoc)
	);
END


-- Insert en tabla propietario 
IF OBJECT_ID('InsertPropietario') IS NOT NULL
BEGIN 
DROP PROC InsertPropietario
END
GO
CREATE PROCEDURE InsertPropietario
	  @Identificacion VARCHAR(250),
	  @Nombre VARCHAR (100),
	  @ID_TDoc INT
	 
AS
BEGIN
INSERT INTO Propietario(
	   Identificacion,
	   Nombre,
	   Activo,
	   ID_TDoc)
    VALUES (
	   @Identificacion,
	   @Nombre,
	   1,
	   @ID_TDoc)
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
    SELECT ID_Propietario,Identificacion,Nombre,ID_TDoc 
    FROM   Propietario
    WHERE  (ID_Propietario = @ID_Propietario AND Activo = 1) 
END
GO

-- Update de tabla propietario 
IF OBJECT_ID('PropietarioUpdate') IS NOT NULL
BEGIN 
DROP PROC PropietarioUpdate
END 
GO
CREATE PROC PropietarioUpdate
	 @Identificacion VARCHAR(250),
	 @NewIdentificacion INT,
	 @NewNombre VARCHAR (100)
AS 
BEGIN
IF(@NewIdentificacion = '')
BEGIN
	SET @NewIdentificacion = (SELECT Identificacion FROM Propietario WHERE Identificacion = @Identificacion)
END
IF(@NewNombre = '')
BEGIN
	SET @NewNombre = (SELECT Nombre FROM Propietario WHERE Identificacion = @Identificacion)
END
UPDATE Propietario
SET  Identificacion= @Identificacion,
	 Nombre = @NewNombre
WHERE  (Identificacion = @Identificacion AND Activo = 1)
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