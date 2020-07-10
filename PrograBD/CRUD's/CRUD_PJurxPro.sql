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
	   Fecha DATE NOT NULL DEFAULT GETDATE(),
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
	  @inID_Propiedad INT ,
	  @inID_Juridico INT
	  
AS
BEGIN TRY
INSERT INTO PJur_x_Pro(
	   ID_Propiedad ,
	   ID_Juridico,
	   Activo)

    VALUES (
	   @inID_Propiedad ,
	   @inID_Juridico,
	   1)
END TRY 
BEGIN CATCH
	RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO

-- Read de tabla PxP
IF OBJECT_ID('PJur_x_ProRead') IS NOT NULL
BEGIN 
    DROP PROC PJur_x_ProRead
END 
GO
CREATE PROC PJur_x_ProRead
     @inID_Propiedad int , @inID_Juridico int
AS 
BEGIN TRY
    SELECT ID_JxP, ID_Propiedad ,@inID_Juridico
    FROM   PJur_x_Pro 
    WHERE  (ID_Propiedad = @inID_Propiedad AND ID_Juridico = @inID_Juridico AND Activo = 1) 
END TRY 
BEGIN CATCH
	RAISERROR('Error en la datos no validos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO

-- Update de tabla PxP
IF OBJECT_ID('PJur_x_ProUpdate') IS NOT NULL
BEGIN 
DROP PROC PJur_x_ProUpdate
END 
GO
CREATE PROC PJur_x_ProUpdate
	 @inID_PxP INT,
	 @inID_Propiedad INT ,
	 @inID_Juridico INT
  
AS 
BEGIN TRY
UPDATE PJur_x_Pro
SET  ID_Propiedad = @inID_Propiedad,
	 ID_Juridico= @inID_Juridico
	 
WHERE  (ID_JxP = @inID_PxP AND  Activo = 1)
END TRY
BEGIN CATCH
	RAISERROR('Error en la actualizacion de datos fallida', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO

-- Delete de tabla PxP
IF OBJECT_ID('PJur_x_ProDelete') IS NOT NULL
BEGIN 
DROP PROC PJur_x_ProDelete
END 
GO
CREATE PROC PJur_x_ProDelete 
    @inID_Propiedad INT,
	 @inID_Juridico INT
AS 
BEGIN TRY
UPDATE PJur_x_Pro
SET Activo = 0
WHERE  ID_Propiedad = @inID_Propiedad  AND ID_Juridico = @inID_Juridico
END TRY 
BEGIN CATCH
	RAISERROR('Error en la eliminacion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO