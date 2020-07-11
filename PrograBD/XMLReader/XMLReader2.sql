
Use[ProyectoBases]
DECLARE @x xml
SELECT @x = P
FROM OPENROWSET (BULK 'C:\XML\Usuarios.xml', SINGLE_BLOB) AS Usuarios(P)
DECLARE @hdoc int

EXEC sp_xml_preparedocument @hdoc OUTPUT, @x

Insert into Usuario(Nombre, Password, TipoUsuario)
Select *
FROM OPENXML (@hdoc, '/Usuarios/Usuario', 1)
WITH (
		user VARCHAR(100),
		password VARCHAR(100),
		tipo VARCHAR(100))

EXEC sp_xml_removedocument @hdoc
