-- CRUD  Usuario
-- Creacion de tabla Usuario 

USE [ProyectoBases]

BEGIN
DROP TABLE Usuario
END
GO
BEGIN
	CREATE TABLE Usuario
	(
		ID_Usuario INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		Nombre VARCHAR(100) NOT NULL,
		Password VARCHAR(100) NOT NULL,
		TipoUsuario VARCHAR(100) NOT NULL,
	    Activo BIT NOT NULL  DEFAULT 1,
		Fecha DATE NOT NULL DEFAULT GETDATE()
	);
END

--Insert en tabla Usuario
IF OBJECT_ID('UsuarioInsert') IS NOT NULL
BEGIN 
DROP PROC UsuarioInsert
END
GO
CREATE PROCEDURE UsuarioInsert
	   @inNombre VARCHAR (100),
       @inPassword VARCHAR (100),
       @inTipoUsuario VARCHAR (100)
AS
BEGIN TRY
INSERT INTO Usuario(  
	   Nombre,
	   Password,
	   TipoUsuario,
	   Activo)
    VALUES (
	   @inNombre,
	   @inPassword,
	   @inTipoUsuario,
	   1)
	   return 1 
END TRY
BEGIN CATCH
	RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

/*-- Read de tabla Usuario 
IF OBJECT_ID('UsuarioRead') IS NOT NULL
BEGIN 
    DROP PROC UsuarioRead
END 
GO
CREATE PROC UsuarioRead
    @ID_Usuario INT
AS 
BEGIN TRY
    SELECT ID_Usuario,Nombre,Password,TipoUsuario
	FROM   Usuario
    WHERE  (ID_Usuario = @ID_Usuario AND Activo = 1) 
	return 1
END TRY
BEGIN CATCH
	RAISERROR('Error en la datos no validos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO
*/
-- Update de tabla Usuario 
IF OBJECT_ID('UsuarioUpdate') IS NOT NULL
BEGIN 
DROP PROC UsuarioUpdateB
END 
GO
CREATE PROC UsuarioUpdateB
	 @inNombre VARCHAR (100),
	 @inNewName VARCHAR (100),
     @inPassword VARCHAR (100),
	 @inNewPassword VARCHAR (100),
     @inTipoUsuario VARCHAR (100)
AS 
BEGIN TRY
IF(@inNewName = '')
BEGIN
	SET @inNewName = (SELECT Nombre FROM Usuario WHERE (Nombre = @inNombre AND Password = @inPassword))
END
IF(@inNewPassword = '')
BEGIN
	SET @inNewPassword = (SELECT Password FROM Usuario WHERE (Nombre = @inNombre AND Password = @inPassword))
END
IF(@inTipoUsuario = '')
BEGIN
	SET @inTipoUsuario = (SELECT TipoUsuario FROM Usuario WHERE (Nombre = @inNombre AND Password = @inPassword))
END
UPDATE Usuario
SET  Nombre = @inNewName,
	 Password = @inNewPassword,
	 TipoUsuario = @inTipoUsuario

WHERE  (Nombre = @inNombre AND Password = @inPassword AND Activo = 1)
return 1
END TRY
BEGIN CATCH
	RAISERROR('Error en la actualizacion de datos fallida', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

-- Delete de tabla Usuario por nombre y contraseña
IF OBJECT_ID('UsuarioDeleteB') IS NOT NULL
BEGIN 
DROP PROC UsuarioDeleteB
END 
GO
CREATE PROC UsuarioDeleteB 
    @inNombre VARCHAR(100),
	@inPassword VARCHAR(100)
AS 
BEGIN TRY
UPDATE Usuario
SET	Activo = 0
WHERE  (Nombre = @inNombre AND Password = @inPassword)
return 1
END TRY
BEGIN CATCH
	RAISERROR('Error en la eliminacion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

-----------------------------Procedimientos extras ----------------------------------------
-- Search por medio del nombre y la contraseña

IF OBJECT_ID('UsuarioSearch') IS NOT NULL
BEGIN 
    DROP PROC UsuarioSearch
END 
GO
CREATE PROC UsuarioSearch
    @inNombre VARCHAR (100),
    @inPassword VARCHAR (100)
AS 
BEGIN TRY
    SELECT ID_Usuario,Nombre,Password,TipoUsuario
	FROM   Usuario
    WHERE  (Nombre = @inNombre AND Password = @inPassword AND Activo = 1) 
	return 1
END TRY
BEGIN CATCH
	RAISERROR('Error en la datos no validos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO


-- Buscar el usuario unicamente por medio del nombre 

IF OBJECT_ID('BuscarUsuario') IS NOT NULL
BEGIN 
    DROP PROC BuscarUsuario
END 
GO
CREATE PROC BuscarUsuario
    @inNombre VARCHAR (100)
AS 
BEGIN TRY
    SELECT ID_Usuario,Nombre,Password,TipoUsuario
	FROM   Usuario
    WHERE  (Nombre = @inNombre AND Activo = 1)
	return 1
END TRY
BEGIN CATCH
	RAISERROR('Error en la datos no validos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO
----Listar Usuarios------
Create PROC ListarUsuarios
	@ID_Propiedad INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Usuario.ID_Usuario,Usuario.Nombre,Usuario.Password,Usuario.TipoUsuario
	FROM Usuario INNER JOIN Pro_x_Usuario
	on Pro_x_Usuario.ID_Propiedad = @ID_Propiedad AND Usuario.ID_Usuario = Pro_x_Usuario.ID_Usuario
	where Usuario.Activo = 1
END