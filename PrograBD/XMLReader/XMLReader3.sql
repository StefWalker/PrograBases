USE[ProyectoBases]

DECLARE @y xml

SELECT @y = L
FROM OPENROWSET (BULK 'C:\XMLBases\Operaciones.xml', SINGLE_BLOB) AS Operaciones_por_Dia(L)

--SELECT @y

DECLARE @hdo int

EXEC sp_xml_preparedocument @hdo OUTPUT, @y


Insert into Propietario(ID_TDoc, Nombre, Identificacion)
Select * 
From OPENXML (@hdo, '/Operaciones_por_Dia/OperacionDia/Propietario ', 1)
with(
	TipoDocIdentidad int,
	Nombre varchar(100),
	identificacion varchar(250))
	
Insert into Propietario(ID_TDoc, Nombre, Identificacion)
Select * 
From OPENXML (@hdo, '/Operaciones_por_Dia/OperacionDia/PersonaJuridica ', 1)
with(
	TipDocIdRepresentante int,
	Nombre varchar(100),
	DocidRepresentante varchar(250))
	
Select * 
Into juridicos
From OPENXML (@hdo, '/Operaciones_por_Dia/OperacionDia/PersonaJuridica ', 1)
with(
	DocidRepresentante varchar(250),
	TipDocIdPJ int,
	docidPersonaJuridica varchar(250))

EXEC sp_xml_removedocument @hdo

/*
Delete from Propietario
Delete from PropJuridico
*/

INSERT INTO PropJuridico(Documento,ID_Propietario)
SELECT juridicos.docidPersonaJuridica, Propietario.ID_Propietario
FROM juridicos INNER JOIN Propietario
ON juridicos.DocidRepresentante = Propietario.Identificacion