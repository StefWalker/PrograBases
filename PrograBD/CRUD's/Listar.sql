USE [ProyectoBases]

-----ListaPropiedades ingresando el id

CREATE PROC ListarPropiedades
	-- Add the parameters for the stored procedure here
	@inID_Propietario INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Propiedad.NumPropiedad,Propiedad.Direccion,Propiedad.ID_Propiedad
	FROM Propiedad INNER JOIN Pro_x_Pro
	on Pro_x_Pro.ID_Propietario = @inID_Propietario AND Propiedad.ID_Propiedad = Pro_x_Pro.ID_Propiedad
	WHERE Propiedad.Activo = 1
END
GO
-------------Lista las propiedades de un usuario-----------------

CREATE PROC ListarPropiedadesUser
	-- Add the parameters for the stored procedure here
	@inID_Usuario INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Propiedad.NumPropiedad,Propiedad.Direccion,Propiedad.ID_Propiedad
	FROM Propiedad INNER JOIN Pro_x_Usuario
	on Pro_x_Usuario.ID_Usuario = @inID_Usuario AND Propiedad.ID_Propiedad = Pro_x_Usuario.ID_Propiedad 
	where Propiedad.Activo = 1
END
GO
-----Listar Usuarios 
Create PROC ListarUsuarios
	@ID_Propiedad INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Usuario.ID_Usuario,Usuario.Nombre,Usuario.Password,Usuario.TipoUsuario
	FROM Usuario INNER JOIN Pro_x_Usuario
	on Pro_x_Usuario.ID_Propiedad = @ID_Propiedad AND Usuario.ID_Usuario = Pro_x_Usuario.ID_Usuario
	where Usuario.Activo = 1
END

Create PROC [dbo].[ListarPropietariosJuridicos]
	@inID_Propiedad INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT PropJuridico.Documento,PropJuridico.ID_Juridico,PropJuridico.ID_Propietario,PropJuridico.ID_TDoc
	FROM PropJuridico INNER JOIN PJur_x_Pro
	on PJur_x_Pro.ID_Propiedad = @inID_Propiedad AND PropJuridico.ID_Juridico = PJur_x_Pro.ID_Juridico
	where PropJuridico.Activo = 1 AND PJur_x_Pro.Activo=1
END

Create PROC [dbo].[ListarPropietariosFisicos]
	@inID_Propiedad INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Propietario.ID_Propietario,Propietario.Identificacion,Propietario.Nombre,Propietario.ID_TDoc
	FROM Propietario INNER JOIN Pro_x_Pro
	on Pro_x_Pro.ID_Propiedad = @inID_Propiedad AND Propietario.ID_Propietario = Pro_x_Pro.ID_Propietario
	where Propietario.Activo = 1 AND Pro_x_Pro.Activo = 1
END

-------------Lista Bitacora-----------------

CREATE PROC ListarBitacora
	-- Add the parameters for the stored procedure here
	@inIdEntityType INT,
	@inFechaInicial Date,
	@inFechaFinal Date
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Bitacora.ID_Bitacora,Bitacora.IdEntityType,Bitacora.EntityId,Bitacora.jsonAntes,Bitacora.jsonDespues,
	Bitacora.insertedAt,Bitacora.insertedby,Bitacora.insertedIn
	FROM Bitacora 
	where Bitacora.IdEntityType = @inIdEntityType AND Bitacora.insertedAt between @inFechaInicial AND @inFechaFinal
	ORDER BY Bitacora.insertedAt ASC
END
GO