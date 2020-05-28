-- CRUD  Concepto Cobro Consumo
-- Creacion de tabla Concepto Cobro Consumo

USE [ProyectoBases]

BEGIN
DROP TABLE CC_ConsumoAgua 
END
GO
BEGIN
	CREATE TABLE CC_ConsumoAgua
	(
	  ID_Con INT PRIMARY KEY REFERENCES ConceptoCobro(ID_CC) NOT NULL,
	  Valor_m3 MONEY NOT NULL
	);
END

USE [ProyectoBases]
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
INSERT INTO CC_ConsumoAgua(
	 ID_Con,
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
    SELECT ID_Con, Valor_m3
    FROM   CC_ConsumoAgua
    WHERE  (ID_Con = @ID_Cons) 
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
UPDATE CC_ConsumoAgua
SET  Valor_m3 = @Valor_m3
WHERE  (ID_Con = @ID_Cons)
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
FROM   CC_ConsumoAgua
WHERE  ID_Con = @ID_Cons
END
GO