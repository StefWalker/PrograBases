Create PROC [dbo].[ListarRecibos]
	-- Add the parameters for the stored procedure here
	@inID_Propiedad INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Recibos.ID_Recibo,Recibos.ID_Propiedad,Recibos.ID_Concepto,Recibos.Fecha,Recibos.Estado
	FROM Recibos 

	where Recibos.ID_Propiedad= @inID_Propiedad
END

Create PROC [dbo].[ListarBitacora]
	-- Add the parameters for the stored procedure here
	@inIdEntityType INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Bitacora.ID_Bitacora,Bitacora.IdEntityType,Bitacora.EntityId,Bitacora.jsonDespues,Bitacora.insertedAt,Bitacora.insertedby,Bitacora.insertedIn
	FROM Bitacora

	where Bitacora.IdEntityType= @inIdEntityType AND Bitacora.ID_Bitacora < 100
END

