--- CRUD  Pro_x_Usuario
-- Creacion de tabla Pro_x_Usuario

USE [ProyectoBases]

BEGIN
DROP TABLE Pro_x_Usuario
END
GO
BEGIN
	CREATE TABLE Pro_x_Usuario
	(
	   ID_PxU INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	   ID_Propiedad INT NOT NULL,
	   ID_Usuario INT NOT NULL,
	   Activo BIT NOT NULL  DEFAULT 1,
	   Fecha DATE NOT NULL DEFAULT GETDATE(),
	   FOREIGN KEY (ID_Propiedad) REFERENCES Propiedad(ID_Propiedad),
	   FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)
	);

END

-- Insert en tabla PxP
IF OBJECT_ID('Pro_x_UsuarioInsert') IS NOT NULL
BEGIN 
DROP PROC Pro_x_UsuarioInsert 
END
GO
CREATE PROCEDURE Pro_x_UsuarioInsert
	  @inID_Propiedad INT ,
	  @inID_Usuario INT
	  
AS
BEGIN TRY
INSERT INTO Pro_x_Usuario(
	   ID_Propiedad ,
	   ID_Usuario,
	   Activo)

    VALUES (
	   @inID_Propiedad ,
	   @inID_Usuario,
	   1)
END TRY
BEGIN CATCH
	RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO

-- Read de tabla PxP
IF OBJECT_ID('Pro_x_UsuarioRead') IS NOT NULL
BEGIN 
    DROP PROC Pro_x_UsuarioRead
END 
GO
CREATE PROC Pro_x_UsuarioRead
     @inID_Propiedad int, @inID_Usuario INT
AS 
BEGIN TRY
    SELECT ID_PxU, ID_Propiedad ,ID_Usuario
    FROM   Pro_x_Usuario 
    WHERE  (ID_Propiedad = @inID_Propiedad AND ID_Usuario = @inID_Usuario AND Activo = 1) 
END TRY
BEGIN CATCH
	RAISERROR('Error en la datos no validos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO

-- Update de tabla Pro_x_Usuario
IF OBJECT_ID('Pro_x_UsuarioUpdate') IS NOT NULL
BEGIN 
DROP PROC Pro_x_UsuarioUpdate
END 
GO
CREATE PROC Pro_x_UsuarioUpdate
	 @inID_PxU INT,
	 @inID_Propiedad INT ,
	 @inID_Usuario INT
  
AS 
BEGIN TRY
UPDATE Pro_x_Usuario
SET  ID_Propiedad = @inID_Propiedad,
	 ID_Usuario= @inID_Usuario
	 
WHERE  (ID_PxU = @inID_PxU AND Activo = 1)
END TRY
BEGIN CATCH
	RAISERROR('Error en la actualizacion de datos fallida', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO

-- Delete de tabla Pro_x_Usuario
IF OBJECT_ID('Pro_x_UsuarioDelete') IS NOT NULL
BEGIN 
DROP PROC Pro_x_UsuarioDelete
END 
GO
CREATE PROC Pro_x_UsuarioDelete 
    @inID_Propiedad INT,
	 @inID_Usuario INT 
AS 
BEGIN TRY
UPDATE Pro_x_Usuario
SET Activo = 0
WHERE  ID_Propiedad=@inID_Propiedad AND ID_Usuario =@inID_Usuario
END TRY
BEGIN CATCH
	RAISERROR('Error en la eliminacion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO