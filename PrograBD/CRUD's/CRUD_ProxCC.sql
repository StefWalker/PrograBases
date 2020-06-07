--- CRUD  ProxCC
-- Creacion de tabla ProxCC

USE [ProyectoBases]

BEGIN
DROP TABLE Pro_x_CC
END
GO
BEGIN
	CREATE TABLE Pro_x_CC
	(
		ID_PxC INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		ID_CC INT NOT NULL, 
		ID_Propiedad INT NOT NULL,
		Activo BIT NOT NULL  DEFAULT 1,
		FOREIGN KEY (ID_CC) REFERENCES ConceptoCobro(ID_CC),
		FOREIGN KEY (ID_Propiedad) REFERENCES Propiedad(ID_Propiedad)
	);
END
USE [ProyectoBases]
-- Insert en tabla PxC

IF OBJECT_ID('ProxCCInsert') IS NOT NULL
BEGIN 
DROP PROC ProxCCInsert 
END
GO
CREATE PROCEDURE ProxCCInsert
	  @ID_Propiedad INT ,
	  @ID_CC INT
	  
AS
BEGIN
INSERT INTO Pro_x_CC(
	   ID_Propiedad ,
	   ID_CC,
	   Activo)

    VALUES (
	   @ID_Propiedad ,
	   @ID_CC,
	   1)
	  
END

-- Read de tabla PxP
IF OBJECT_ID('Pro_x_CCRead') IS NOT NULL
BEGIN 
    DROP PROC Pro_x_CCRead
END 
GO
CREATE PROC Pro_x_CCRead
     @ID_Propiedad int , 
	 @ID_CC int
AS 
BEGIN 
    SELECT ID_CC, ID_Propiedad
    FROM   Pro_x_CC 
    WHERE  (ID_Propiedad = @ID_Propiedad AND ID_CC = @ID_CC AND Activo = 1) 
END
GO

-- Update de tabla PxP
IF OBJECT_ID('Pro_x_CCUpdate') IS NOT NULL
BEGIN 
DROP PROC Pro_x_CCUpdate
END 
GO
CREATE PROC Pro_x_CCUpdate
	 @ID_PxC INT,
	 @ID_Propiedad INT ,
	 @ID_CC INT
  
AS 
BEGIN 
UPDATE Pro_x_CC
SET  ID_Propiedad = @ID_Propiedad,
	 ID_CC= @ID_CC
	 
WHERE  (ID_PxC = @ID_PxC AND  Activo = 1)
END
GO

-- Delete de tabla PxP
IF OBJECT_ID('Pro_x_CCDelete') IS NOT NULL
BEGIN 
DROP PROC Pro_x_CCDelete
END 
GO
CREATE PROC Pro_x_CCDelete 
    @ID_Propiedad INT,
	 @ID_CC INT
AS 
BEGIN 
UPDATE Pro_x_CC
SET Activo = 0
WHERE  ID_Propiedad = @ID_Propiedad  AND ID_CC = @ID_CC
 
END
GO