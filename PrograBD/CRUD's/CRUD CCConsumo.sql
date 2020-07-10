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
	  Valor_m3 Decimal NOT NULL,
	  MontoMinimoRecibo INT NOT NULL
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
	 @inID_Cons INT,
	 @inValor_m3 Decimal
AS
BEGIN TRY
INSERT INTO CC_ConsumoAgua(
	 ID_Con,
	 Valor_m3)
	 VALUES(
	 @inID_Cons,
	 @inValor_m3)
END TRY
BEGIN CATCH
	RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO

-- Read en tabla Concepto Cobro Consumo
IF OBJECT_ID('CCConsumoRead') IS NOT NULL
BEGIN 
    DROP PROC CCConsumoRead
END 
GO
CREATE PROC CCConsumoRead
	@inID_Cons int
AS 
BEGIN TRY
    SELECT ID_Con, Valor_m3
    FROM   CC_ConsumoAgua
    WHERE  (ID_Con = @inID_Cons) 
END TRY
BEGIN CATCH
	RAISERROR('Error en la datos no validos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO

-- Update en tabla Concepto Cobro Consumo
IF OBJECT_ID('CCConsumoUpdate') IS NOT NULL
BEGIN 
DROP PROC CCConsumoUpdate
END 
GO
CREATE PROC CCConsumoUpdate
	 @inID_Cons int,
	 @inValor_m3 Decimal
AS 
BEGIN TRY
UPDATE CC_ConsumoAgua
SET  Valor_m3 = @inValor_m3
WHERE  (ID_Con = @inID_Cons)
END TRY
BEGIN CATCH
	RAISERROR('Error en la actualizacion de datos fallida', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO

-- Delete en tabla Concepto Cobro Consumo
IF OBJECT_ID('CCConsumoDelete') IS NOT NULL
BEGIN 
DROP PROC CCConsumoDelete
END 
GO
CREATE PROC CCConsumoDelete 
    @inID_Cons int
AS 
BEGIN TRY
DELETE
FROM   CC_ConsumoAgua
WHERE  ID_Con = @inID_Cons
END TRY
BEGIN CATCH
	RAISERROR('Error en la eliminacion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO