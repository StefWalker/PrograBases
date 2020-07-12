Use[ProyectoBases]

IF OBJECT_ID('XMLTipoDoc') IS NOT NULL
BEGIN 
DROP PROC XMLTipoDoc
END
GO
CREATE PROCEDURE XMLTipoDoc
AS
BEGIN TRY
	DECLARE @x xml
	SELECT @x = P

	FROM OPENROWSET (BULK 'C:\XMLBases\TipoDocumentoIdentidad.xml', SINGLE_BLOB) AS TipoDocIdentidad(P)
	DECLARE @hdoc int

	EXEC sp_xml_preparedocument @hdoc OUTPUT, @x

	Insert into TipoDoc(TipoDoc, Tipo)
	Select *
	FROM OPENXML (@hdoc, '/TipoDocIdentidad/TipoDocId', 1)
	WITH (
			codigoDoc INT,
			descripcion VARCHAR(100))

	EXEC sp_xml_removedocument @hdoc

END TRY
BEGIN CATCH
	RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO
