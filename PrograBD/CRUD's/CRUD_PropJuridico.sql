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
	  ID_Juridico INT PRIMARY KEY REFERENCES Propietario(ID_Propietario) NOT NULL,
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
	  @ID_TDoc INT 
AS
BEGIN
INSERT INTO PropJuridico(   --aQUI SE PONE EL ID_jURIDICO 
	   ID_TDoc)
    VALUES (
	   @ID_TDoc)
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
    SELECT @ID_Juridico,ID_TDoc
	FROM   PropJuridico
    WHERE  (ID_Juridico = @ID_Juridico) 
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
	 @ID_TDoc INT
AS 
BEGIN 
UPDATE PropJuridico
SET  ID_TDoc= @ID_TDoc
WHERE  (ID_Juridico = @ID_Juridico)
END
GO

-- Delete de tabla PropJuridico 
IF OBJECT_ID('PropJuridicoDelete') IS NOT NULL
BEGIN 
DROP PROC ProJuridicoDelete 
END 
GO
CREATE PROC ProJuridicoDelete
    @ID_Juridico int
AS 
BEGIN 
DELETE
FROM   PropJuridico
WHERE  ID_Juridico = @ID_Juridico
 
END
GO