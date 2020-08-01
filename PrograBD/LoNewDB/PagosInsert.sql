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
			/*IF NOT(EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'TheSchema' 
                 AND  TABLE_NAME = 'tmp'))
			BEGIN
    --Do Stuff
				Create Table tmp (id int identity(1,1), idRecibo int)
			END
			ELSE*/
				BEGIN
					Insert INTO tmp(idRecibo)
							VALUES(@Recibo)
				END
			END TRY
			BEGIN CATCH
				print error_message()
			END CATCH
	END