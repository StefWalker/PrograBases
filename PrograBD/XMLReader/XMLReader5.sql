Use[ProyectoBases]

DECLARE @x xml
SELECT @x = P
FROM OPENROWSET (BULK 'C:\XML\TipoEntidad.xml', SINGLE_BLOB) AS TipoEntidades(P) 
DECLARE @hdoc int

EXEC sp_xml_preparedocument @hdoc OUTPUT, @x

Insert into TipoEntidad(ID_Entidad,Nombre)
Select *
FROM OPENXML (@hdoc, '/TipoEntidades/Entidad', 1)
WITH (
		id INT,
		Nombre VARCHAR(50))

EXEC sp_xml_removedocument @hdoc