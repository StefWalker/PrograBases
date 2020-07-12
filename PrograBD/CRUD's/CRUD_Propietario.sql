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
IF OBJECT_ID('PropietarioInsert') IS NOT NULL
BEGIN 
DROP PROC PropietarioInsert
END
GO
CREATE PROCEDURE PropietarioInsert
	  @inIdentificacion VARCHAR(250),
	  @inNombre VARCHAR (100),
	  @inID_TDoc INT
	 
AS
BEGIN TRY
INSERT INTO Propietario(
	   Identificacion,
	   Nombre,
	   Activo,
	   ID_TDoc)
    VALUES (
	   @inIdentificacion,
	   @inNombre,
	   1,
	   @inID_TDoc)
	   return 1
END TRY 
BEGIN CATCH
	RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

-- Read de tabla propietario 
IF OBJECT_ID('PropietarioRead') IS NOT NULL
BEGIN 
    DROP PROC PropietarioRead
END 
GO
CREATE PROC PropietarioRead
    @inID_Propietario int
AS 
BEGIN TRY
    SELECT ID_Propietario,Identificacion,Nombre,ID_TDoc 
    FROM   Propietario
    WHERE  (ID_Propietario = @inID_Propietario AND Activo = 1) 
	return 1
END TRY 
BEGIN CATCH
	RAISERROR('Error en la datos no validos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

-- Update de tabla propietario 
IF OBJECT_ID('PropietarioUpdateB') IS NOT NULL
BEGIN 
DROP PROC PropietarioUpdateB
END 
GO
CREATE PROC PropietarioUpdateB
	 @inIdentificacion VARCHAR(250),
	 @inNewIdentificacion INT,
	 @inNewNombre VARCHAR (100)
AS 
BEGIN TRY
IF(@inNewIdentificacion = '')
BEGIN
	SET @inNewIdentificacion = (SELECT Identificacion FROM Propietario WHERE Identificacion = @inIdentificacion)
END
IF(@inNewNombre = '')
BEGIN
	SET @inNewNombre = (SELECT Nombre FROM Propietario WHERE Identificacion = @inIdentificacion)
END
UPDATE Propietario
SET  Identificacion= @inIdentificacion,
	 Nombre =  @inNewNombre
WHERE  (Identificacion = @inIdentificacion AND Activo = 1)
return 1
END TRY
BEGIN CATCH
	RAISERROR('Error en la actualizacion de datos fallida', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

/*-- Delete de tabla propietario
IF OBJECT_ID('PropietarioDelete') IS NOT NULL
BEGIN 
DROP PROC PropietarioDelete
END 
GO
CREATE PROC PropietarioDelete 
    @inID_Propietario int
AS 
BEGIN TRY
DELETE
FROM   Propietario
WHERE  ID_Propietario = @inID_Propietario
return 1
END TRY 
BEGIN CATCH
	RAISERROR('Error en la eliminacion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO
*/
------------------------Procedimientos extras---------------------------
-- Search Propietario por medio de la identificacion 

IF OBJECT_ID('PropietarioSearch') IS NOT NULL
BEGIN 
DROP PROC PropietarioSearch
END 
GO
CREATE PROC PropietarioSearch
    @inIdentificacion VARCHAR(250)
AS 
BEGIN TRY
    SELECT ID_Propietario, Identificacion, Nombre, ID_TDoc
	FROM   Propietario
    WHERE  (Identificacion = @inIdentificacion AND Activo = 1) 
	return 1
END TRY 
BEGIN CATCH
	RAISERROR('Error en la datos no validos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

-- Delete de tabla propietario por nombre y identificacion de propietario
IF OBJECT_ID('PropietarioDeleteByName') IS NOT NULL
BEGIN 
DROP PROC PropietarioDeleteByName
END 
GO
CREATE PROC PropietarioDeleteByName 
    @inIdentificacion VARCHAR(250),
	@inNombre VARCHAR (100)
AS 
BEGIN TRY
UPDATE Propietario
SET Activo = 0
WHERE  (Identificacion = @inIdentificacion AND Nombre = @inNombre)
return 1
END TRY 
BEGIN CATCH
	RAISERROR('Error en la eliminacion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

------Listar propietarios --------------------
Create PROC ListarPropietariosFisicos
	@inID_Propiedad INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Propietario.ID_Propietario,Propietario.Identificacion,Propietario.Nombre,Propietario.ID_TDoc
	FROM Propietario INNER JOIN Pro_x_Pro
	on Pro_x_Pro.ID_Propiedad = @inID_Propiedad AND Propietario.ID_Propietario = Pro_x_Pro.ID_Propietario
	where Propietario.Activo = 1 AND Pro_x_Pro.Activo = 1
END