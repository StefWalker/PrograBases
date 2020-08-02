USE [ProyectoBases]
GO
IF OBJECT_ID('[dbo].[ProcReconexionAgua]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[ProcReconexionAgua]  
END 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ProcReconexionAgua] @inFecha DATE
AS  	
	BEGIN
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON 
			DECLARE @idPropiedades TABLE(id INT IDENTITY(1,1),idPropiedad int)
			DECLARE @idMenor INT, @idMayor INT
			BEGIN TRAN
				INSERT INTO @idPropiedades(idPropiedad)
				SELECT DISTINCT R.ID_Propiedad
				FROM Recibos R
				WHERE 1 = ALL(SELECT Estado FROM Recibos WHERE ID_Propiedad = R.ID_Propiedad)
				AND NOT EXISTS(SELECT * FROM Reconexion WHERE ID_Propiedad = R.ID_Propiedad)
				AND EXISTS(SELECT * FROM Corte WHERE ID_Propiedad = R.id_Propiedad)
				AND (R.ID_Concepto = 1 OR R.ID_Concepto = 10)

				SELECT @idMenor = MIN(id), @idMayor = MAX(id) FROM @idPropiedades
				WHILE @idMenor<=@idMayor
				BEGIN
					INSERT INTO Reconexion(Fecha,ID_Propiedad,ID_Recibo)
					SELECT @inFecha,idP.idPropiedad,R.ID_Recibo
					FROM @idPropiedades idP
					INNER JOIN Recibos R ON R.ID_Propiedad = idP.idPropiedad
					WHERE idP.id = @idMenor AND R.ID_Concepto = 10
					SET @idMenor = @idMenor+1
				END
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 55004,'Error: No se ha podido procesar reconexiones',1;
		END CATCH	
	END
