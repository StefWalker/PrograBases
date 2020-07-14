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

	where Recibos.ID_Propiedad= @inID_Propiedad
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
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Bitacora.ID_Bitacora,Bitacora.IdEntityType,Bitacora.EntityId,Bitacora.jsonDespues,Bitacora.insertedAt,Bitacora.insertedby,Bitacora.insertedIn
	FROM Bitacora
	
	where Bitacora.IdEntityType= @inIdEntityType AND Bitacora.insertedAt between (select convert(datetime,@inFechaInicial)) and (select convert(datetime,@inFechaFinal))
END

