
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
	   return 1
END TRY 
BEGIN CATCH
	RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO


/*-- Read de tabla propiedad
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
	return 1
END TRY 
BEGIN CATCH
	RAISERROR('Error en la datos no validos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO
*/
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
return 1
END TRY
BEGIN CATCH
	RAISERROR('Error en la actualizacion de datos fallida', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

/*-- Delete de tabla propiedad
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
return 1
END TRY 
BEGIN CATCH
	RAISERROR('Error en la eliminacion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO
*/
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
    SELECT NumPropiedad, Valor ,ID_Propiedad, Direccion,Fecha,M3Acumulados,M3AcumuladosUltimoRecibo
	FROM   Propiedad
    WHERE  (NumPropiedad = @inNumPropiedad AND Activo = 1) 
	return 1
END TRY 
BEGIN CATCH
	RAISERROR('Error en la datos no validos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
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
return 1
END TRY 
BEGIN CATCH
	RAISERROR('Error en la eliminacion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

--Listar Propiedades ------------------
CREATE PROC ListarPropiedades
	-- Add the parameters for the stored procedure here
	@inID_Propietario INT
AS
BEGIN Try
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Propiedad.NumPropiedad,Propiedad.Direccion,Propiedad.ID_Propiedad,Propiedad.Fecha,Propiedad.M3Acumulados,Propiedad.M3AcumuladosUltimoRecibo,Propiedad.Valor
	FROM Propiedad INNER JOIN Pro_x_Pro
	on Pro_x_Pro.ID_Propietario = @inID_Propietario AND Propiedad.ID_Propiedad = Pro_x_Pro.ID_Propiedad
	WHERE Propiedad.Activo = 1
END Try
BEGIN CATCH
	RAISERROR('Error en la eliminacion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

-------------Lista las propiedades de un usuario-----------------

CREATE PROC ListarPropiedadesUser
	-- Add the parameters for the stored procedure here
	@inID_Usuario INT
AS
BEGIN Try
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Propiedad.NumPropiedad,Propiedad.Direccion,Propiedad.ID_Propiedad,Propiedad.Fecha,Propiedad.M3Acumulados,Propiedad.M3AcumuladosUltimoRecibo,Propiedad.Valor
	FROM Propiedad INNER JOIN Pro_x_Usuario
	on Pro_x_Usuario.ID_Usuario = @inID_Usuario AND Propiedad.ID_Propiedad = Pro_x_Usuario.ID_Propiedad 
	where Propiedad.Activo = 1
END Try
BEGIN CATCH
	RAISERROR('Error en la eliminacion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO