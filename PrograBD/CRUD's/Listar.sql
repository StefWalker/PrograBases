USE [ProyectoBases]

-----ListaPropiedades ingresando el id

CREATE PROCEDURE ListarPropiedades
	-- Add the parameters for the stored procedure here
	@ID_Propietario INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Propiedad.NumPropiedad,Propiedad.Direccion,Propiedad.ID_Propiedad
	FROM Propiedad INNER JOIN Pro_x_Pro
	on Pro_x_Pro.ID_Propietario = @ID_Propietario AND Propiedad.ID_Propiedad = Pro_x_Pro.ID_Propiedad
	WHERE Propiedad.Activo = 1
END
GO
-------------Lista las propiedades de un usuario-----------------

CREATE PROC ListarPropiedadesUser
	-- Add the parameters for the stored procedure here
	@ID_Usuario INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Propiedad.NumPropiedad,Propiedad.Direccion,Propiedad.ID_Propiedad
	FROM Propiedad INNER JOIN Pro_x_Usuario
	on Pro_x_Usuario.ID_Usuario = @ID_Usuario AND Propiedad.ID_Propiedad = Pro_x_Usuario.ID_Propiedad 
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