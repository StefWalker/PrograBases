USE[ProyectoBases]

DECLARE @y xml

SELECT @y = L
FROM OPENROWSET (BULK 'C:\XMLBases\Operaciones.xml', SINGLE_BLOB) AS Operaciones_por_Dia(L)

--SELECT @y

DECLARE @hdo int

EXEC sp_xml_preparedocument @hdo OUTPUT, @y

Select *
Into dataTable
From OPENXML (@hdo, '/Operaciones_por_Dia/OperacionDia/PropiedadVersusPropietario ', 1)
with(
	NumFinca int,
	identificacion varchar(250))

EXEC sp_xml_removedocument @hdo

INSERT INTO Pro_x_Pro(ID_Propiedad,ID_Propietario)
SELECT Propiedad.ID_Propiedad, Propietario.ID_Propietario
FROM ((Propietario inner join dataTable
ON Propietario.Identificacion = dataTable.identificacion) 
inner join Propiedad
ON dataTable.NumFinca = Propiedad.NumPropiedad)

INSERT INTO Pjur_x_Pro(ID_Propiedad,ID_Juridico)
SELECT  Propiedad.ID_Propiedad, PropJuridico.ID_Juridico
FROM ((Propiedad inner join dataTable
ON Propiedad.NumPropiedad = dataTable.NumFinca) 
inner join PropJuridico
ON dataTable.identificacion = PropJuridico.Documento)