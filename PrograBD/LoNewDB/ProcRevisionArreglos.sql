USE [ProyectoBases]
GO
IF OBJECT_ID('[dbo].[RevisionArreglos]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[RevisionArreglos]  
END 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[RevisionArreglos] @fechaActual DATE
AS   
	BEGIN
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON

		DECLARE @ID_Propiedad INT, @ID_Comprobante INT, @MontoInicial MONEY, @Saldo MONEY, 
				@TasaInteres MONEY, @Cuota MONEY, @ap INT, @interesMes MONEY, @amortizacion MONEY, 
				@ID_Recibo INT, @plazo INT, @fechaMovimiento Date


		DECLARE @idMenor INT, @idMayor INT
		SELECT @idMenor = min(ID_AP), @idMayor=max(ID_AP) FROM AP

		While @idMenor<=@idMayor
		BEGIN

			SET @fechaMovimiento = (Select Max(Fecha) FROM MovimientoAP Where ID_AP = @idMenor)
			IF(@fechaActual >= DATEADD(MONTH, 1, @fechaMovimiento))
				BEGIN
					Set @ID_Propiedad = (SELECT A.ID_Propiedad FROM AP A where A.ID_AP = @idMenor)
					SET @MontoInicial = (SELECT A.MontoInicial FROM AP A WHERE A.ID_AP = @idMenor)
					SET @Saldo = (SELECT A.Saldo FROM AP A WHERE A.ID_AP = @idMenor)
					SET @TasaInteres = (Select (Valor/100) FROM ConfigTable Where Tipo = 'Decimal')
					SET @Cuota = (SELECT A.Cuota FROM AP A WHERE A.ID_AP = @idMenor)

					SET @ID_Comprobante = (SELECT A.ID_Comprobante FROM AP A WHERE A.ID_AP = @idMenor)
					SET @ap = (SELECT A.ID_AP FROM AP A WHERE A.ID_AP = @idMenor)

					Update AP
					Set Saldo = @Saldo - @Cuota
					WHERE ID_AP = @idMenor

					SET @Saldo = (SELECT A.Saldo FROM AP A WHERE A.ID_AP = @idMenor)

					SET @interesMes = @Saldo * @TasaInteres/12
					SET @amortizacion = @Cuota - @interesMes

					INSERT INTO Recibos(ID_Propiedad, 
										ID_Concepto, 
										Fecha, 
										Monto, 
										Estado,		
										FechaVencimiento)
					SELECT @ID_Propiedad, 12, @fechaActual, @Cuota, 0, @fechaActual

					SET @ID_Recibo = IDENT_CURRENT('[dbo].[Recibos]')

					SET @plazo = (Select MIN(plazoResta) From MovimientoAP Where ID_AP = @ap)

					INSERT INTO MovimientoAP(ID_AP, 
								TipoMov, 
								InteresMes, 
								Amortizacion, 
								plazoResta, 
								Fecha, 
								ID_Recibo)
					SELECT @ap, 2, @interesMes, @amortizacion, @plazo - 1, @fechaActual, @ID_Recibo FROM AP A where A.ID_AP = @idMenor

				END
			SET @idMenor = @idMenor + 1
		END

		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW --600021, 'Error: No se ha podido crear los arreglos.',1;
		END CATCH
END