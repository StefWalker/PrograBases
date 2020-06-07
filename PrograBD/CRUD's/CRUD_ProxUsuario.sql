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
	   Activo BIT NOT NULL,
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
	  @ID_Propiedad INT ,
	  @ID_Usuario INT
	  
AS
BEGIN
INSERT INTO Pro_x_Usuario(
	   ID_Propiedad ,
	   ID_Usuario,
	   Activo)

    VALUES (
	   @ID_Propiedad ,
	   @ID_Usuario,
	   1)
	  
END

-- Read de tabla PxP
IF OBJECT_ID('Pro_x_UsuarioRead') IS NOT NULL
BEGIN 
    DROP PROC Pro_x_UsuarioRead
END 
GO
CREATE PROC Pro_x_UsuarioRead
     @ID_Propiedad int, @ID_Usuario INT
AS 
BEGIN 
    SELECT ID_PxU, ID_Propiedad ,ID_Usuario
    FROM   Pro_x_Usuario 
    WHERE  (ID_Propiedad = @ID_Propiedad AND ID_Usuario = @ID_Usuario AND Activo = 1) 
END

GO

-- Update de tabla Pro_x_Usuario
IF OBJECT_ID('Pro_x_UsuarioUpdate') IS NOT NULL
BEGIN 
DROP PROC Pro_x_UsuarioUpdate
END 
GO
CREATE PROC Pro_x_UsuarioUpdate
	 @ID_PxU INT,
	 @ID_Propiedad INT ,
	 @ID_Usuario INT
  
AS 
BEGIN 
UPDATE Pro_x_Usuario
SET  ID_Propiedad = @ID_Propiedad,
	 ID_Usuario= @ID_Usuario
	 
WHERE  (ID_PxU = @ID_PxU AND Activo = 1)
END
GO

-- Delete de tabla Pro_x_Usuario
IF OBJECT_ID('Pro_x_UsuarioDelete') IS NOT NULL
BEGIN 
DROP PROC Pro_x_UsuarioDelete
END 
GO
CREATE PROC Pro_x_UsuarioDelete 
    @ID_Propiedad INT,
	 @ID_Usuario INT 
AS 
BEGIN 
UPDATE Pro_x_Usuario
SET Activo = 0
WHERE  ID_Propiedad=@ID_Propiedad AND ID_Usuario =@ID_Usuario
	 
 
END
GO