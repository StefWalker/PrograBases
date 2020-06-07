--- CRUD  ProxPro 
-- Creacion de tabla ProxPro

USE [ProyectoBases]

BEGIN
DROP TABLE PJur_x_Pro
END
GO
BEGIN
	CREATE TABLE PJur_x_Pro
	(
	   ID_JxP INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	   ID_Juridico INT NOT NULL,
	   ID_Propiedad INT NOT NULL,
	   Activo BIT NOT NULL  DEFAULT 1,
	   FOREIGN KEY (ID_Juridico) REFERENCES PropJuridico(ID_Juridico),
	   FOREIGN KEY (ID_Propiedad) REFERENCES Propiedad(ID_Propiedad)
	);
END
USE [ProyectoBases]
-- Insert en tabla PxP

IF OBJECT_ID('PJurxProInsert') IS NOT NULL
BEGIN 
DROP PROC PJurxProInsert 
END
GO
CREATE PROCEDURE PJurxProInsert
	  @ID_Propiedad INT ,
	  @ID_Juridico INT
	  
AS
BEGIN
INSERT INTO PJur_x_Pro(
	   ID_Propiedad ,
	   ID_Juridico,
	   Activo)

    VALUES (
	   @ID_Propiedad ,
	   @ID_Juridico,
	   1)
	  
END
USE [ProyectoBases]
-- Read de tabla PxP
IF OBJECT_ID('PJur_x_ProRead') IS NOT NULL
BEGIN 
    DROP PROC PJur_x_ProRead
END 
GO
CREATE PROC PJur_x_ProRead
     @ID_Propiedad int , @ID_Juridico int
AS 
BEGIN 
    SELECT ID_JxP, ID_Propiedad ,@ID_Juridico
    FROM   PJur_x_Pro 
    WHERE  (ID_Propiedad = @ID_Propiedad AND ID_Juridico = @ID_Juridico AND Activo = 1) 
END
GO

-- Update de tabla PxP
IF OBJECT_ID('PJur_x_ProUpdate') IS NOT NULL
BEGIN 
DROP PROC PJur_x_ProUpdate
END 
GO
CREATE PROC PJur_x_ProUpdate
	 @ID_PxP INT,
	 @ID_Propiedad INT ,
	 @ID_Juridico INT
  
AS 
BEGIN 
UPDATE PJur_x_Pro
SET  ID_Propiedad = @ID_Propiedad,
	 ID_Juridico= @ID_Juridico
	 
WHERE  (ID_JxP = @ID_PxP AND  Activo = 1)
END
GO

-- Delete de tabla PxP
IF OBJECT_ID('PJur_x_ProDelete') IS NOT NULL
BEGIN 
DROP PROC PJur_x_ProDelete
END 
GO
CREATE PROC PJur_x_ProDelete 
    @ID_Propiedad INT,
	 @ID_Juridico INT
AS 
BEGIN 
UPDATE PJur_x_Pro
SET Activo = 0
WHERE  ID_Propiedad = @ID_Propiedad  AND ID_Juridico = @ID_Juridico
 
END
GO