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
       TipoUsuario VARCHAR(100) NOT NULL
	);
END

-- Insert en tabla Usuario
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
	   TipoUsuario)
    VALUES (
	   @Nombre,
	   @Password,
	   @TipoUsuario)
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
    WHERE  (ID_Usuario = @ID_Usuario) 
END
GO

-- Update de tabla Usuario 
IF OBJECT_ID('UsuarioUpdate') IS NOT NULL
BEGIN 
DROP PROC UsuarioUpdate
END 
GO
CREATE PROC UsuarioUpdate
	 @ID_Usuario INT ,
	 @Nombre VARCHAR (100),
     @Password VARCHAR (100),
     @TipoUsuario VARCHAR (100)
AS 
BEGIN 
UPDATE Usuario
SET  Nombre = @Nombre,
	 Password = @Password,
	 TipoUsuario = @TipoUsuario

WHERE  (ID_Usuario= @ID_Usuario)
END
GO

-- Delete de tabla Usuario
IF OBJECT_ID('UsuarioDelete') IS NOT NULL
BEGIN 
DROP PROC UsuarioDelete
END 
GO
CREATE PROC UsuarioDelete
    @ID_Usuario int
AS 
BEGIN 
DELETE
FROM  Usuario
WHERE  ID_Usuario= @ID_Usuario
 
END
GO


USE [ProyectoBases]
-- Read de tabla Usuario 
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
    WHERE  (Nombre = @Nombre AND Password = @Password) 
END
GO