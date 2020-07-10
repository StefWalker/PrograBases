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
		 ID_TDoc INT NOT NULL DEFAULT 4,
		 Activo BIT NOT NULL  DEFAULT 1,
		 Fecha DATE NOT NULL DEFAULT GETDATE(),
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
	  @inID_Propietario INT,
	  @inDocumento VARCHAR(250),
	  @inID_TDoc INT 
AS
BEGIN TRY
INSERT INTO PropJuridico(
	   ID_Propietario,
	   Documento,
	   ID_TDoc,
	   Activo)
    VALUES (
	   @inID_Propietario,
	   @inDocumento,
	   @inID_TDoc,
	   1)
END TRY
BEGIN CATCH
	RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO


-- Read de tabla PropJuridico , busca por medio del ID y lee todo
IF OBJECT_ID('PropJuridicoSearchID') IS NOT NULL
BEGIN 
DROP PROC PropJuridicoSearchID
END 
GO
CREATE PROC PropJuridicoSearchID
    @inID_Propietario INT
AS 
BEGIN TRY
    SELECT ID_Juridico, ID_Propietario, Documento, ID_TDoc
	FROM   PropJuridico
    WHERE  (ID_Propietario = @inID_Propietario AND Activo = 1) 
END TRY
BEGIN CATCH
	RAISERROR('Error en la datos no validos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO

--- Update de tabla Propietario Juridico
IF OBJECT_ID('ProJuridicoUpdateB') IS NOT NULL
BEGIN 
DROP PROC ProJuridicoUpdateB
END 
GO
CREATE PROC ProJuridicoUpdateB
	 @inDocumento VARCHAR(250),
	 @inNewDocumento INT,
     @inID_TDoc INT
AS 
BEGIN TRY
IF(@inNewDocumento IS NULL)
BEGIN
	SET @inNewDocumento = (SELECT Documento FROM PropJuridico WHERE (Documento = @inDocumento))
END
UPDATE PropJuridico
SET  Documento = @inNewDocumento,
	 ID_TDoc = @inID_TDoc
WHERE  (Documento = @inDocumento AND Activo = 1)
END TRY
BEGIN CATCH
	RAISERROR('Error en la actualizacion de datos fallida', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO

-- Delete de tabla PropJuridico 
IF OBJECT_ID('PropJuridicoDelete') IS NOT NULL
BEGIN 
DROP PROC PropJuridicoDelete 
END 
GO
CREATE PROC PropJuridicoDelete
    @inID_Juridico int
AS 
BEGIN TRY
DELETE
FROM   PropJuridico
WHERE  ID_Juridico = @inID_Juridico
END TRY
BEGIN CATCH
	RAISERROR('Error en la eliminacion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO

--------------Procedimientos extras----------------------------
-- Search Propietario Juridico
IF OBJECT_ID('BuscarPropJuridico') IS NOT NULL
BEGIN 
DROP PROC BuscarPropJuridico
END 
GO
CREATE PROC BuscarPropJuridico
    @inDocumento VARCHAR(250)
AS 
BEGIN TRY
    SELECT ID_Juridico, ID_Propietario, Documento, ID_TDoc
	FROM   PropJuridico
    WHERE  (Documento = @inDocumento AND Activo = 1) 
END TRY
BEGIN CATCH
	RAISERROR('Error en la datos no validos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO



-- Delete de tabla Propietario Juridico por numero de documento
IF OBJECT_ID('PropJuricoDeleteB') IS NOT NULL
BEGIN 
DROP PROC PropJuricoDeleteB
END 
GO
CREATE PROC PropJuricoDeleteB 
    @inDocumento VARCHAR(250)
AS 
BEGIN TRY
UPDATE PropJuridico
SET	Activo = 0
WHERE  Documento = @inDocumento
END TRY
BEGIN CATCH
	RAISERROR('Error en la eliminacion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO
