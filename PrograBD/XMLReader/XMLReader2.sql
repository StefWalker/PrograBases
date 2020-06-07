USE[ProyectoBases]

DECLARE @y xml

SELECT @y = L
FROM OPENROWSET (BULK 'C:\XMLBases\Operaciones.xml', SINGLE_BLOB) AS Operaciones_por_Dia(L)

--SELECT @y

DECLARE @hdo int

EXEC sp_xml_preparedocument @hdo OUTPUT, @y



Insert into Propiedad(Direccion, Valor, NumPropiedad)
Select * 
From OPENXML (@hdo, '/Operaciones_por_Dia/OperacionDia/Propiedad', 1)
with(
	Direccion varchar(250),
	Valor money,
	NumFinca int)



EXEC sp_xml_removedocument @hdo
