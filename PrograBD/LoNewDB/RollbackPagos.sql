USE [ProyectoBases]
GO
IF OBJECT_ID('[dbo].[RollBackPagos]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[RollBackPagos]
END 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[RollBackPagos]
AS 
BEGIN
	Declare @i INT 
	Declare @contador INT 
	Declare @IDRecibo INT 
	Set @i=1
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
			
END 
