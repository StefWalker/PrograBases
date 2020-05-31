-- CRUD  PropJuridico
-- Creacion de tabla PropJuridico  

USE [PrograBases]

BEGIN
DROP TABLE PropJuridico
END
GO
BEGIN
	CREATE TABLE PropJuridico
	(
		 ID_Propietario INT PRIMARY KEY REFERENCES Propietario(ID_Propietario) NOT NULL,
		 Documento INT NOT NULL,
		 ID_TDoc INT NOT NULL,
		 Activo BIT NOT NULL,
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
	  @Documento INT,
	  @ID_Juridico INT,
	  @ID_TDoc INT 
AS
BEGIN
INSERT INTO PropJuridico(
	   ID_Propietario,
	   Documento,
	   ID_TDoc,
	   Activo)
    VALUES (
	   @ID_Propietario,
	   @Documento,
	   @ID_TDoc,
	   1)
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
    SELECT ID_Propietario, Documento, ID_TDoc
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
	 @Documento INT,
	 @ID_TDoc INT
AS 
BEGIN 
UPDATE PropJuridico
SET  ID_TDoc= @ID_TDoc,
	 Documento = @Documento
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