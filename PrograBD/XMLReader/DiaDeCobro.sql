

use ProyectoBases

IF OBJECT_ID('DiaDeCobro') IS NOT NULL
BEGIN 
DROP PROC DiaDeCobro 
END
GO
CREATE PROCEDURE DiaDeCobro
	 @inDia INT,
	 @inFecha DATE,
	 @monto money = null
AS
BEGIN TRY 
	
	SET @monto = (Select monto FROM CC_Fijo
			INNER JOIN	ConceptoCobro on ConceptoCobro.ID_CC = CC_Fijo.ID_Fijo
			WHERE Day(ConceptoCobro.DiaCobro) = @inDia)

	if(@monto = null or @monto = 0)
	begin
		if(@inDia = 9 or @inDia = 5)
			begin
				SET @monto = (Select (CC_Porcentual.Porcentaje * Propiedad.Valor) FROM Propiedad
					INNER JOIN Pro_x_CC ON Propiedad.ID_Propiedad = Pro_x_CC.ID_Propiedad
					INNER JOIN ConceptoCobro ON ConceptoCobro.ID_CC = Pro_x_CC.ID_CC
					INNER JOIN CC_Porcentual ON ConceptoCobro.ID_CC = CC_Porcentual.ID_Por
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
			end
		else 
			begin
				SET @monto = (Select (Propiedad.M3Acumulados - Propiedad.M3AcumuladosUltimoRecibo)*CC_ConsumoAgua.Valor_m3 FROM Propiedad
				INNER JOIN Pro_x_CC ON Propiedad.ID_Propiedad = Pro_x_CC.ID_Propiedad
				INNER JOIN ConceptoCobro ON ConceptoCobro.ID_CC = Pro_x_CC.ID_CC
				INNER JOIN CC_ConsumoAgua ON ConceptoCobro.ID_CC = CC_ConsumoAgua.ID_Con
					WHERE Day(ConceptoCobro.DiaCobro) = @inDia)

				if(@monto < (Select CC_ConsumoAgua.MontoMinimoRecibo FROM CC_ConsumoAgua))
					begin
						Set @monto = (Select CC_ConsumoAgua.MontoMinimoRecibo FROM CC_ConsumoAgua)
					end

				Insert INTO Recibos (ID_Propiedad,
										ID_Concepto,
										Fecha,
										Monto,
										Estado)
				Select Propiedad.ID_Propiedad, ConceptoCobro.ID_CC, @inFecha, @monto , 0 FROM Propiedad
					INNER JOIN Pro_x_CC ON Propiedad.ID_Propiedad = Pro_x_CC.ID_Propiedad
					INNER JOIN ConceptoCobro ON ConceptoCobro.ID_CC = Pro_x_CC.ID_CC
						WHERE Day(ConceptoCobro.DiaCobro) = @inDia
			end
	end
	else
		begin
			Insert INTO Recibos (ID_Propiedad,
								ID_Concepto,
								Fecha,
								Monto,
								Estado)
			Select Propiedad.ID_Propiedad, ConceptoCobro.ID_CC, @inFecha, @monto , 0 FROM Propiedad
				INNER JOIN Pro_x_CC ON Propiedad.ID_Propiedad = Pro_x_CC.ID_Propiedad
				INNER JOIN ConceptoCobro ON ConceptoCobro.ID_CC = Pro_x_CC.ID_CC
					WHERE Day(ConceptoCobro.DiaCobro) = @inDia
		end
END TRY 
BEGIN CATCH
	RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
