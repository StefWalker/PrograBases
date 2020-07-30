USE [ProyectoBases]
GO
IF OBJECT_ID('[dbo].[ProcesaConsumo]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[ProcesaConsumo]  
END 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ProcesaConsumo] @inConsumo ConsumoTipo READONLY
AS 
	BEGIN 
		BEGIN TRY 
		SET NOCOUNT ON 
		SET XACT_ABORT ON  
			DECLARE @idMenor INT, @idMayor INT
			SELECT @idMenor = min([id]), @idMayor=max([id]) FROM @inConsumo
			BEGIN TRAN
				WHILE @idMenor<=@idMayor
				BEGIN
					INSERT INTO TransConsumo(Fecha, Monto, LecturaM3, NuevoM3, ID_Propiedad, Tipo)
					SELECT 
						C.Fecha,
						CASE WHEN (C.idTipo = 1) THEN C.LecturaM3-P.M3Acumulados
						ELSE C.LecturaM3
						END,
						CASE WHEN (C.idTipo = 1) THEN C.LecturaM3
						ELSE NULL
						END,
						CASE WHEN (C.idTipo = 1) THEN C.LecturaM3
							 WHEN (C.idTipo = 2) THEN P.M3acumulados-C.LecturaM3
							 ELSE P.M3acumulados+C.LecturaM3
						END,
						P.ID_Propiedad,
						C.idTipo
					FROM Propiedad P
					INNER JOIN @inConsumo C ON C.numFinca = P.NumPropiedad
					WHERE C.id = @idMenor

					UPDATE [Propiedad]
					SET M3acumulados = CASE WHEN (C.idTipo = 1) THEN C.LecturaM3
												WHEN (C.idTipo = 2) THEN M3acumulados-C.LecturaM3
												ELSE M3acumulados+C.LecturaM3
					END
					FROM [Propiedad] P
					INNER JOIN @inConsumo C ON C.numFinca = P.NumPropiedad
					WHERE C.id = @idMenor

					SET @idMenor = @idMenor+1 
				END
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 92039, 'Error: no se ha podido procesar los consumos de agua.',1
		END CATCH;
	END
