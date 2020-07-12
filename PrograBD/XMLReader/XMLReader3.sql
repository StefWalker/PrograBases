---XML Concepto Cobro----
	DECLARE @y xml

	SELECT @y = L
	FROM OPENROWSET (BULK 'C:\XMLBases\ConceptoDeCobro.xml', SINGLE_BLOB) AS Operaciones_por_Dia(L)

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
		ValorPorcentaje money,
		MontoMinRecibo int)

	EXEC sp_xml_removedocument @hdo

	Insert into ConceptoCobro(ID_CC, TipoCC, Concepto,DiaCobro,DiaVencimiento)
	Select ccobro.id, ccobro.TipoCC, ccobro.Nombre,ccobro.DiaCobro, ccobro.QDiasVencimiento
	FROM ccobro

	Insert into Intereses_Moratorios(ID_IM, Monto)
	Select ccobro.id, ccobro.TasaInteresMoratoria 
	From ccobro

	Insert into CC_ConsumoAgua(ID_Con, Valor_m3,MontoMinimoRecibo)
	Select ccobro.id, ccobro.ValorM3 , ccobro.MontoMinRecibo From ccobro 
	WHERE  EsImpuesto ='NO' AND EsRecurrente = 'Si' AND EsFijo='NO'

	Insert into CC_Fijo(ID_Fijo, Monto)
	Select ccobro.id, ccobro.Monto From ccobro 
	WHERE  EsImpuesto ='No' AND EsRecurrente = 'Si' AND EsFijo='Si'

	Insert into CC_Porcentual(ID_Por, Porcentaje)
	Select ccobro.id, ccobro.ValorPorcentaje From ccobro 
	WHERE  EsImpuesto ='Si' AND EsRecurrente = 'Si' AND EsFijo='No'

	DROP TABLE ccobro


