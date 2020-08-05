Create view vista_recibos
AS
select Recibos.ID_Recibo,Recibos.ID_Propiedad,Recibos.ID_Concepto,Recibos.Fecha,Recibos.Estado,Recibos.Monto
From Recibos  --Ver como le mando el parametro, verificar que este bien la estructura 
Go

-------------------Lista Recibos pendientes ---------------
Create PROC [dbo].[ListarRecibos]
	@inID_Propiedad INT
AS
BEGIN Try
	
	SET NOCOUNT ON;
	SELECT * FROM vista_recibos
	where vista_recibos.ID_Propiedad= @inID_Propiedad AND vista_recibos.Estado = 0 ----Nose si esto funciona 
END Try
Begin Catch 
RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
END CATCH
GO
-------------------Lista Recibos pagos ---------------
Create PROC [dbo].[ListarRecibosPagos]

	@inID_Propiedad INT
AS
BEGIN Try

	SET NOCOUNT ON;

	SELECT * FROM vista_recibos
	where vista_recibos.ID_Propiedad= @inID_Propiedad AND vista_recibos.Estado = 1
	Return 1
END Try
Begin Catch 
RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

--------Listar Bitacora --------------------------------------

Create PROC [dbo].[ListarBitacora]
	
	@inIdEntityType INT,
	@inFechaInicial Varchar(100),
	@inFechaFinal Varchar (100)
AS
BEGIN TRY

	SET NOCOUNT ON;
	SELECT Bitacora.ID_Bitacora,Bitacora.IdEntityType,Bitacora.EntityId,Bitacora.jsonDespues,Bitacora.insertedAt,Bitacora.insertedby,Bitacora.insertedIn
	FROM Bitacora
	
	where Bitacora.IdEntityType= @inIdEntityType AND Bitacora.insertedAt between (select convert(datetime,@inFechaInicial)) and (select convert(datetime,@inFechaFinal))
	return 1
END TRY
Begin Catch 
RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO
-------------------Lista Comprobantes ---------------
Create PROC [dbo].[ListarComprobantes]
	
	@inNumPropiedad INT
AS
BEGIN Try
	SET NOCOUNT ON;
	SELECT Comprobante.ID_Comprobante,Comprobante.NumFinca,Comprobante.Fecha, Comprobante.Monto,Comprobante.MedioPago
	FROM Comprobante
	where Comprobante.NumFinca= @inNumPropiedad 
	Return 1
END Try
Begin Catch 
RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO
------Listar  recibos por pagar --------------------
Create PROC ListarReciboxCom
		@inID_Comprobante int
AS
BEGIN Try
	SET NOCOUNT ON;
	SELECT * FROM vista_recibos
	 INNER JOIN ReciboXComprobante
	on ReciboXComprobante.ID_Comprobante = @inID_Comprobante AND vista_recibos.ID_Recibo = ReciboXComprobante.ID_Recibo
	
END Try
BEGIN CATCH
	RAISERROR('Error en la eliminacion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO
------Listar  recibos por pagar --------------------
Create PROC ListarConfirmados
AS
BEGIN Try
	SET NOCOUNT ON;
	SELECT * FROM vista_recibos
	INNER JOIN tmp ON tmp.idRecibo = vista_recibos.ID_Recibo 

END Try
BEGIN CATCH
	RAISERROR('Error en la eliminacion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO
---------Buscar Comprobante ----------------------

CREATE PROC ComprobanteRead
    @inID_Comprobante int
AS 
BEGIN TRY
    SELECT ID_Comprobante,NumFinca,Fecha,Monto,MedioPago
    FROM   Comprobante
    WHERE  (ID_Comprobante = @inID_Comprobante) 
	return 1
END TRY 
BEGIN CATCH
	RAISERROR('Error en la datos no validos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO
