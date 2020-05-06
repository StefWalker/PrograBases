
-- CRUD  Concepto Cobro Fijo
-- Creacion de tabla Concepto Cobro Fijo

USE [ProyectoBases]

BEGIN
DROP TABLE CC_Fijo 
END
GO
BEGIN
	CREATE TABLE CC_Fijo
	(
	  ID_Fijo INT PRIMARY KEY REFERENCES ConceptoCobro(ID_CC) NOT NULL,
	  Monto MONEY NOT NULL
	);
END

-- Insert en tabla Concepto Cobro Fijo
IF OBJECT_ID('CCFijoInsert') IS NOT NULL
BEGIN 
DROP PROC CCFijoInsert 
END
GO
CREATE PROCEDURE CCFijoInsert
	 @ID_Fijo INT,
	 @Monto MONEY
AS
BEGIN
INSERT INTO CC_Fijo(
	 ID_Fijo,
	 Monto)
	 VALUES(
	 @ID_Fijo,
	 @Monto)
END

-- Read en tabla Concepto Cobro Fijo
IF OBJECT_ID('CCFijoRead') IS NOT NULL
BEGIN 
    DROP PROC CCFijoRead
END 
GO
CREATE PROC CCFijoRead
	@ID_Fijo int
AS 
BEGIN 
    SELECT ID_Fijo, Monto
    FROM   CC_Fijo  
    WHERE  (ID_Fijo = @ID_Fijo) 
END
GO

-- Update en tabla Concepto Cobro Fijo
IF OBJECT_ID('CCFijoUpdate') IS NOT NULL
BEGIN 
DROP PROC CCFijoUpdate
END 
GO
CREATE PROC CCFijoUpdate
	 @ID_Fijo int,
	 @Monto MONEY
AS 
BEGIN 
UPDATE CC_Fijo
SET  Monto = @Monto
WHERE  (ID_Fijo = @ID_Fijo)
END
GO

-- Delete en tabla Concepto Cobro Fijo
IF OBJECT_ID('CCFijoDelete') IS NOT NULL
BEGIN 
DROP PROC CCFijoDelete
END 
GO
CREATE PROC CCFijoDelete 
    @ID_Fijo int
AS 
BEGIN 
DELETE
FROM   CC_Fijo
WHERE  ID_Fijo = @ID_Fijo
END
GO