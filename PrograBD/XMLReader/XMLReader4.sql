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
