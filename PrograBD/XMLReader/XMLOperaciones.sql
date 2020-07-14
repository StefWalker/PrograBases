USE [ProyectoBases]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[CargarOperaciones]

AS

BEGIN
	BEGIN TRY
		BEGIN TRAN
		
----Declaramos las tablas temporales-----------------------------------------------------------

			DECLARE @Varios XML
			DECLARE @TemporalFechas table (fecha date);
			DECLARE @TemporalPropietario table (IdentidadTemporal VARCHAR(250),NomTemp VARCHAR(100),Activo bit,TipoIdTemp int,FechaTemp DATE);
			DECLARE @TemporalUsuario table (NomTemp VARCHAR(100),PasswordTemp VARCHAR(100),TipoTemp Varchar(100),Activo BIT,FechTemp DATE);  
			DECLARE @TemporalPropiedad table (NumTemp INT,ValTemp MONEY,DireccionTemp VARCHAR(250),Activo BIT,FechTemp DATE); 
			DECLARE @TemporalTransConsumo table (Lectura INT,Descripcion varchar(150),Finca Int ,Tipo int,FechTemp DATE); 
			DECLARE @TemporalPropJurid table (IDPropietario Varchar(250),Documento Varchar(250),Activo BIT,Fech DATE);
			DECLARE @TemporalCambios table (NumFinca INT , NuevoValor MONEY,Fecha Date );
			DECLARE @Pagos table (NumFinca INT, TipoRecibo INT, Fecha DATE)
			SET NOCOUNT ON 
-----Declaramos una fecha maxima y una minima para saber el inicio y final -------------------------------

			DECLARE @fechaMinima DATE
			DECLARE @fechaMaxima DATE
			DECLARE @DiaDeCobro INT

			SELECT @Varios = C	
			

			FROM OPENROWSET (BULK 'C:\XMLBases\Operaciones.xml', SINGLE_BLOB) AS Varios(C)
			
			DECLARE @hdoc int

			EXEC sp_xml_preparedocument @hdoc OUTPUT, @Varios

----Guardo las fechas a la tabla temporal----------------------------------------------
			INSERT INTO @TemporalFechas (fecha)
			SELECT convert(date, fechaInsercion, 121) [fechaInsercion]
			FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia', 1)

			WITH([fechaInsercion] VARCHAR (40) '@fecha');

			SELECT @fechaMaxima = MAX(fecha) FROM @TemporalFechas 
			SELECT @fechaMinima = MIN(fecha) FROM @TemporalFechas 
			
			DECLARE @fechaActual date
			SET @fechaActual = @fechaMinima;


			
----Insercion de datos a las tablas temporales ----------------------------------------------
--Propiedades----

			INSERT INTO @TemporalPropiedad (NumTemp ,ValTemp,DireccionTemp ,Activo ,FechTemp )

			SELECT NumFinca,valor,direccion,1,convert(date, fechaLeida, 121) fechaLeida
			FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia/Propiedad', 2)
				WITH(
					NumFinca INT '@NumFinca' ,
					valor  MONEY '@Valor',
					direccion VARCHAR(250) '@Direccion',
					fechaLeida VARCHAR(40) '../@fecha'
				);
			
----Usuario-------

			INSERT INTO @TemporalUsuario 
			 (NomTemp ,PasswordTemp,TipoTemp,Activo,FechTemp) 

			SELECT nombre, contrasena,tipoUser,1,convert(date, fechaL, 121) fechaL
			FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia/Usuario', 1)
				WITH(
					nombre VARCHAR(100) '@Nombre',
					contrasena VARCHAR(100) '@password',
					tipoUser Varchar(100) '@tipo',
					fechaL VARCHAR(100) '../@fecha'
				);

-----Propietario-------

			INSERT INTO @TemporalPropietario (IdentidadTemporal,NomTemp,Activo,TipoIdTemp,FechaTemp)

			SELECT Id,Nom,1,TipoId,convert(date, FechaL, 121) FechaL
			FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia/Propietario', 2)
				WITH(
					Id VARCHAR(20) '@identificacion',
					Nom VARCHAR(100) '@Nombre' ,
					TipoId int '@TipoDocIdentidad',
					FechaL VARCHAR(100) '../@fecha'
				);
-----TransConsumo-------

			INSERT INTO @TemporalTransConsumo (Lectura,Descripcion,Finca ,Tipo,FechTemp)

			SELECT lectura,descrip,finca,tipo,convert(date, FechaL, 121) FechaL
			FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia/TransConsumo', 2)
				WITH(
					lectura INT '@LecturaM3',
					descrip VARCHAR(150) '@descripcion' ,
					finca int '@NumFinca',
					tipo int '@id',
					FechaL VARCHAR(100) '../@fecha'
				)
				

			
--Propietario Juridico--------

			INSERT INTO @TemporalPropJurid(IDPropietario,Documento ,Activo ,Fech )

			SELECT IDProp,docu,1,convert(date, [fechaLeida], 121)[fechaLeida]
			FROM OPENXML (@hdoc, 'Operaciones_por_Dia/OperacionDia/PersonaJuridica',1)
				WITH(	IDProp Varchar(250) '@docidPersonaJuridica',
						docu Varchar(250) '@DocidRepresentante',
						fechaLeida VARCHAR(100)	'../@fecha'
				);

--Tabla Temporal de Pagos--------

			INSERT INTO @Pagos(NumFinca, TipoRecibo, Fecha)

			SELECT TipoRecibo, NumFinca, convert(date, [fechaLeida], 121)[fechaLeida]
			FROM OPENXML (@hdoc, 'Operaciones_por_Dia/OperacionDia/Pago',2)
				WITH(	TipoRecibo INT '@TipoRecibo',
						NumFinca INT '@NumFinca',
						fechaLeida VARCHAR(100)	'../@fecha'
				);

/*---CambiosPropiedad--------

			INSERT INTO @TemporalCambios(NumFinca , NuevoValor,Fecha)

			SELECT num,valor,convert(date, [fechaLeida], 121)[fechaLeida]
			FROM OPENXML (@hdoc, 'Operaciones_por_Dia/OperacionDia/CambioPropiedad',1)
				WITH(	num INT '@NumFinca',
						valor MONEY '@NuevoValor',
						fechaLeida VARCHAR(100)	'../@fecha'
				)
			;*/
				
			--------------------------------------------------------*/

-----Inicio del ciclo para insertar los archivos a las tablas reales con fechas------------------------

			WHILE (@fechaActual <= @fechaMaxima)
				BEGIN
					SET NOCOUNT ON 

					SET @DiaDeCobro = Day(@fechaActual);
					IF(@DiaDeCobro = 25 or @DiaDeCobro = 8 or @DiaDeCobro = 9 or @DiaDeCobro = 4
						or @DiaDeCobro = 3 or @DiaDeCobro = 5 or @DiaDeCobro = 7 or @DiaDeCobro = 6)
						BEGIN TRY
							EXEC ProyectoBases.dbo.DiaDeCobro @inDia = @DiaDeCobro, 
															  @inFecha = @fechaActual,
															  @monto = null
						END TRy
						BEGIN CATCH
							print error_message()
						END CATCH


---Propiedades-----------				
					
					INSERT INTO [dbo].[Propiedad] (NumPropiedad,Valor,Direccion,Activo,Fecha)
					SELECT NumTemp ,ValTemp,DireccionTemp ,1,FechTemp  FROM @TemporalPropiedad 
					WHERE [@TemporalPropiedad].[FechTemp] = @fechaActual ;

----Usuarios-----
					INSERT INTO [dbo].[Usuario] (Nombre,Password,TipoUsuario,Activo,Fecha)				
				    SELECT NomTemp ,PasswordTemp,TipoTemp,1,FechTemp FROM @TemporalUsuario
					WHERE [@TemporalUsuario].[FechTemp] = @fechaActual ;

---Propietarios-----

					INSERT INTO [dbo].[Propietario] (Identificacion,Nombre,Activo,ID_TDoc,Fecha )

					SELECT IdentidadTemporal,NomTemp,1,TipoIdTemp,FechaTemp FROM @TemporalPropietario
					WHERE [@TemporalPropietario].FechaTemp = @fechaActual;

---Trans-----

				    INSERT INTO [dbo].[TransConsumo] (LecturaM3,Descripcion,ID_Propiedad,Tipo,Fecha)

					SELECT Lectura ,Descripcion,Propiedad.ID_Propiedad,Tipo,FechTemp FROM @TemporalTransConsumo
					Inner JOIN Propiedad
					on [@TemporalTransConsumo].Finca = Propiedad.NumPropiedad
					WHERE [@TemporalTransConsumo].FechTemp = @fechaActual
				
					

----PropJuridico-----
					
					INSERT INTO [dbo].[PropJuridico] (ID_Propietario,Documento,Activo,Fecha)

					SELECT Propietario.ID_Propietario,Documento,1 ,Fech  FROM @TemporalPropJurid
					Inner JOIN Propietario
					on [@TemporalPropJurid].IDPropietario= Propietario.Identificacion
					WHERE [@TemporalPropJurid].Fech = @fechaActual

					
-----Comprobante---------------
	
					INSERT INTO [dbo].[Comprobante] (ID_Recibo, NumPropiedad, TipoRecibo, Fecha)

					SELECT MIN(Recibos.ID_Recibo), NumFinca, TipoRecibo, @Pagos.Fecha FROM	@Pagos
					INNER JOIN Recibos ON @Pagos.TipoRecibo = Recibos.ID_Concepto
					INNER JOIN Propiedad ON Propiedad.ID_Propiedad = Recibos.ID_Propiedad
					WHERE (Propiedad.NumPropiedad = @Pagos.NumFinca) AND ([@Pagos].Fecha = @fechaActual)
							AND (Recibos.Estado = 0)

/*---Cambios-----
					
					UPDATE Propiedad
					SET Propiedad.Valor = [@TemporalCambios].NuevoValor , Propiedad.Fecha = [@TemporalCambios].Fecha
					where (Propiedad.NumPropiedad = [@TemporalCambios].NumFinca) AND ([@TemporalCambios].Fecha = @fechaActual)
 
					
				*/	
--Insercion de las otras tablas , las intermedias -------------
			
--ProxPro--------------------

					INSERT INTO [dbo].[Pro_x_Pro] (ID_Propiedad,ID_Propietario,Activo,Fecha)

					SELECT Propiedad.ID_Propiedad, Propietario.ID_Propietario,1, @fechaActual
					FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia/PropiedadVersusPropietario', 1)
						WITH(
							Finca VARCHAR(20) '@NumFinca' ,
							Ident VARCHAR(20) '@identificacion',
							fechaLeida VARCHAR(100) '../@fecha'
						)
						INNER JOIN Propiedad ON Finca = Propiedad.NumPropiedad
						INNER JOIN Propietario ON Ident = Propietario.Identificacion
						WHERE fechaLeida = @fechaActual ;

--INSERT ProxCC-----------------REVISAR 

					INSERT INTO [dbo].[Pro_x_CC] (ID_CC,ID_Propiedad,Activo,Fecha)

					SELECT ConceptoCobro.ID_CC,Propiedad.ID_Propiedad,1,@fechaActual

					FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia/ConceptoCobroVersusPropiedad', 1)
						WITH(
							Finca VARCHAR(20) '@NumFinca' ,
							Cobro VARCHAR(20) '@idcobro',
							fechaLeida VARCHAR(100) '../@fecha'
						)
						INNER JOIN Propiedad ON Finca = Propiedad.NumPropiedad
						INNER JOIN ConceptoCobro ON Cobro = ConceptoCobro.ID_CC
						WHERE [fechaLeida] = @fechaActual ;

-----ProxUser---------------


					INSERT INTO [dbo].[Pro_x_Usuario]   (ID_Propiedad,ID_Usuario,Activo,Fecha)

					SELECT Propiedad.ID_Propiedad,Usuario.ID_Usuario,1,@fechaActual

					FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia/UsuarioVersusPropiedad', 1)
						WITH(
							Finca VARCHAR(20)'@NumFinca' ,
							Usuario VARCHAR(100) '@nombreUsuario',
							fechaLeida VARCHAR(100) '../@fecha'
						)
						INNER JOIN Propiedad ON Finca = Propiedad.NumPropiedad
						INNER JOIN Usuario ON Usuario = Usuario.Nombre
						WHERE [fechaLeida] = @fechaActual ;

					SELECT @fechaActual = DATEADD(DAY,1,@fechaActual);
				END
		COMMIT
	  END TRY

	  BEGIN CATCH 
	  print error_message()
		ROLLBACK;
		THROW 70001,'Error en la insercion de Operaciones',1;
	  END CATCH
  END 
  