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


-- Read de tabla Usuario por nombre
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
    WHERE  (Nombre = @Nombre)
END
GO


-- Delete de tabla Pro_x_Usuario por numero de propiedad
IF OBJECT_ID('Pro_x_UsuarioDeleteByNum') IS NOT NULL
BEGIN 
DROP PROC Pro_x_UsuarioDeleteByNum
END 
GO
CREATE PROC Pro_x_UsuarioDeleteByNum 
    @ID_Propiedad INT
AS 
BEGIN 
DELETE
FROM   Pro_x_Usuario
WHERE  ID_Propiedad = @ID_Propiedad
 
END
GO


-- Delete de tabla PxP por numero de propiedad
IF OBJECT_ID('Pro_x_ProDeleteByNum') IS NOT NULL
BEGIN 
DROP PROC Pro_x_ProDeleteByNum
END 
GO
CREATE PROC Pro_x_ProDeleteByNum 
    @ID_Propiedad INT
AS 
BEGIN 
DELETE
FROM   Pro_x_Pro
WHERE  ID_Propiedad = @ID_Propiedad
 
END
GO


-- Delete de tabla PxP por ID de propietario 
IF OBJECT_ID('Pro_x_ProDeleteByPro') IS NOT NULL
BEGIN 
DROP PROC Pro_x_ProDeleteByPro
END 
GO
CREATE PROC Pro_x_ProDeleteByPro 
    @ID_Propietario INT
AS 
BEGIN 
DELETE
FROM   Pro_x_Pro
WHERE  ID_Propietario = @ID_Propietario
 
END
GO

USE [ProyectoBases]
-- Delete de tabla propietario por nombre y identificacion de propietario
IF OBJECT_ID('PropietarioDeleteByName') IS NOT NULL
BEGIN 
DROP PROC PropietarioDeleteByName
END 
GO
CREATE PROC PropietarioDeleteByName 
    @Identificacion INT,
	@Nombre VARCHAR (100)
AS 
BEGIN 
UPDATE Propietario
SET Activo = 0
WHERE  (Identificacion = @Identificacion AND Nombre = @Nombre)
 
END
GO


-- Delete de tabla propiedad por numero de propiedad
IF OBJECT_ID('PropiedadDeleteByNum') IS NOT NULL
BEGIN 
DROP PROC PropiedadDeleteByNum
END 
GO
CREATE PROC PropiedadDeleteByNum 
    @NumPropiedad int
AS 
BEGIN 
UPDATE Propiedad
SET	Activo = 0
WHERE  NumPropiedad = @NumPropiedad
END
GO


USE [ProyectoBases]
-- Update de tabla propiedad
IF OBJECT_ID('PropiedadUpdateB') IS NOT NULL
BEGIN 
DROP PROC PropiedadUpdateB
END 
GO
CREATE PROC PropiedadUpdateB
	 @ID_Propiedad INT,
	 @NumPropiedad INT,
	 @Valor MONEY,
	 @Descripción VARCHAR(250),
	 @Direccion VARCHAR(250)
AS 
BEGIN 
IF(@Valor IS NULL)
BEGIN
	SET @Valor = (SELECT Valor FROM Propiedad WHERE NumPropiedad = @NumPropiedad)
END
IF(@Descripción IS NULL)
BEGIN
	SET @Descripción = (SELECT Descripción FROM Propiedad WHERE NumPropiedad = @NumPropiedad)
END
IF(@Direccion IS NULL)
BEGIN
	SET @Direccion = (SELECT Direccion FROM Propiedad WHERE NumPropiedad = @NumPropiedad)
END
UPDATE Propiedad
SET  NumPropiedad = @NumPropiedad,
	 Valor = @Valor,
	 Descripción	= @Descripción,
	 Direccion = @Direccion
WHERE  (NumPropiedad = @NumPropiedad)
END
GO


-- Update de tabla Usuario 
IF OBJECT_ID('UsuarioUpdateB') IS NOT NULL
BEGIN 
DROP PROC UsuarioUpdateB
END 
GO
CREATE PROC UsuarioUpdateB
	 @ID_Usuario INT ,
	 @Nombre VARCHAR (100),
	 @NewName VARCHAR (100),
     @Password VARCHAR (100),
	 @NewPassword VARCHAR (100),
     @TipoUsuario VARCHAR (100)
AS 
BEGIN 
IF(@NewName IS NULL)
BEGIN
	SET @NewName = (SELECT Nombre FROM Usuario WHERE (Nombre = @Nombre AND Password = @Password))
END
IF(@NewPassword IS NULL)
BEGIN
	SET @NewPassword = (SELECT Password FROM Usuario WHERE (Nombre = @Nombre AND Password = @Password))
END
IF(@TipoUsuario IS NULL)
BEGIN
	SET @TipoUsuario = (SELECT TipoUsuario FROM Usuario WHERE (Nombre = @Nombre AND Password = @Password))
END
UPDATE Usuario
SET  Nombre = @NewName,
	 Password = @NewPassword,
	 TipoUsuario = @TipoUsuario

WHERE  (Nombre = @Nombre AND Password = @Password)
END
GO


-- Update de tabla propietario 
IF OBJECT_ID('PropietarioUpdateB') IS NOT NULL
BEGIN 
DROP PROC PropietarioUpdateB
END 
GO
CREATE PROC PropietarioUpdateB
	 @ID_Propietario INT,
	 @Identificacion INT,
	 @NewIdentificacion INT,
	 @Nombre VARCHAR (100),
	 @NewNombre VARCHAR (100)
AS 
BEGIN
IF(@NewIdentificacion IS NULL)
BEGIN
	SET @NewIdentificacion = (SELECT Identificacion FROM Propietario WHERE Identificacion = @Identificacion)
END
IF(@NewNombre IS NULL)
BEGIN
	SET @NewNombre = (SELECT Nombre FROM Propietario WHERE Identificacion = @Identificacion)
END
UPDATE Propietario
SET  Identificacion= @Identificacion,
	 Nombre = @Nombre
WHERE  (Identificacion = @Identificacion)
END
GO