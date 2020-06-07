USE[ProyectoBases]

DECLARE @y xml

SELECT @y = L
FROM OPENROWSET (BULK 'C:\XMLBases\Operaciones.xml', SINGLE_BLOB) AS Operaciones_por_Dia(L)

--SELECT @y

DECLARE @hdo int

EXEC sp_xml_preparedocument @hdo OUTPUT, @y

Select *
Into dataCobro
From OPENXML (@hdo, '/Operaciones_por_Dia/OperacionDia/ConceptoCobroVersusPropiedad ', 1)
with(
	idcobro int,
	NumFinca int)

EXEC sp_xml_removedocument @hdo

INSERT INTO Pro_x_CC(ID_CC, ID_Propiedad)
SELECT  ConceptoCobro.ID_CC, Propiedad.ID_Propiedad
FROM dataCobro inner join Propiedad
ON Propiedad.NumPropiedad = dataCobro.NumFinca
inner join ConceptoCobro
on dataCobro.idcobro = ConceptoCobro.ID_CC

