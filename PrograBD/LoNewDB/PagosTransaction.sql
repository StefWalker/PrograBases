
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
CREATE PROC [dbo].[PagosTransaction] @funcion int
AS  
BEGIN
	Declare @TransactionName varchar(20) = 'Transaction1';
	IF(@funcion = 1)
		BEGIN
			BEGIN TRANSACTION-- @TransactionName

					SET NOCOUNT ON 
					SET XACT_ABORT ON
						DECLARE @TOTAL money
						DECLARE @IDComprobante int, @IDRecibo int
						DECLARE @contador int, @i int
						Set @i=1
						Set @TOTAL=0
						set @contador = (Select max(id) from tmp)


						INSERT INTO Comprobante(Fecha,Monto,NumFinca)
									SELECT GETDATE(),0,Propiedad.NumPropiedad From Recibos inner join Propiedad on Propiedad.ID_Propiedad = Recibos.ID_Propiedad
									SET @idComprobante = IDENT_CURRENT('[dbo].[Comprobante]')

						while (@i <= @contador)
							BEGIN
								Set @IDRecibo = (Select ID_Recibo FROM Recibos INNER JOIN tmp on tmp.idRecibo = Recibos.ID_Recibo where tmp.id = @i)

								IF((Select Recibos.FechaVencimiento From Recibos where @IDRecibo = Recibos.ID_Recibo) > GETDATE())
									BEGIN
										SET @TOTAL = @TOTAL + (Select (Recibos.Monto*Intereses_Moratorios.Monto/365)*ABS(DATEDIFF(d,FechaVencimiento,GETDATE())) FROM Recibos 
																INNER JOIN Intereses_Moratorios ON Recibos.ID_Concepto = Intereses_Moratorios.ID_IM)
										INSERT INTO Recibos(ID_Propiedad, ID_Concepto,Fecha,Monto,Estado)
											Select Recibos.ID_Propiedad, ID_Concepto, GETDATE(), @TOTAL, 0 FROM Recibos where @IDRecibo = Recibos.ID_Recibo
									END
								ELSE
									BEGIN
										SET @TOTAL = @TOTAL + (Select Recibos.Monto FROM Recibos where @IDRecibo = Recibos.ID_Recibo)
									END
								INSERT INTO ReciboXComprobante(ID_Comprobante, ID_Recibo)
								Select @IDComprobante, @IDRecibo 

								Set @i = @i+1
					
							END 

						Update Comprobante
						Set Monto = @TOTAL

			END
	IF(@funcion = 2)
		BEGIN
			ROLLBACK --TRAN @TransactionName;
		END
	IF(@funcion = 3)
		BEGIN
			COMMIT --TRAN @TransactionName;
		END

	DELETE FROM tmp;
END

		
