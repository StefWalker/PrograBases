USE[ProyectoBases]

DECLARE @y xml

SELECT @y = L
FROM OPENROWSET (BULK 'C:\XMLBases\Concepto de Cobro.xml', SINGLE_BLOB) AS Operaciones_por_Dia(L)

--SELECT @y

DECLARE @hdo int

EXEC sp_xml_preparedocument @hdo OUTPUT, @y

Select * 
into ccobro
From OPENXML (@hdo, '/Conceptos_de_Cobro/conceptocobro', 1)
with(
	id int,
	Nombre varchar(100),
	DiaCobro int,
	QDiasVencimiento int,
	EsImpuesto varchar(10),
	EsRecurrente varchar(10),
	EsFijo varchar(10),
	TasaInteresMoratoria money,
	TipoCC varchar(50),
	Monto money,
	ValorM3 money,
	ValorPorcentaje money)

EXEC sp_xml_removedocument @hdo

Insert into ConceptoCobro(ID_CC, TipoCC, Concepto, FechaVencimiento, Fecha)
Select ccobro.id, ccobro.TipoCC, ccobro.Nombre, ccobro.QDiasVencimiento, ccobro.DiaCobro
FROM ccobro

Insert into Intereses_monetarios(ID_IM, Monto)
Select ccobro.id, ccobro.TasaInteresMoratoria 
From ccobro

Insert into CC_ConsumoAgua(ID_Con, Valor_m3)
Select ccobro.id, ccobro.ValorM3 From ccobro 
WHERE  EsRecurrente = 'Si'

Insert into CC_Fijo(ID_Fijo, Monto)
Select ccobro.id, ccobro.Monto From ccobro 
WHERE  EsFijo = 'Si'

Insert into CC_Porcentual(ID_Por, Porcentaje)
Select ccobro.id, ccobro.ValorPorcentaje From ccobro 
WHERE  EsImpuesto = 'Si'


/*
Delete from ConceptoCobro
Delete from Intereses_Monetarios
*/