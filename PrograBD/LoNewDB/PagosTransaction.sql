USE [ProyectoBases]
GO
/****** Object:  StoredProcedure [dbo].[PagosTransaction]    Script Date: 5/8/2020 07:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[PagosTransaction] 
AS  
Begin 
BEGIN Try 
	DECLARE @Transaction Varchar(20) = 'Transaction1'
	BEGIN TRAN @Transaction
	BEGIN
		SET NOCOUNT ON 
		SET XACT_ABORT ON
		DECLARE @TOTAL money
		DECLARE @IDComprobante int, @IDRecibo int
		DECLARE @contador int, @i int
		Set @i=(Select min(id) from tmp)
		Set @TOTAL=0
		Set @contador = (Select max(id) from tmp)

---Inserta el comprobante

		INSERT INTO Comprobante(Fecha,Monto,NumFinca)
		SELECT GETDATE(),0,Propiedad.NumPropiedad From Recibos inner join Propiedad on Propiedad.ID_Propiedad = Recibos.ID_Propiedad
		SET @IDComprobante = IDENT_CURRENT('[dbo].[Comprobante]')

----Enlaza los recibos con el comprobante 

			while (@i <= @contador)
			BEGIN
				Set @IDRecibo = (Select ID_Recibo FROM Recibos INNER JOIN tmp on tmp.idRecibo = Recibos.ID_Recibo where tmp.id = @i)
										
				SET @TOTAL = @TOTAL + (Select Recibos.Monto FROM Recibos where @IDRecibo = Recibos.ID_Recibo)
		
					UPDATE Recibos 
					SET	Estado = 1
					WHERE  @IDRecibo = Recibos.ID_Recibo
				
				INSERT INTO ReciboXComprobante
				(ID_Comprobante, 
				ID_Recibo)			
				Select @IDComprobante, @IDRecibo 
				Set @i = @i+1
					
			END
		END
--Cambia el monto de comprobante despues de haber sumado los montos
		Update Comprobante
		Set Monto = @TOTAL
		Commit Tran @Transaction
		DELETE FROM tmp;
	END TRY 
	BEGIN CATCH 
	IF @@TRANCOUNT >0
			ROLLBACK TRAN
		PRINT('Hubo un error, logro terminar la Confirmacion de AP');
		RETURN @@ERROR * -1
	END CATCH 

END;

		
