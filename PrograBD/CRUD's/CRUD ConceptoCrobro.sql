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
	  Concepto VARCHAR(100) NOT NULL,
	  FechaVencimiento DATE NOT NULL,
	  Fecha DATE NOT NULL,
	  Activo BIT NOT NULL
	);
END

-- Insert en tabla Concepto Cobro
IF OBJECT_ID('CCobroInsert') IS NOT NULL
BEGIN 
DROP PROC CCobroInsert 
END
GO
CREATE PROCEDURE CCobroInsert
	 @Concepto VARCHAR(100),
	 @FechaVencimiento DATE,
	 @Fecha DATE,
	 @Activo BIT
AS
BEGIN
INSERT INTO ConceptoCobro(
	 Concepto,
	 FechaVencimiento,
	 Fecha,
	 Activo)
	 VALUES(
	 @Concepto,
	 @FechaVencimiento,
	 @Fecha,
	 @Activo)
END

-- Read en tabla Concepto Cobro
IF OBJECT_ID('CCobroRead') IS NOT NULL
BEGIN 
    DROP PROC CCobroRead
END 
GO
CREATE PROC CCobroRead
	 @ID_CC int
AS 
BEGIN 
    SELECT ID_CC, FechaVencimiento, Fecha, Activo
    FROM   ConceptoCobro  
    WHERE  (ID_CC = @ID_CC) 
END
GO

-- Update en tabla Concepto Cobro
IF OBJECT_ID('CCobroUpdate') IS NOT NULL
BEGIN 
DROP PROC CCobroUpdate
END 
GO
CREATE PROC CCobroUpdate
	 @ID_CC INT,
	 @Concepto VARCHAR(100),
	 @FechaVencimiento DATE,
	 @Fecha DATE,
	 @Activo BIT
AS 
BEGIN 
UPDATE ConceptoCobro
SET  Concepto = @Concepto,
	 FechaVencimiento = @FechaVencimiento,
	 Fecha	= @Fecha,
	 Activo = @Activo
WHERE  (ID_CC = @ID_CC)
END
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
BEGIN 
DELETE
FROM   ConceptoCobro
WHERE  ID_CC = @ID_CC
END
GO