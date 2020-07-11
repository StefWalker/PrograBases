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
	   Activo BIT NOT NULL  DEFAULT 1,
	   Fecha DATE NOT NULL DEFAULT GETDATE(),
       FOREIGN KEY (ID_Propiedad) REFERENCES Propiedad(ID_Propiedad),
       FOREIGN KEY (ID_Propietario) REFERENCES Propietario(ID_Propietario)
	);
END
USE [ProyectoBases]
-- Insert en tabla PxP

IF OBJECT_ID('ProxProInsert') IS NOT NULL
BEGIN 
DROP PROC ProxProInsert 
END
GO
CREATE PROCEDURE ProxProInsert
	  @inID_Propiedad INT ,
	  @inID_Propietario INT
	  
AS
BEGIN TRY
INSERT INTO Pro_x_Pro(
	   ID_Propiedad ,
	   ID_Propietario,
	   Activo)

    VALUES (
	   @inID_Propiedad ,
	   @inID_Propietario,
	   1)
	   return 1
END TRY
BEGIN CATCH
	RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

-- Read de tabla PxP
IF OBJECT_ID('Pro_x_ProRead') IS NOT NULL
BEGIN 
    DROP PROC Pro_x_ProRead
END 
GO
CREATE PROC Pro_x_ProRead
     @inID_Propiedad int , @inID_Propietario int
AS 
BEGIN TRY
    SELECT ID_PxP, ID_Propiedad ,ID_Propietario
    FROM   Pro_x_Pro 
    WHERE  (ID_Propiedad = @inID_Propiedad AND ID_Propietario = @inID_Propietario AND Activo = 1) 
	return 1
END TRY
BEGIN CATCH
	RAISERROR('Error en la datos no validos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

-- Update de tabla PxP
IF OBJECT_ID('Pro_x_ProUpdate') IS NOT NULL
BEGIN 
DROP PROC Pro_x_ProUpdate
END 
GO
CREATE PROC Pro_x_ProUpdate
	 @inID_PxP INT,
	 @inID_Propiedad INT ,
	 @inID_Propietario INT
  
AS 
BEGIN TRY
UPDATE Pro_x_Pro
SET  ID_Propiedad = @inID_Propiedad,
	 ID_Propietario= @inID_Propietario
	 
WHERE  (ID_PxP = @inID_PxP AND  Activo = 1)
return 1
END TRY
BEGIN CATCH
	RAISERROR('Error en la actualizacion de datos fallida', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

-- Delete de tabla PxP
IF OBJECT_ID('Pro_x_ProDelete') IS NOT NULL
BEGIN 
DROP PROC Pro_x_ProDelete
END 
GO
CREATE PROC Pro_x_ProDelete 
    @inID_Propiedad INT,
	 @inID_Propietario INT
AS 
BEGIN TRY
UPDATE Pro_x_Pro
SET Activo = 0
WHERE  ID_Propiedad = @inID_Propiedad  AND ID_Propietario = @inID_Propietario
return 1
END TRY
BEGIN CATCH
	RAISERROR('Error en la eliminacion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO