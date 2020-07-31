
USE [ProyectoBases]
GO
IF OBJECT_ID('[dbo].[PagosTransaction]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[PagosTransaction]  
END 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PagosTransaction]
AS   
	BEGIN
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON
			DECLARE @TOTAL money
			DECLARE @IDComprobante int, @IDRecibo int
			DECLARE @contador int, @i int
			set @contador = (Select max(id) from tmp)


			INSERT INTO Comprobante(Fecha,Monto)
						SELECT GETDATE(),0
						SET @idComprobante = IDENT_CURRENT('[dbo].[ComprobantePago]')

			while (@i <= @contador)
				BEGIN
					Set @IDRecibo = (Select ID_Recibo FROM Recibos INNER JOIN tmp on tmp.idRecibo = Recibos.ID_Recibo where tmp.id = @i)

					IF((Select Recibos.FechaVencimiento From Recibos where @IDRecibo = Recibos.ID_Recibo) > GETDATE())
						BEGIN
							SET @TOTAL = @TOTAL + (Select (Recibos.Monto*Intereses_Moratorios.Monto/365)*ABS(DATEDIFF(d,FechaVencimiento,GETDATE())) FROM Recibos 
													INNER JOIN Intereses_Moratorios ON Recibos.ID_Concepto = Intereses_Moratorios.ID_IM)
							INSERT INTO RecibosMoratorios(ID_Propiedad, ID_Concepto,Fecha,Monto,Estado)
								Select Recibos.ID_Propiedad, ID_Concepto, GETDATE(), @TOTAL, 0 FROM Recibos where @IDRecibo = Recibos.ID_Recibo
						END
					ELSE
						BEGIN
							SET @TOTAL = @TOTAL + (Select Recibos.Monto FROM Recibos where @IDRecibo = Recibos.ID_Recibo)
						END
					INSERT INTO ReciboXComprobante(ID_Comprobante, ID_Recibo)
					Select @IDComprobante, @IDRecibo
					
				END

			Update Comprobante
			Set Monto = @TOTAL

			TRUNCATE TABLE tmp;

			Return @idComprobante


		END TRY
		BEGIN CATCH
			print error_message()
		END CATCH
	END


	