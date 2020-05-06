-- CRUD  Concepto Cobro Consumo
-- Creacion de tabla Concepto Cobro Consumo

USE [ProyectoBases]

BEGIN
DROP TABLE CC_Consumo 
END
GO
BEGIN
	CREATE TABLE CC_Consumo
	(
	  ID_Cons INT PRIMARY KEY REFERENCES ConceptoCobro(ID_CC) NOT NULL,
	  Valor_m3 MONEY NOT NULL
	);
END

-- Insert en tabla Concepto Cobro Fijo
IF OBJECT_ID('CCConsumoInsert') IS NOT NULL
BEGIN 
DROP PROC CCConsumoInsert 
END
GO
CREATE PROCEDURE CCConsumoInsert
	 @ID_Cons INT,
	 @Valor_m3 MONEY
AS
BEGIN
INSERT INTO CC_Consumo(
	 ID_Cons,
	 Valor_m3)
	 VALUES(
	 @ID_Cons,
	 @Valor_m3)
END

-- Read en tabla Concepto Cobro Consumo
IF OBJECT_ID('CCConsumoRead') IS NOT NULL
BEGIN 
    DROP PROC CCConsumoRead
END 
GO
CREATE PROC CCConsumoRead
	@ID_Cons int
AS 
BEGIN 
    SELECT ID_Cons, Valor_m3
    FROM   CC_Consumo
    WHERE  (ID_Cons = @ID_Cons) 
END
GO

-- Update en tabla Concepto Cobro Consumo
IF OBJECT_ID('CCConsumoUpdate') IS NOT NULL
BEGIN 
DROP PROC CCConsumoUpdate
END 
GO
CREATE PROC CCConsumoUpdate
	 @ID_Cons int,
	 @Valor_m3 MONEY
AS 
BEGIN 
UPDATE CC_Consumo
SET  Valor_m3 = @Valor_m3
WHERE  (ID_Cons = @ID_Cons)
END
GO

-- Delete en tabla Concepto Cobro Consumo
IF OBJECT_ID('CCConsumoDelete') IS NOT NULL
BEGIN 
DROP PROC CCConsumoDelete
END 
GO
CREATE PROC CCConsumoDelete 
    @ID_Cons int
AS 
BEGIN 
DELETE
FROM   CC_Consumo
WHERE  ID_Cons = @ID_Cons
END
GO