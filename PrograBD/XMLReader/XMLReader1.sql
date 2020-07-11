Use[ProyectoBases]

DECLARE @x xml
SELECT @x = P
FROM OPENROWSET (BULK 'C:\XML\TipoDocumentoIdentidad.xml', SINGLE_BLOB) AS TipoDocIdentidad(P)
DECLARE @hdoc int

EXEC sp_xml_preparedocument @hdoc OUTPUT, @x

Insert into TipoDoc(TipoDoc, Tipo)
Select *
FROM OPENXML (@hdoc, '/TipoDocIdentidad/TipoDocId', 1)
WITH (
		codigoDoc INT,
		descripcion VARCHAR(100))

EXEC sp_xml_removedocument @hdoc
