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
DELETE
FROM   Propietario
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
DELETE
FROM   Propiedad
WHERE  NumPropiedad = @NumPropiedad
END
GO