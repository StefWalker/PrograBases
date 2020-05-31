USE [PrograBases]

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
    SELECT ID_Usuario,Nombre,Password,TipoUsuario, Activo
	FROM   Usuario
    WHERE  (Nombre = @Nombre AND Password = @Password) 
END
GO

-- Search Propietario Juridico
IF OBJECT_ID('BuscarPropJuridico') IS NOT NULL
BEGIN 
DROP PROC BuscarPropJuridico
END 
GO
CREATE PROC BuscarPropJuridico
    @Documento INT
AS 
BEGIN 
    SELECT ID_Propietario, Documento, ID_TDoc, Activo
	FROM   PropJuridico
    WHERE  (Documento = @Documento) 
END
GO

-- Search Tipo Documento
IF OBJECT_ID('TipoDocSearch') IS NOT NULL
BEGIN 
DROP PROC TipoDocSearch
END 
GO
CREATE PROC TipoDocSearch
    @TipoDoc INT
AS 
BEGIN 
    SELECT ID_TDoc, TipoDoc, Tipo
	FROM   TipoDoc
    WHERE  (TipoDoc = @TipoDoc) 
END
GO

-- Search Propietario
IF OBJECT_ID('PropiedadSearch') IS NOT NULL
BEGIN 
DROP PROC PropiedadSearch
END 
GO
CREATE PROC PropiedadSearch
    @NumPropiedad INT
AS 
BEGIN 
    SELECT NumPropiedad, Valor, Descripción, Direccion, Fecha_Creacion, Activo
	FROM   Propiedad
    WHERE  (NumPropiedad = @NumPropiedad) 
END
GO

-- Search Propietario
IF OBJECT_ID('PropietarioSearch') IS NOT NULL
BEGIN 
DROP PROC PropietarioSearch
END 
GO
CREATE PROC PropietarioSearch
    @Identificacion INT
AS 
BEGIN 
    SELECT ID_Propietario, Identificacion, Nombre, Fecha_Creacion, Activo, ID_TDoc
	FROM   Propietario
    WHERE  (Identificacion = @Identificacion) 
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
    SELECT ID_Usuario,Nombre,Password,TipoUsuario, Activo
	FROM   Usuario
    WHERE  (Nombre = @Nombre)
END
GO

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

-- Update de tabla Propietario Juridico
IF OBJECT_ID('ProJuridicoUpdateB') IS NOT NULL
BEGIN 
DROP PROC ProJuridicoUpdateB
END 
GO
CREATE PROC ProJuridicoUpdateB
	 @Documento INT,
	 @NewDocumento INT,
     @ID_TDoc INT
AS 
BEGIN 
IF(@NewDocumento IS NULL)
BEGIN
	SET @NewDocumento = (SELECT Documento FROM PropJuridico WHERE (Documento = @Documento))
END
UPDATE PropJuridico
SET  Documento = @NewDocumento,
	 ID_TDoc = @ID_TDoc
WHERE  (Documento = @Documento)
END
GO

-- Delete de tabla Propietario Juridico por numero de docuento
IF OBJECT_ID('PropJuricoDeleteB') IS NOT NULL
BEGIN 
DROP PROC PropJuricoDeleteB
END 
GO
CREATE PROC PropJuricoDeleteB 
    @Documento int
AS 
BEGIN 
UPDATE PropJuridico
SET	Activo = 0
WHERE  Documento = @Documento
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