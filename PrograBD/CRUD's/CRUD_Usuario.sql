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
		Activo BIT NOT NULL
	);
END

--Insert en tabla Usuario
IF OBJECT_ID('UsuarioInsert') IS NOT NULL
BEGIN 
DROP PROC UsuarioInsert
END
GO
CREATE PROCEDURE UsuarioInsert
	   @Nombre VARCHAR (100),
       @Password VARCHAR (100),
       @TipoUsuario VARCHAR (100)
AS
BEGIN
INSERT INTO Usuario(  
	   Nombre,
	   Password,
	   TipoUsuario,
	   Activo)
    VALUES (
	   @Nombre,
	   @Password,
	   @TipoUsuario,
	   1)
END

-- Read de tabla Usuario 
IF OBJECT_ID('UsuarioRead') IS NOT NULL
BEGIN 
    DROP PROC UsuarioRead
END 
GO
CREATE PROC UsuarioRead
    @ID_Usuario INT
AS 
BEGIN 
    SELECT ID_Usuario,Nombre,Password,TipoUsuario
	FROM   Usuario
    WHERE  (ID_Usuario = @ID_Usuario AND Activo = 1) 
END
GO

-- Update de tabla Usuario 
IF OBJECT_ID('UsuarioUpdate') IS NOT NULL
BEGIN 
DROP PROC UsuarioUpdateB
END 
GO
CREATE PROC UsuarioUpdateB
	 @Nombre VARCHAR (100),
	 @NewName VARCHAR (100),
     @Password VARCHAR (100),
	 @NewPassword VARCHAR (100),
     @TipoUsuario VARCHAR (100)
AS 
BEGIN 
IF(@NewName = '')
BEGIN
	SET @NewName = (SELECT Nombre FROM Usuario WHERE (Nombre = @Nombre AND Password = @Password))
END
IF(@NewPassword = '')
BEGIN
	SET @NewPassword = (SELECT Password FROM Usuario WHERE (Nombre = @Nombre AND Password = @Password))
END
IF(@TipoUsuario = '')
BEGIN
	SET @TipoUsuario = (SELECT TipoUsuario FROM Usuario WHERE (Nombre = @Nombre AND Password = @Password))
END
UPDATE Usuario
SET  Nombre = @NewName,
	 Password = @NewPassword,
	 TipoUsuario = @TipoUsuario

WHERE  (Nombre = @Nombre AND Password = @Password AND Activo = 1)
END
GO

-- Delete de tabla Usuario por nombre y contraseña
IF OBJECT_ID('UsuarioDeleteB') IS NOT NULL
BEGIN 
DROP PROC UsuarioDeleteB
END 
GO
CREATE PROC UsuarioDeleteB 
    @Nombre VARCHAR(100),
	@Password VARCHAR(100)
AS 
BEGIN 
UPDATE Usuario
SET	Activo = 0
WHERE  (Nombre = @Nombre AND Password = @Password)
END
GO

-----------------------------Procedimientos extras ----------------------------------------
-- Search por medio del nombre y la contraseña

IF OBJECT_ID('UsuarioSearch') IS NOT NULL
BEGIN 
    DROP PROC UsuarioSearch
END 
GO
CREATE PROC UsuarioSearch
    @Nombre VARCHAR (100),
    @Password VARCHAR (100)
AS 
BEGIN 
    SELECT ID_Usuario,Nombre,Password,TipoUsuario
	FROM   Usuario
    WHERE  (Nombre = @Nombre AND Password = @Password AND Activo = 1) 
END
GO
-- Buscar el usuario unicamente por medio del nombre 

IF OBJECT_ID('BuscarUsuario') IS NOT NULL
BEGIN 
    DROP PROC BuscarUsuario
END 
GO
CREATE PROC BuscarUsuario
    @Nombre VARCHAR (100)
AS 
BEGIN 
    SELECT ID_Usuario,Nombre,Password,TipoUsuario
	FROM   Usuario
    WHERE  (Nombre = @Nombre AND Activo = 1)
END
GO
