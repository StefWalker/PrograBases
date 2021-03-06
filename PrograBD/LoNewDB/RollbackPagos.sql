USE [ProyectoBases]
GO
/****** Object:  StoredProcedure [dbo].[RollBackPagos]    Script Date: 5/8/2020 07:44:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[RollBackPagos]
AS 
BEGIN Try 
	Declare @i INT 
	Declare @contador INT 
	Declare @IDRecibo INT 
	Set @i=(Select min(id) from tmp)
	Set @contador = (Select max(id) from tmp)
	while (@i <= @contador)
		BEGIN
			Set @IDRecibo = (Select ID_Recibo FROM Recibos INNER JOIN tmp on tmp.idRecibo = Recibos.ID_Recibo where tmp.id = @i)
			UPDATE Recibos 
		    SET	Estado = 3  
			WHERE  @IDRecibo = Recibos.ID_Recibo AND Recibos.ID_Concepto= 11
			Set @i = @i+1
					
		END
		DELETE FROM tmp;
END TRY 
Begin Catch 
	RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
End Catch 
