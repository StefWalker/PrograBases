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
CREATE PROC [dbo].[RollBackPagos] @Value int
AS  
	begin 
		IF(@Value = 1)Begin ROLLBACK END
		Else
			BEGIN COMMIT END
	end