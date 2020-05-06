-- CRUD  Concepto Intereses Monetarios
-- Creacion de tabla Intereses Monetarios

USE [ProyectoBases]

BEGIN
DROP TABLE Intereses_Monetarios 
END
GO
BEGIN
	CREATE TABLE Intereses_Monetarios
	(
	  ID_IM INT PRIMARY KEY REFERENCES ConceptoCobro(ID_CC) NOT NULL,
	  Monto MONEY NOT NULL
	);
END

-- Insert en tabla Intereses Monetarios
IF OBJECT_ID('InteresesInsert') IS NOT NULL
BEGIN 
DROP PROC InteresesInsert 
END
GO
CREATE PROCEDURE InteresesInsert
	 @ID_IM INT,
	 @Monto MONEY
AS
BEGIN
INSERT INTO Intereses_Monetarios(
	 ID_IM,
	 Monto)
	 VALUES(
	 @ID_IM,
	 @Monto)
END

-- Read en tabla Intereses Monetarios
IF OBJECT_ID('InteresesRead') IS NOT NULL
BEGIN 
    DROP PROC InteresesRead
END 
GO
CREATE PROC InteresesRead
	@ID_IM int
AS 
BEGIN 
    SELECT ID_IM, Monto
    FROM   Intereses_Monetarios
    WHERE  (ID_IM = @ID_IM) 
END
GO

-- Update en tabla Intereses Monetarios
IF OBJECT_ID('InteresesUpdate') IS NOT NULL
BEGIN 
DROP PROC InteresesUpdate
END 
GO
CREATE PROC InteresesUpdate
	 @ID_IM int,
	 @Monto MONEY
AS 
BEGIN 
UPDATE Intereses_Monetarios
SET  Monto = @Monto
WHERE  (ID_IM = @ID_IM)
END
GO

-- Delete en tabla Intereses Monetarios
IF OBJECT_ID('InteresesDelete') IS NOT NULL
BEGIN 
DROP PROC InteresesDelete
END 
GO
CREATE PROC InteresesDelete 
    @ID_IM int
AS 
BEGIN 
DELETE
FROM   Intereses_Monetarios
WHERE  ID_IM = @ID_IM
END
GO
