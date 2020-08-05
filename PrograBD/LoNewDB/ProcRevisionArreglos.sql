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
CREATE PROC [dbo].[RevisionArreglos] @fecha DATE
AS   
	BEGIN
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON

		DECLARE @ID_Propiedad INT, @ID_Comprobante INT, @MontoInicial MONEY, @Saldo MONEY, @TasaInteres DECIMAL, @Cuota MONEY, @ap INT, @interesMes MONEY, @amortizacion MONEY, @ID_Recibo INT


		DECLARE @idMenor INT, @idMayor INT
		SELECT @idMenor = min([id]), @idMayor=max([id]) FROM @arreglo

		While @idMenor<=@idMayor
		BEGIN

			Set @ID_Propiedad = (SELECT ID_Propiedad FROM Propiedad INNER JOIN @arreglo A ON Propiedad.NumPropiedad = A.numFinca where ID = @idMenor)
			SET @MontoInicial = (SELECT SUM(Monto) FROM Recibos WHERE ID_Propiedad = @ID_Propiedad)
			SET @Saldo = @MontoInicial
			SET @TasaInteres = (Select (Valor/100) FROM ConfigTable Where Tipo = 'Decimal')
			SET @Cuota = (Select @Saldo*(@TasaInteres * POWER((1 + @TasaInteres),A.plazo) / POWER((1+@TasaInteres),A.plazo)-1) From @arreglo A where ID = @idMenor)


			INSERT INTO Comprobante(Fecha, Monto, NumFinca)
			SELECT A.fecha, 0, A.numFinca FROM @arreglo A where ID = @idMenor
	

			SET @ID_Comprobante = IDENT_CURRENT('[dbo].[Comprobante]')
			SET @ap = IDENT_CURRENT('[dbo].[AP]')

			SET @interesMes = @Saldo * @TasaInteres/12
			SET @amortizacion = @Cuota - @interesMes

			INSERT INTO AP(ID_Propiedad,ID_Comprobante,MontoInicial,Saldo,TasaInteres,PlazoInicial,Cuota,FechaCreacion,Activo)
			SELECT @ID_Propiedad, @ID_Comprobante, @MontoInicial, @Saldo, @TasaInteres, A.plazo, @Cuota, A.fecha, 1 FROM @arreglo A where ID = @idMenor

			INSERT INTO Recibos(ID_Propiedad, ID_Concepto, Fecha, Monto, Estado, FechaVencimiento)
			SELECT @ID_Propiedad, 12, A.fecha, @MontoInicial, 1, A.fecha FROM @arreglo A where ID = @idMenor

			SET @ID_Recibo = IDENT_CURRENT('[dbo].[Recibos]')

			INSERT INTO MovimientoAP(ID_AP, TipoMov, InteresMes, Amortizacion, plazoResta, Fecha, ID_Recibo)
			SELECT @ap, 2, @interesMes, @amortizacion, A.plazo, A.fecha, @ID_Recibo FROM @arreglo A where ID = @idMenor

			SET @idMenor = @idMenor + 1

		END

		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW --600021, 'Error: No se ha podido crear los arreglos.',1;
		END CATCH
END