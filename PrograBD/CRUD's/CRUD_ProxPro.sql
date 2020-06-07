--- CRUD  ProxPro 
-- Creacion de tabla ProxPro

USE [ProyectoBases]

BEGIN
DROP TABLE Pro_x_Pro
END
GO
BEGIN
	CREATE TABLE Pro_x_Pro
	(
	   ID_PxP INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	   ID_Propiedad INT NOT NULL,
	   ID_Propietario INT NOT NULL,
	   Activo BIT NOT NULL,
       FOREIGN KEY (ID_Propiedad) REFERENCES Propiedad(ID_Propiedad),
       FOREIGN KEY (ID_Propietario) REFERENCES Propietario(ID_Propietario)
	);
END

-- Insert en tabla PxP
IF OBJECT_ID('PropiedadInsert') IS NOT NULL
BEGIN 
DROP PROC ProxProInsert 
END
GO
CREATE PROCEDURE ProxProInsert
	  @ID_Propiedad INT ,
	  @ID_Propietario INT
	  
AS
BEGIN
INSERT INTO Pro_x_Pro(
	   ID_Propiedad ,
	   ID_Propietario,
	   Activo)

    VALUES (

	   @ID_Propiedad ,
	   @ID_Propietario,
	   1)
	  
END

-- Read de tabla PxP
IF OBJECT_ID('Pro_x_ProRead') IS NOT NULL
BEGIN 
    DROP PROC Pro_x_ProRead
END 
GO
CREATE PROC Pro_x_ProRead
     @ID_Propiedad int , @ID_Propietario int
AS 
BEGIN 
    SELECT ID_PxP, ID_Propiedad ,ID_Propietario
    FROM   Pro_x_Pro 
    WHERE  (ID_Propiedad = @ID_Propiedad AND ID_Propietario = @ID_Propietario AND Activo = 1) 
END
GO

-- Update de tabla PxP
IF OBJECT_ID('Pro_x_ProUpdate') IS NOT NULL
BEGIN 
DROP PROC Pro_x_ProUpdate
END 
GO
CREATE PROC Pro_x_ProUpdate
	 @ID_PxP INT,
	 @ID_Propiedad INT ,
	 @ID_Propietario INT
  
AS 
BEGIN 
UPDATE Pro_x_Pro
SET  ID_Propiedad = @ID_Propiedad,
	 ID_Propietario= @ID_Propietario
	 
WHERE  (ID_PxP = @ID_PxP AND  Activo = 1)
END
GO

-- Delete de tabla PxP
IF OBJECT_ID('Pro_x_ProDelete') IS NOT NULL
BEGIN 
DROP PROC Pro_x_ProDelete
END 
GO
CREATE PROC Pro_x_ProDelete 
    @ID_PxP INT
AS 
BEGIN 
DELETE
FROM   Pro_x_Pro
WHERE  ID_PxP = @ID_PxP
 
END
GO