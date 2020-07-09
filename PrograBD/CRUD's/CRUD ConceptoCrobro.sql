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
	   FechaVencimiento INT NOT NULL,
	   Fecha INT NOT NULL DEFAULT GETDATE(),
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
	 @TipoCC VARCHAR(50),
	 @Concepto VARCHAR(100),
	 @FechaVencimiento DATE,
	 @Fecha DATE,
	 @Activo BIT
AS
BEGIN TRY 
INSERT INTO ConceptoCobro(
	 TipoCC,
	 Concepto,
	 FechaVencimiento,
	 Fecha,
	 Activo)
	 VALUES(
	 @TipoCC,
	 @Concepto,
	 @FechaVencimiento,
	 GETDATE(),
	 1)
END TRY 
BEGIN CATCH
	RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO

-- Read en tabla Concepto Cobro
IF OBJECT_ID('CCobroRead') IS NOT NULL
BEGIN 
    DROP PROC CCobroRead
END 
GO
CREATE PROC CCobroRead
	 @ID_CC int
AS 
BEGIN TRY
    SELECT ID_CC, FechaVencimiento, Fecha
    FROM   ConceptoCobro  
    WHERE  (ID_CC = @ID_CC AND Activo = 1) 
END TRY 
BEGIN CATCH
	RAISERROR('Error en la datos no validos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO

-- Update en tabla Concepto Cobro
IF OBJECT_ID('CCobroUpdate') IS NOT NULL
BEGIN 
DROP PROC CCobroUpdate
END 
GO
CREATE PROC CCobroUpdate
	 @TipoCC INT,
	 @ID_CC INT,
	 @Concepto VARCHAR(100),
	 @FechaVencimiento DATE,
	 @Fecha DATE,
	 @Activo BIT
AS 
BEGIN TRY
UPDATE ConceptoCobro
SET  TipoCC = @TipoCC,
	 Concepto = @Concepto,
	 FechaVencimiento = @FechaVencimiento,
	 Fecha	= @Fecha,
	 Activo = @Activo
WHERE  (ID_CC = @ID_CC AND Activo = 1)
END TRY
BEGIN CATCH
	RAISERROR('Error en la actualizacion de datos fallida', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO

-- Delete en tabla Concepto Cobro
IF OBJECT_ID('CCobroDelete') IS NOT NULL
BEGIN 
DROP PROC CCobroDelete
END 
GO
CREATE PROC CCobroDelete 
    @ID_CC int
AS 
BEGIN TRY
DELETE
FROM   ConceptoCobro
WHERE  ID_CC = @ID_CC
END TRY 
BEGIN CATCH
	RAISERROR('Error en la eliminacion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO