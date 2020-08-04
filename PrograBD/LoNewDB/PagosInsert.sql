USE [ProyectoBases]
GO
IF OBJECT_ID('[dbo].[PagosInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[PagosInsert]  
END 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PagosInsert] @Recibo int
AS   
	BEGIN
		BEGIN TRY
				BEGIN
					Insert INTO tmp(idRecibo)
							VALUES(@Recibo)
							return 1
				END
			END TRY
			BEGIN CATCH
				print error_message()
				return -1
			END CATCH
END
GO





		