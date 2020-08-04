USE ProyectoBases
go
Create PROC CrearReciboMoratorio
AS
	BEGIN
	DECLARE @contador int, @i int
	DECLARE @IDComprobante INT
	DECLARE @IDRecibo INT
	DECLARE @Monto Money
	DECLARE @ReciboActual int
	DECLARE @ID_Concepto int 


	SET @ID_Concepto = (Select @ID_Concepto FROM ConceptoCobro WHERE ConceptoCobro.Concepto='Interes Moratorio')
	Set @i=1
	set @contador = (Select max(id) from tmp)
	END

BEGIN Try
	while (@i <= @contador)
	BEGIN
		Set @IDRecibo = (Select ID_Recibo FROM Recibos INNER JOIN tmp on tmp.idRecibo = Recibos.ID_Recibo where tmp.id = @i)

		IF((Select Recibos.FechaVencimiento From Recibos where @IDRecibo = Recibos.ID_Recibo) > GETDATE())
		BEGIN
			SET @Monto = (Select (Recibos.Monto*Intereses_Moratorios.Monto/365)*ABS(DATEDIFF(d,FechaVencimiento,GETDATE())) FROM Recibos 
			INNER JOIN Intereses_Moratorios ON Recibos.ID_Concepto = Intereses_Moratorios.ID_IM)
			
			INSERT INTO Recibos(
				ID_Propiedad, 
				ID_Concepto,
				Fecha,
				Monto,
				Estado)
			
			Select Recibos.ID_Propiedad,@ID_Concepto , GETDATE(), @Monto, 0 
			FROM Recibos where @IDRecibo = Recibos.ID_Recibo

			Set @ReciboActual =  IDENT_CURRENT('[dbo].[Recibos]')INSERT INTO tmp(idRecibo)
			Select @ReciboActual
			Set @i = @i+1
		
		END
	END 

END Try
Begin Catch 
	RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	
END CATCH
GO			