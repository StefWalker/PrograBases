

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

	DECLARE @contador int = 0
	SET @inDia = @inDia + 1
	SET @monto = (Select monto FROM CC_Fijo
			INNER JOIN	ConceptoCobro on ConceptoCobro.ID_CC = CC_Fijo.ID_Fijo
			WHERE Day(ConceptoCobro.DiaCobro) = @inDia)

	if(@inDia = 10)
	begin

		While(@contador < (Select MAX(ID_Propiedad) from Propiedad))
		begin
			SET @monto = (Select (((Select CC_Porcentual.Porcentaje from CC_Porcentual where CC_Porcentual.ID_Por = 3) * Propiedad.Valor)/100) FROM Propiedad
						INNER JOIN Pro_x_CC ON Propiedad.ID_Propiedad = Pro_x_CC.ID_Propiedad
							where Pro_x_CC.ID_CC = 3 and Propiedad.ID_Propiedad = @contador)


			Insert INTO Recibos (ID_Propiedad,
								ID_Concepto,
								Fecha,
								Monto,
								Estado)
					values( @contador, 3, @inFecha, @monto , 0 )
			set @contador = @contador + 1
		end
	end
	if(@inDia = 6)
	begin 
			
		While(@contador < (Select MAX(ID_Propiedad) from Propiedad))
		begin
			SET @monto = (Select (((Select CC_Porcentual.Porcentaje from CC_Porcentual where CC_Porcentual.ID_Por = 6) * Propiedad.Valor)/100) FROM Propiedad
						INNER JOIN Pro_x_CC ON Propiedad.ID_Propiedad = Pro_x_CC.ID_Propiedad
							where Pro_x_CC.ID_CC = 6 and Propiedad.ID_Propiedad = @contador)


			Insert INTO Recibos (ID_Propiedad,
								ID_Concepto,
								Fecha,
								Monto,
								Estado)
					values( @contador, 6, @inFecha, @monto , 0 )
			set @contador = @contador + 1
		end
	end
	if(@inDia = 26)
	begin 
				
		While(@contador < (Select MAX(ID_Propiedad) from Propiedad))
		begin
			
			SET @monto = (Select (Propiedad.M3Acumulados - Propiedad.M3AcumuladosUltimoRecibo)*CC_ConsumoAgua.Valor_m3 FROM Propiedad
				INNER JOIN Pro_x_CC ON Propiedad.ID_Propiedad = Pro_x_CC.ID_Propiedad
				INNER JOIN CC_ConsumoAgua ON Pro_x_CC.ID_CC = CC_ConsumoAgua.ID_Con
				where Propiedad.ID_Propiedad = @contador and Pro_x_CC.ID_CC = 1)
					

			if(@monto < (Select CC_ConsumoAgua.MontoMinimoRecibo FROM CC_ConsumoAgua))
				begin
						Set @monto = (Select CC_ConsumoAgua.MontoMinimoRecibo FROM CC_ConsumoAgua)
				end
			Insert INTO Recibos (ID_Propiedad,
								ID_Concepto,
								Fecha,
								Monto,
								Estado)
					values( @contador, 1, @inFecha, @monto , 0 )

			set @contador = @contador + 1
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
	print @inDia
END TRY 
BEGIN CATCH
	RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
