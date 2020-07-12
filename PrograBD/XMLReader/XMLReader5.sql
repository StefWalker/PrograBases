Use[ProyectoBases]

IF OBJECT_ID('XMLTipoEntidad') IS NOT NULL
BEGIN 
DROP PROC XMLTipoEntidad
END
GO
CREATE PROCEDURE XMLTipoEntidad
AS
BEGIN TRY

	DECLARE @x xml
	SELECT @x = P
	FROM OPENROWSET (BULK 'C:\XMLBases\TipoEntidad.xml', SINGLE_BLOB) AS TipoEntidades(P) 
	DECLARE @hdoc int

	EXEC sp_xml_preparedocument @hdoc OUTPUT, @x

	Insert into TipoEntidad(ID_Entidad,Nombre)
	Select *
	FROM OPENXML (@hdoc, '/TipoEntidades/Entidad', 1)
	WITH (
			id INT,
			Nombre VARCHAR(50))

	EXEC sp_xml_removedocument @hdoc
	
END TRY
BEGIN CATCH
	RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO
