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
	SELECT 1, i.ID_Propiedad, @inJsonAntes, @inJsonDespues, i.Fecha, 'administrador',CONVERT(char(15), CONNECTIONPROPERTY('client_net_address'))
	FROM inserted AS i
END
GO

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


	Set @inJsonAntes = (Select k.ID_Propiedad, k.NumPropiedad, k.Valor, k.Direccion,
										 k.Fecha, k.M3Acumulados, k.M3AcumuladosUltimoRecibo 
										 FROM deleted AS k FOR JSON AUTO)

	
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
	SELECT 1, i.ID_Propiedad, @inJsonAntes, @inJsonDespues, i.Fecha, 'administrador',CONVERT(char(15), CONNECTIONPROPERTY('client_net_address'))
	FROM deleted AS i

END
GO


-- TRIGGERS 2 Propietario ===============================================================================================================================

CREATE TRIGGER trg_PropietarioInsert
   ON  [dbo].Propietario
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

	Set @inJsonDespues = (Select k.ID_Propietario, k.Identificacion, k.Nombre, k.ID_TDoc,
										 k.Fecha FROM inserted AS k FOR JSON AUTO)
	
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
	SELECT 2, i.ID_Propietario, @inJsonAntes, @inJsonDespues, i.Fecha, 'administrador',CONVERT(char(15), CONNECTIONPROPERTY('client_net_address'))
	FROM inserted AS i
END
GO

CREATE TRIGGER trg_PropietarioDelete
   ON  [dbo].Propietario
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


	Set @inJsonAntes = (Select k.ID_Propietario, k.Identificacion, k.Nombre, k.ID_TDoc,
										 k.Fecha FROM inserted AS k FOR JSON AUTO)
	
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
	SELECT 2, i.ID_Propietario, @inJsonAntes, @inJsonDespues, i.Fecha, 'administrador',CONVERT(char(15), CONNECTIONPROPERTY('client_net_address'))
	FROM deleted AS i

END
GO

-- TRIGGERS 3 Usuario ===============================================================================================================================

CREATE TRIGGER trg_UsuarioInsert
   ON  [dbo].Usuario
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

	Set @inJsonDespues = (Select k.ID_Usuario, k.Nombre, k.Password, k.TipoUsuario, k.Fecha FROM inserted AS k FOR JSON AUTO)
	
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
	SELECT 3, i.ID_Usuario, @inJsonAntes, @inJsonDespues, i.Fecha, 'administrador',CONVERT(char(15), CONNECTIONPROPERTY('client_net_address'))
	FROM inserted AS i
END
GO

CREATE TRIGGER trg_UsuarioDelete
   ON  [dbo].Usuario
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

	Set @inJsonAntes = (Select k.ID_Usuario, k.Nombre, k.Password, k.TipoUsuario, k.Fecha FROM inserted AS k FOR JSON AUTO)

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
	SELECT 3, i.ID_Usuario, @inJsonAntes, @inJsonDespues, i.Fecha, 'administrador',CONVERT(char(15), CONNECTIONPROPERTY('client_net_address'))
	FROM deleted AS i

END
GO

-- TRIGGERS 4 Pro x Pro ===============================================================================================================================

CREATE TRIGGER trg_ProxProInsert
   ON  [dbo].Pro_x_Pro
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

	Set @inJsonDespues = (Select k.ID_PxP, k.ID_Propiedad, k.ID_Propietario, k.Fecha
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
	SELECT 4, i.ID_PxP, @inJsonAntes, @inJsonDespues, i.Fecha, 'administrador',CONVERT(char(15), CONNECTIONPROPERTY('client_net_address'))
	FROM inserted AS i
END
GO

CREATE TRIGGER trg_ProxProDelete
   ON  [dbo].Pro_x_Pro
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

	Set @inJsonAntes = (Select k.ID_PxP, k.ID_Propiedad, k.ID_Propietario, k.Fecha
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
	SELECT 4, i.ID_PxP, @inJsonAntes, @inJsonDespues, i.Fecha, 'administrador',CONVERT(char(15), CONNECTIONPROPERTY('client_net_address'))
	FROM deleted AS i

END
GO

-- TRIGGERS Pro x Usu ===============================================================================================================================

CREATE TRIGGER trg_ProxUsuInsert
   ON  [dbo].Pro_x_Usuario
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

	Set @inJsonDespues = (Select k.ID_PxU, k.ID_Propiedad, k.ID_Usuario, k.Fecha
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
	SELECT 5, i.ID_PxU, @inJsonAntes, @inJsonDespues, i.Fecha, 'administrador',CONVERT(char(15), CONNECTIONPROPERTY('client_net_address'))
	FROM inserted AS i
END
GO

CREATE TRIGGER trg_ProxUsuDelete
   ON  [dbo].Pro_x_Usuario
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

	Set @inJsonAntes = (Select k.ID_PxU, k.ID_Propiedad, k.ID_Usuario, k.Fecha
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
	SELECT 5, i.ID_PxU, @inJsonAntes, @inJsonDespues, i.Fecha, 'administrador',CONVERT(char(15), CONNECTIONPROPERTY('client_net_address'))
	FROM deleted AS i

END
GO

-- TRIGGERS 6 ProJuridico ===============================================================================================================================

CREATE TRIGGER trg_PropietarioJurInsert
   ON  [dbo].PropJuridico
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

	Set @inJsonDespues = (Select k.ID_Juridico, k.ID_Propietario, k.Documento, k.ID_TDoc,
										 k.Fecha FROM inserted AS k FOR JSON AUTO)
	
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
	SELECT 1, i.ID_Juridico, @inJsonAntes, @inJsonDespues, i.Fecha, 'administrador',CONVERT(char(15), CONNECTIONPROPERTY('client_net_address'))
	FROM inserted AS i
END
GO

CREATE TRIGGER trg_PropietarioJurDelete
   ON  [dbo].PropJuridico
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


	Set @inJsonAntes = (Select k.ID_Juridico, k.ID_Propietario, k.Documento, k.ID_TDoc,
										 k.Fecha FROM inserted AS k FOR JSON AUTO)

	
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
	SELECT 1, i.ID_Juridico, @inJsonAntes, @inJsonDespues, i.Fecha, 'administrador',CONVERT(char(15), CONNECTIONPROPERTY('client_net_address'))
	FROM deleted AS i

END
GO

-- TRIGGERS 7 Concepto Cobro ===============================================================================================================================


CREATE TRIGGER trg_ConceptoCobroInsert
   ON  [dbo].ConceptoCobro
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

	Set @inJsonDespues = (Select k.ID_CC, k.TipoCC, k.Concepto, k.DiaCobro,
										 k.DiaVencimiento FROM inserted AS k FOR JSON AUTO)
	
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
	SELECT 1, i.ID_CC, @inJsonAntes, @inJsonDespues, GETDATE (), 'administrador',CONVERT(char(15), CONNECTIONPROPERTY('client_net_address'))
	FROM inserted AS i
END
GO

CREATE TRIGGER trg_ConceptoCobroDelete
   ON  [dbo].ConceptoCobro
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


	Set @inJsonAntes = (Select k.ID_CC, k.TipoCC, k.Concepto, k.DiaCobro,
										 k.DiaVencimiento FROM inserted AS k FOR JSON AUTO)

	
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
	SELECT 1, i.ID_CC, @inJsonAntes, @inJsonDespues, GETDATE(), 'administrador',CONVERT(char(15), CONNECTIONPROPERTY('client_net_address'))
	FROM deleted AS i

END
GO


-- TRIGGERS 8 Recibos ===============================================================================================================================
/*
CREATE TRIGGER trg_ComprobanteInsert
   ON  [dbo].Comprobante
   AFTER INSERT
AS 
BEGIN TRY
	Declare @ID_Recibo INT

	Set @ID_Recibo = (Select i.ID_Recibo From inserted as i)

    -- Insert statements for trigger here
	UPDATE [dbo].Recibos
	SET Estado = 1
	WHERE Recibos.ID_Recibo = @ID_Recibo
END TRY 
BEGIN CATCH
	Print error_message()
END CATCH
GO

use ProyectoBases
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER trg_MontoGenerator
	ON [dbo].Comprobante
	AFTER INSERT
AS	
BEGIN
	DECLARE @FechaLimite int = (Select ConceptoCobro.DiaVencimiento From inserted as i Inner join ConceptoCobro ON ConceptoCobro.ID_CC = i.TipoRecibo)
	DECLARE @FechaActual int = (Select DAY(i.Fecha)  FROM inserted as i)
	DECLARE @FechaCompleta Date = (Select DATEADD(DAY, @FechaLimite, i.Fecha) FROM inserted as i)

		Update Comprobante
			Set MontoPagado = ((i.MontoPagado*Intereses_Moratorios.Monto/365)*abs(@FechaLimite-@FechaActual))+i.MontoPagado
			From inserted as i
			Inner join Intereses_Moratorios on Intereses_Moratorios.ID_IM = i.TipoRecibo
			where i.ID_Comprobante = Comprobante.ID_Comprobante and (Select i.Fecha FROM inserted as i) > @FechaCompleta
END
*/