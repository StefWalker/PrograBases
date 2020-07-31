USE [ProyectoBases]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[PagosTransaction]

AS

BEGIN TRAN


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
			DECLARE @IDComprobante int
			DECLARE @contador int, @i int
			set @contador = (Select max(id) from tmp)

			while (i <= @contador)
				BEGIN
				
					IF((Select Recibos.FechaVencimiento From Recibos where Recibos.ID_Recibo = @i) > GETDATE())
					
				END

		END TRY
		BEGIN CATCH
			print error_message()
		END CATCH
	END


	