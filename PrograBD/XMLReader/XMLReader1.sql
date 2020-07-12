Use[ProyectoBases]

IF OBJECT_ID('XMLTipoDoc') IS NOT NULL
BEGIN 
DROP PROC XMLTipoDoc
END
GO
CREATE PROCEDURE XMLTipoDoc
AS
BEGIN TRY
	DECLARE @x xml
	SELECT @x = P

	FROM OPENROWSET (BULK 'C:\XMLBases\TipoDocumentoIdentidad.xml', SINGLE_BLOB) AS TipoDocIdentidad(P)
	DECLARE @hdoc int

	EXEC sp_xml_preparedocument @hdoc OUTPUT, @x

	Insert into TipoDoc(TipoDoc, Tipo)
	Select *
	FROM OPENXML (@hdoc, '/TipoDocIdentidad/TipoDocId', 1)
	WITH (
			codigoDoc INT,
			descripcion VARCHAR(100))

	EXEC sp_xml_removedocument @hdoc

END TRY
BEGIN CATCH
	RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO
Use[ProyectoBases]

IF OBJECT_ID('XMLUsuarios') IS NOT NULL
BEGIN 
DROP PROC XMLUsuarios
END
GO
CREATE PROCEDURE XMLUsuarios
AS
BEGIN TRY
	DECLARE @x xml
	SELECT @x = P
	FROM OPENROWSET (BULK 'C:\XMLBases\Usuarios.xml', SINGLE_BLOB) AS Usuarios(P)
	DECLARE @hdoc int

	EXEC sp_xml_preparedocument @hdoc OUTPUT, @x

	Insert into Usuario(Nombre,Password, TipoUsuario)
	Select *
	FROM OPENXML (@hdoc, '/Usuarios/Usuario', 1)
	WITH (
			usuario VARCHAR(100),
			password VARCHAR(100),
			tipo VARCHAR(100))

	EXEC sp_xml_removedocument @hdoc

END TRY
BEGIN CATCH
	RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO
USE[ProyectoBases]

IF OBJECT_ID('XMLConceptoCobro') IS NOT NULL
BEGIN 
DROP PROC XMLConceptoCobro
END
GO
CREATE PROCEDURE XMLConceptoCobro
AS
BEGIN TRY

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

END TRY
BEGIN CATCH
	RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

Use[ProyectoBases]

IF OBJECT_ID('XMLTransConsumo') IS NOT NULL
BEGIN 
DROP PROC XMLTransConsumo
END
GO
CREATE PROCEDURE XMLTransConsumo
AS
BEGIN TRY

	DECLARE @x xml
	SELECT @x = P
	FROM OPENROWSET (BULK 'C:\XMLBases\TipoTransConsumo.xml', SINGLE_BLOB) AS TipoTransConsumo(P) 
	DECLARE @hdoc int

	EXEC sp_xml_preparedocument @hdoc OUTPUT, @x

	Insert into TipoTrans(ID_Trans,Nombre)
	Select *
	FROM OPENXML (@hdoc, '/TipoTransConsumo/TransConsumo', 1)
	WITH (
			id INT,
			Nombre VARCHAR(20))

	EXEC sp_xml_removedocument @hdoc

END TRY
BEGIN CATCH
	RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO

Use[ProyectoBases]

IF OBJECT_ID('XMLTipoEntidad') IS NOT NULL
BEGIN 
DROP PROC XMLTipoEntidad
END
GO
CREATE PROCEDURE XMLTipoEntidad
AS
BEGIN TRY

	DECLARE @x xml
	SELECT @x = P
	FROM OPENROWSET (BULK 'C:\XMLBases\TipoEntidad.xml', SINGLE_BLOB) AS TipoEntidades(P) 
	DECLARE @hdoc int

	EXEC sp_xml_preparedocument @hdoc OUTPUT, @x

	Insert into TipoEntidad(ID_Entidad,Nombre)
	Select *
	FROM OPENXML (@hdoc, '/TipoEntidades/Entidad', 1)
	WITH (
			id INT,
			Nombre VARCHAR(50))

	EXEC sp_xml_removedocument @hdoc
	
END TRY
BEGIN CATCH
	RAISERROR('Error en la insercion de datos', 16, 1) WITH NOWAIT;
	PRINT error_message()
	return -1
END CATCH
GO
