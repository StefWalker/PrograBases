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
	  Activo BIT NOT NULL  DEFAULT 1,
      ID_TDoc INT NOT NULL,
      Fecha DATE NOT NULL DEFAULT GETDATE(),
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
BEGIN TRY
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
END TRY 
BEGIN CATCH
	RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO

-- Read de tabla propietario 
IF OBJECT_ID('ReadPropietario') IS NOT NULL
BEGIN 
    DROP PROC ReadPropietario
END 
GO
CREATE PROC ReadPropietario
    @ID_Propietario int
AS 
BEGIN TRY
    SELECT ID_Propietario,Identificacion,Nombre,ID_TDoc 
    FROM   Propietario
    WHERE  (ID_Propietario = @ID_Propietario AND Activo = 1) 
END TRY 
BEGIN CATCH
	RAISERROR('Error en la datos no validos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO

-- Update de tabla propietario 
IF OBJECT_ID('PropietarioUpdateB') IS NOT NULL
BEGIN 
DROP PROC PropietarioUpdateB
END 
GO
CREATE PROC PropietarioUpdateB
	 @Identificacion VARCHAR(250),
	 @NewIdentificacion INT,
	 @NewNombre VARCHAR (100)
AS 
BEGIN TRY
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
	 Nombre =  @NewNombre
WHERE  (Identificacion = @Identificacion AND Activo = 1)
END TRY
BEGIN CATCH
	RAISERROR('Error en la actualizacion de datos fallida', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
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
BEGIN TRY
DELETE
FROM   Propietario
WHERE  ID_Propietario = @ID_Propietario
END TRY 
BEGIN CATCH
	RAISERROR('Error en la eliminacion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO

------------------------Procedimientos extras---------------------------
-- Search Propietario por medio de la identificacion 

IF OBJECT_ID('PropietarioSearch') IS NOT NULL
BEGIN 
DROP PROC PropietarioSearch
END 
GO
CREATE PROC PropietarioSearch
    @Identificacion VARCHAR(250)
AS 
BEGIN TRY
    SELECT ID_Propietario, Identificacion, Nombre, ID_TDoc
	FROM   Propietario
    WHERE  (Identificacion = @Identificacion AND Activo = 1) 
END TRY 
BEGIN CATCH
	RAISERROR('Error en la datos no validos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO

-- Delete de tabla propietario por nombre y identificacion de propietario
IF OBJECT_ID('PropietarioDeleteByName') IS NOT NULL
BEGIN 
DROP PROC PropietarioDeleteByName
END 
GO
CREATE PROC PropietarioDeleteByName 
    @Identificacion VARCHAR(250),
	@Nombre VARCHAR (100)
AS 
BEGIN TRY
UPDATE Propietario
SET Activo = 0
WHERE  (Identificacion = @Identificacion AND Nombre = @Nombre)
END TRY 
BEGIN CATCH
	RAISERROR('Error en la eliminacion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO