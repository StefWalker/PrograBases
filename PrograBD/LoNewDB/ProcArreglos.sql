USE [ProyectoBases]
GO
IF OBJECT_ID('[dbo].[ProcesarArreglos]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[ProcesarArreglos]  
END 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ProcesarArreglos] @arreglo ArreglosTipo  READONLY
AS   
BEGIN
	DECLARE @ID_Propiedad INT, @ID_Comprobante INT, @MontoInicial MONEY, @Saldo MONEY, @TasaInteres DECIMAL, @Cuota MONEY

	Set @ID_Propiedad = (SELECT ID_Propiedad FROM Propiedad INNER JOIN @arreglo ON Propiedad.NumPropiedad = @arreglo.numFinca)

	SET @MontoInicial = (SELECT SUM(Monto) FROM Recibos WHERE ID_Propiedad = @ID_Propiedad)
	SET @Saldo = @MontoInicial
	SET @TasaInteres = (Select (Valor/100) FROM ConfigTable Where Tipo = 'Decimal')
	SET @Cuota = @Saldo*(@TasaInteres * POWER((1 + @TasaInteres),@arreglo.plazo) / POWER((1+@TasaInteres),@arreglo.plazo)-1)

0E1ND