USE [ProyectoBases]
GO
IF OBJECT_ID('[dbo].[ReturnPagos]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[ReturnPagos]
END 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ReturnPagos]
AS
BEGIN
	SELECT C.ID_Comprobante,  C.Fecha,  C.Monto,  C.NumFinca FROM Comprobante AS C
	INNER JOIN ReciboXComprobante ON  C.ID_Comprobante = ReciboXComprobante.ID_Comprobante
	INNER JOIN tmp ON ReciboXComprobante.ID_Recibo = tmp.idRecibo
END