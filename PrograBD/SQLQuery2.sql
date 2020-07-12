use ProyectoBases
-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER trg_propiedadInsert
   ON  [dbo].Propiedad
   AFTER INSERT, UPDATE
AS 
BEGIN
	Declare @inJsonDespues Varchar(500) = NULL;
	Declare @inJsonAntes Varchar(500) = NULL;
	Declare @inID_Bitacora INT = NULL;
	Declare @inID_Prop INT = NULL;
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


		Set @inJsonDespues = (Select k.ID_Propiedad, k.NumPropiedad, k.Valor, k.Direccion,
										 k.Fecha, k.M3Acumulados, k.M3AcumuladosUltimoRecibo 
										 FROM inserted AS k FOR JSON AUTO)
	
	
    -- Insert statements for trigger here
	INSERT INTO [dbo].Bitacora
	(
		IdEntityType,
		EntityId, 
		jsonAntes,
		jsonDespues,
		insertedAt, 
		insertedby, 
		insertedIn
	)
	SELECT 1, i.ID_Propiedad, @inJsonAntes, @inJsonDespues, GETDATE(), 'administrador',CONVERT(char(15), CONNECTIONPROPERTY('client_net_address'))
	FROM inserted AS i
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER trg_propiedadDelete
   ON  [dbo].Propiedad
   AFTER DELETE
AS 
BEGIN
	Declare @inJsonDespues Varchar(500) = NULL;
	Declare @inJsonAntes Varchar(500) = NULL;
	Declare @inID_Bitacora INT = NULL;
	Declare @inID_Prop INT = NULL;
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SET	@inID_Prop = (Select k.ID_Propiedad From inserted as k)

	SET @inID_Bitacora = (Select max(Bitacora.ID_Bitacora) from Bitacora
										 Where Bitacora.EntityId = @inID_Prop)

	if((SELECT i.ID_Propiedad from deleted as i) IS NOT NULL)
	BEGIN
		Set @inJsonAntes = (Select k.ID_Propiedad, k.NumPropiedad, k.Valor, k.Direccion,
										 k.Fecha, k.M3Acumulados, k.M3AcumuladosUltimoRecibo 
										 FROM deleted AS k FOR JSON AUTO)
	END 
	
    -- Insert statements for trigger here
	INSERT INTO [dbo].Bitacora
	(
		IdEntityType,
		EntityId, 
		jsonAntes,
		jsonDespues,
		insertedAt, 
		insertedby, 
		insertedIn
	)
	SELECT 1, ID_Propiedad, @inJsonAntes, @inJsonDespues, GETDATE(), 'administrador',CONVERT(char(15), CONNECTIONPROPERTY('client_net_address'))
	FROM deleted AS i

END
GO
