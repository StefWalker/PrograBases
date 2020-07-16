
use ProyectoBases

IF OBJECT_ID('DiaDeCobro') IS NOT NULL
BEGIN 
DROP PROC DiaDeCobro 
END
GO
CREATE PROCEDURE DiaDeCobro
	 @inDia INT,
	 @inFecha DATE,
	 @monto money = 0
AS
BEGIN TRY

	DECLARE @contador int = 0
	SET @inDia = @inDia + 1
	SET @monto = (Select monto FROM CC_Fijo
			INNER JOIN	ConceptoCobro on ConceptoCobro.ID_CC = CC_Fijo.ID_Fijo
			WHERE Day(ConceptoCobro.DiaCobro) = @inDia)

	Insert INTO Recibos (ID_Propiedad,
						ID_Concepto,
						Fecha,
						Monto,
						Estado)
	Select Propiedad.ID_Propiedad, ConceptoCobro.ID_CC, @inFecha, @monto , 0 FROM Propiedad
		INNER JOIN Pro_x_CC ON Propiedad.ID_Propiedad = Pro_x_CC.ID_Propiedad
		INNER JOIN ConceptoCobro ON ConceptoCobro.ID_CC = Pro_x_CC.ID_CC
			WHERE Day(ConceptoCobro.DiaCobro) = @inDia

END TRY 
BEGIN CATCH
	RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
