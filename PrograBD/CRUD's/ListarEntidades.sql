-------------------Lista Recibos pendientes ---------------
Create PROC [dbo].[ListarRecibos]
	-- Add the parameters for the stored procedure here
	@inID_Propiedad INT
AS
BEGIN Try
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Recibos.ID_Recibo,Recibos.ID_Propiedad,Recibos.ID_Concepto,Recibos.Fecha,Recibos.Estado
	FROM Recibos 

	where Recibos.ID_Propiedad= @inID_Propiedad AND Recibos.Estado = 0
	Return 1
END Try
Begin Catch 
RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO
-------------------Lista Recibos pagos ---------------
Create PROC [dbo].[ListarRecibosPagos]
	-- Add the parameters for the stored procedure here
	@inID_Propiedad INT
AS
BEGIN Try
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Recibos.ID_Recibo,Recibos.ID_Propiedad,Recibos.ID_Concepto,Recibos.Fecha,Recibos.Estado
	FROM Recibos 

	where Recibos.ID_Propiedad= @inID_Propiedad AND Recibos.Estado = 1
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
	-- Add the parameters for the stored procedure here
	@inIdEntityType INT,
	@inFechaInicial Varchar(100),
	@inFechaFinal Varchar (100)
AS
BEGIN TRY
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
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
	-- Add the parameters for the stored procedure here
	@inNumPropiedad INT
AS
BEGIN Try
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Comprobante.ID_Comprobante,Comprobante.ID_Recibo,Comprobante.NumPropiedad,Comprobante.TipoRecibo,Comprobante.Fecha
	FROM Comprobante

	where Comprobante.NumPropiedad= @inNumPropiedad 
	Return 1
END Try
Begin Catch 
RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO