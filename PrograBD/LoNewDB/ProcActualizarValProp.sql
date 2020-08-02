USE [ProyectoBases]
GO
IF OBJECT_ID('[dbo].[ProcActualizarValProp]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[ProcActualizarValProp]  
END 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ProcActualizarValProp] @inNuevosValProp ValorPropiedadTipo READONLY, @inFecha DATE
AS   
	BEGIN
		BEGIN TRY
		/*SET NOCOUNT ON 
		SET XACT_ABORT ON
			DECLARE @idMenor INT, @idMayor INT
			SELECT @idMenor = min([id]), @idMayor=max([id]) FROM @inNuevosValProp
			BEGIN TRAN*/
				--WHILE @idMenor<=@idMayor
				--BEGIN
					UPDATE Propiedad
					SET Propiedad.Valor = NVP.nuevoValor,
						Propiedad.Fecha = @inFecha
					FROM Propiedad P
					INNER JOIN @inNuevosValProp NVP ON NVP.numFinca = P.NumPropiedad
					--WHERE NVP.id = @idMenor
			
					--SET @idMenor = @idMenor+1 
				--END
			--COMMIT
		END TRY
		BEGIN CATCH
			/*If @@TRANCOUNT > 0 
				ROLLBACK TRAN;*/
			THROW 600210, 'Error: No se ha podido actualizar la propiedad.',1;
		END CATCH
	END
