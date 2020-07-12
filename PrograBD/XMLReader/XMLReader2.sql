
Use[ProyectoBases]

IF OBJECT_ID('XMLUsuarios') IS NOT NULL
BEGIN 
DROP PROC XMLUsuarios
END
GO
CREATE PROCEDURE XMLUsuarios
AS
BEGIN TRY
	DECLARE @x xml
	SELECT @x = P
	FROM OPENROWSET (BULK 'C:\XMLBases\Usuarios.xml', SINGLE_BLOB) AS Usuarios(P)
	DECLARE @hdoc int

	EXEC sp_xml_preparedocument @hdoc OUTPUT, @x

	Insert into Usuario(Nombre,Password, TipoUsuario)
	Select *
	FROM OPENXML (@hdoc, '/Usuarios/Usuario', 1)
	WITH (
			usuario VARCHAR(100),
			password VARCHAR(100),
			tipo VARCHAR(100))

	EXEC sp_xml_removedocument @hdoc

END TRY
BEGIN CATCH
	RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO
