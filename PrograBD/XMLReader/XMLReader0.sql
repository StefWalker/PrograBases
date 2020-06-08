
Use[ProyectoBases]
DECLARE @x xml
SELECT @x = P
FROM OPENROWSET (BULK 'C:\XMLBases\TipoDocumentoIdentidad.xml', SINGLE_BLOB) AS TipoDocIdentidad(P)
DECLARE @hdoc int

EXEC sp_xml_preparedocument @hdoc OUTPUT, @x

Insert into Usuario(Nombre, Password, TipoUsuario)
Select *
FROM OPENXML (@hdoc, '/TipoDocIdentidad/UsuarioAdmi', 1)
WITH (
		usuario VARCHAR(100),
		clave VARCHAR(100),
		tipo VARCHAR(100))

EXEC sp_xml_removedocument @hdoc
