USE [ProyectoBases]
GO
IF OBJECT_ID('[dbo].[CorteAgua]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[CorteAgua]  
END 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[CorteAgua] @inFecha DATE
AS  	
	BEGIN
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON 
			DECLARE @idPropiedades TABLE(id INT IDENTITY(1,1),idPropiedad int,idCC INT,c int)
			DECLARE @idMenor INT, @idMayor INT, @id int
			BEGIN TRAN
				INSERT INTO @idPropiedades(idPropiedad, idCC, c)
				SELECT R.ID_Propiedad,R.ID_Concepto, COUNT(*)
				FROM Recibos R
				WHERE R.Estado = 0 AND R.ID_Concepto = 1
				AND NOT EXISTS (SELECT ID_Recibo FROM Recibos WHERE ID_Concepto = 10 AND ID_Propiedad = R.ID_Propiedad)
				GROUP BY ID_Propiedad, R.ID_Concepto
				HAVING COUNT(*) > 1
				
				SELECT @idMenor = MIN(id), @idMayor = MAX(id) FROM @idPropiedades
				
				WHILE @idMenor <= @idMayor
				BEGIN
					INSERT INTO Recibos(ID_Concepto, Monto, Estado, ID_Propiedad, Fecha, FechaVencimiento)
					SELECT 10, CCF.Monto, 0, P.idPropiedad, @inFecha, DATEADD(D,CC.DiaVencimiento,@inFecha)
					FROM @idPropiedades P
					INNER JOIN ConceptoCobro CC ON CC.ID_CC = 10
					INNER JOIN CC_Fijo CCF ON CCF.ID_Fijo = 10
					WHERE P.id = @idMenor

					SET @id = IDENT_CURRENT('[dbo].[Recibos]')

					INSERT INTO ReciboReconexion(ID_Recibo)
					SELECT @id

					INSERT INTO Corte(Fecha,ID_Propiedad,ID_Recibo)
					SELECT @inFecha,idP.idPropiedad,@id
					FROM @idPropiedades idP
					WHERE idP.id =	@idMenor
					
					SET @idMenor = @idMenor+1
				END
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 554004,'Error: No se ha podido procesas las cortas de agua',1;
		END CATCH	
	END
