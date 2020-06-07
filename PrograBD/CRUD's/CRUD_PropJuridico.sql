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


-- Read de tabla PropJuridico , busca por medio del ID y lee todo
IF OBJECT_ID('PropJuridicoSearchID') IS NOT NULL
BEGIN 
DROP PROC PropJuridicoSearchID
END 
GO
CREATE PROC PropJuridicoSearchID
    @ID_Propietario INT
AS 
BEGIN 
    SELECT ID_Juridico, ID_Propietario, Documento, ID_TDoc
	FROM   PropJuridico
    WHERE  (ID_Propietario = @ID_Propietario AND Activo = 1) 
END
GO

GO

--- Update de tabla Propietario Juridico
IF OBJECT_ID('ProJuridicoUpdateB') IS NOT NULL
BEGIN 
DROP PROC ProJuridicoUpdateB
END 
GO
CREATE PROC ProJuridicoUpdateB
	 @Documento VARCHAR(250),
	 @NewDocumento INT,
     @ID_TDoc INT
AS 
BEGIN 
IF(@NewDocumento IS NULL)
BEGIN
	SET @NewDocumento = (SELECT Documento FROM PropJuridico WHERE (Documento = @Documento))
END
UPDATE PropJuridico
SET  Documento = @NewDocumento,
	 ID_TDoc = @ID_TDoc
WHERE  (Documento = @Documento AND Activo = 1)
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

--------------Procedimientos extras----------------------------
-- Search Propietario Juridico
IF OBJECT_ID('BuscarPropJuridico') IS NOT NULL
BEGIN 
DROP PROC BuscarPropJuridico
END 
GO
CREATE PROC BuscarPropJuridico
    @Documento VARCHAR(250)
AS 
BEGIN 
    SELECT ID_Juridico, ID_Propietario, Documento, ID_TDoc
	FROM   PropJuridico
    WHERE  (Documento = @Documento AND Activo = 1) 
END
GO

-- Delete de tabla Propietario Juridico por numero de documento
IF OBJECT_ID('PropJuricoDeleteB') IS NOT NULL
BEGIN 
DROP PROC PropJuricoDeleteB
END 
GO
CREATE PROC PropJuricoDeleteB 
    @Documento VARCHAR(250)
AS 
BEGIN 
UPDATE PropJuridico
SET	Activo = 0
WHERE  Documento = @Documento
END
GO
