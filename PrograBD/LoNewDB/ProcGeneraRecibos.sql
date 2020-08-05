USE [ProyectoBases]
GO
IF OBJECT_ID('[dbo].[RecibosGenerator]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[RecibosGenerator]  
END 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[RecibosGenerator] @inFecha DATE
AS  	
	BEGIN
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON
			DECLARE @dia int
			SET @dia  = DAY(@inFecha)
			BEGIN TRAN
				INSERT INTO Recibos(ID_Concepto,
									Monto,
									Estado,
									ID_Propiedad,
									Fecha,
									FechaVencimiento)
				SELECT 
					CC.ID_CC,
					CASE	WHEN (CC.TipoCC = 'CC Fijo') THEN CCF.Monto
							WHEN (CC.TipoCC = 'CC Porcentaje') THEN P.valor/100*CCPo.Porcentaje
							WHEN (CC.ID_CC = 1) THEN 
									CASE WHEN (P.M3Acumulados-P.M3AcumuladosUltimoRecibo)*CCC.Valor_m3>CCC.montoMinimoRecibo
									THEN (P.M3Acumulados-P.M3AcumuladosUltimoRecibo)*CCC.Valor_m3
									ELSE CCC.MontoMinimoRecibo END
							END,
					0,
					P.ID_Propiedad,
					@inFecha,
					DATEADD(d,CC.DiaVencimiento,@inFecha)
				FROM Pro_x_CC CCP 
				INNER JOIN ConceptoCobro CC ON CCP.ID_CC = CC.ID_CC
				INNER JOIN Propiedad P ON CCP.ID_Propiedad = P.ID_Propiedad
				FULL OUTER JOIN CC_Fijo CCF ON CCF.ID_Fijo = CC.ID_CC
				FULL OUTER JOIN CC_Porcentual CCPo ON CCPo.ID_Por = CC.ID_CC
				FULL OUTER JOIN CC_ConsumoAgua CCC ON CCC.ID_Con = CC.ID_CC
				WHERE CC.DiaCobro = @dia

				UPDATE Propiedad
				SET M3AcumuladosUltimoRecibo = M3acumulados
				FROM Propiedad P
				INNER JOIN Pro_x_CC CCP ON CCP.id_Propiedad = P.ID_Propiedad
				INNER JOIN ConceptoCobro CC ON CC.ID_CC = CCP.ID_CC
				WHERE CC.ID_CC = 1 AND CC.DiaCobro = @dia AND P.M3AcumuladosUltimoRecibo != P.M3Acumulados
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 550834,'Error: No se ha podido generar los recibos',1;
		END CATCH	
	END