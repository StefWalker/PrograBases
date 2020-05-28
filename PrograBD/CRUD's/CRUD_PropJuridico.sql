-- CRUD  PropJuridico
-- Creacion de tabla PropJuridico  

USE [ProyectoBases]

BEGIN
DROP TABLE PropJuridico
END
GO
BEGIN
	CREATE TABLE PropJuridico
	(
		 ID_Propietario INT PRIMARY KEY REFERENCES Propietario(ID_Propietario) NOT NULL,
		 Nombre VARCHAR(50) NOT NULL,
		 ID_Juridico INT NOT NULL,
		 ID_TDoc INT NOT NULL,
		 FOREIGN KEY (ID_TDoc) REFERENCES TipoDoc(ID_TDoc)
);
END

-- Insert en tabla PropJuridico 
IF OBJECT_ID('PropJuridicoInsert') IS NOT NULL
BEGIN 
DROP PROC PropJuridicoInsert
END
GO
CREATE PROCEDURE PropJuridicoInsert
	  @ID_Propietario INT,
	  @Nombre VARCHAR(50),
	  @ID_Juridico INT,
	  @ID_TDoc INT 
AS
BEGIN
INSERT INTO PropJuridico(
	   ID_Propietario,
	   Nombre,
	   ID_Juridico,
	   ID_TDoc)
    VALUES (
	   @ID_Propietario,
	   @Nombre,
	   @ID_Juridico,
	   @ID_TDoc)
END

-- Read de tabla PropJuridico 
IF OBJECT_ID('PropJuridicoRead') IS NOT NULL
BEGIN 
    DROP PROC PropJuridicoRead
END 
GO
CREATE PROC PropJuridicoRead
    @ID_Propietario int
AS 
BEGIN 
    SELECT ID_Propietario, Nombre, ID_Juridico, ID_TDoc
	FROM   PropJuridico
    WHERE  (ID_Propietario = @ID_Propietario) 
END
GO

-- Update de tabla PropJuridico 
IF OBJECT_ID('PropJuridicoUpdate') IS NOT NULL
BEGIN 
DROP PROC PropJuridicoUpdate
END 
GO
CREATE PROC PropJuridicoUpdate
	 @ID_Propietario INT,
	 @Nombre VARCHAR(50),
	 @ID_Juridico INT,
	 @ID_TDoc INT
AS 
BEGIN 
UPDATE PropJuridico
SET  ID_TDoc= @ID_TDoc,
	 Nombre = @Nombre,
	 ID_Juridico = @ID_Juridico
WHERE  (ID_Propietario = @ID_Propietario)
END
GO

-- Delete de tabla PropJuridico 
IF OBJECT_ID('PropJuridicoDelete') IS NOT NULL
BEGIN 
DROP PROC PropJuridicoDelete 
END 
GO
CREATE PROC PropJuridicoDelete
    @ID_Propietario int
AS 
BEGIN 
DELETE
FROM   PropJuridico
WHERE  ID_Propietario = @ID_Propietario
 
END
GO