-- CRUD  Concepto Cobro
-- Creacion de tabla Concepto Cobro

USE [ProyectoBases]

BEGIN
DROP TABLE ConceptoCobro 
END
GO
BEGIN
	CREATE TABLE ConceptoCobro
	(
	   ID_CC INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	   TipoCC VARCHAR(50) NOT NULL,
	   Concepto VARCHAR(100) NOT NULL,
	   DiaCobro INT NOT NULL,
	   DiaVencimiento INT NOT NULL ,
	   Activo BIT NOT NULL DEFAULT 1
	);
END

-- Insert en tabla Concepto Cobro
IF OBJECT_ID('CCobroInsert') IS NOT NULL
BEGIN 
DROP PROC CCobroInsert 
END
GO
CREATE PROCEDURE CCobroInsert
	 @inTipoCC VARCHAR(50),
	 @inConcepto VARCHAR(100),
	 @inDiaCobro INT ,
	 @inDiaVencimiento INT ,
	 @inActivo BIT
AS
BEGIN TRY 
INSERT INTO ConceptoCobro(
	 TipoCC,
	 Concepto,
	 DiaCobro,
	 DiaVencimiento,
	 Activo)
	 VALUES(
	 @inTipoCC,
	 @inConcepto,
	 @inDiaCobro,
	 @inDiaVencimiento,
	 1)
	 return 1
END TRY 
BEGIN CATCH
	RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

-- Read en tabla Concepto Cobro
IF OBJECT_ID('CCobroRead') IS NOT NULL
BEGIN 
    DROP PROC CCobroRead
END 
GO
CREATE PROC CCobroRead
	 @inID_CC int
AS 
BEGIN TRY
    SELECT ID_CC, DiaCobro,DiaVencimiento
    FROM   ConceptoCobro  
    WHERE  (ID_CC = @inID_CC AND Activo = 1) 
	return 1
END TRY 
BEGIN CATCH
	RAISERROR('Error en la datos no validos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

-- Update en tabla Concepto Cobro
IF OBJECT_ID('CCobroUpdate') IS NOT NULL
BEGIN 
DROP PROC CCobroUpdate
END 
GO
CREATE PROC CCobroUpdate
	 @inTipoCC INT,
	 @inID_CC INT,
	 @inConcepto VARCHAR(100),
	 @inDiaCobro INT ,
	 @inDiaVencimiento INT,
	 @inActivo BIT
AS 
BEGIN TRY
UPDATE ConceptoCobro
SET  TipoCC = @inTipoCC,
	 Concepto = @inConcepto,
	 DiaCobro = @inDiaCobro,
	 DiaVencimiento	= @inDiaVencimiento,
	 Activo = @inActivo
WHERE  (ID_CC = @inID_CC AND Activo = 1)
return 1
END TRY
BEGIN CATCH
	RAISERROR('Error en la actualizacion de datos fallida', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

-- Delete en tabla Concepto Cobro
IF OBJECT_ID('CCobroDelete') IS NOT NULL
BEGIN 
DROP PROC CCobroDelete
END 
GO
CREATE PROC CCobroDelete 
    @inID_CC int
AS 
BEGIN TRY
DELETE
FROM   ConceptoCobro
WHERE  ID_CC = @inID_CC
return 1
END TRY 
BEGIN CATCH
	RAISERROR('Error en la eliminacion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO