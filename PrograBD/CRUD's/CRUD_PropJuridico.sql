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
	     ID_Juridico INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		 ID_Propietario INT REFERENCES Propietario(ID_Propietario) NOT NULL,
		 Documento VARCHAR(250) NOT NULL,
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
	  @Documento VARCHAR(250),
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
    @ID_Juridico int
AS 
BEGIN 
    SELECT ID_Propietario, Documento, ID_TDoc
	FROM   PropJuridico
    WHERE  (ID_Juridico = @ID_Juridico AND Activo = 1) 
END
GO

-- Update de tabla PropJuridico 
IF OBJECT_ID('PropJuridicoUpdate') IS NOT NULL
BEGIN 
DROP PROC PropJuridicoUpdate
END 
GO
CREATE PROC PropJuridicoUpdate
	 @ID_Juridico INT,
	 @ID_Propietario INT,
	 @Documento VARCHAR(250),
	 @ID_TDoc INT
AS 
BEGIN 
UPDATE PropJuridico
SET  ID_Propietario = @ID_Propietario,
	 ID_TDoc= @ID_TDoc,
	 Documento = @Documento
WHERE  (ID_Juridico = @ID_Juridico)
END
GO

-- Delete de tabla PropJuridico 
IF OBJECT_ID('PropJuridicoDelete') IS NOT NULL
BEGIN 
DROP PROC PropJuridicoDelete 
END 
GO
CREATE PROC PropJuridicoDelete
    @ID_Juridico int
AS 
BEGIN 
DELETE
FROM   PropJuridico
WHERE  ID_Juridico = @ID_Juridico
 
END
GO