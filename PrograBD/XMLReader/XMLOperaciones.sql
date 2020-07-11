USE [ProyectoBases]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[LeerOperaciones]

AS

BEGIN
	BEGIN TRY
		BEGIN TRAN
		

			/*DELETE FROM Pro_x_Pro
			DELETE FROM Pro_x_Usuario
			DELETE FROM Pro_x_CC
			DELETE FROM PropJuridico

			DELETE FROM Propiedad
			DELETE FROM Propietario
			DELETE FROM Usuario*/

			DECLARE @Varios XML
			DECLARE @TemporalFechas table (fecha date);
			DECLARE @TemporalPropietario table (IdentidadTemporal VARCHAR(250),NomTemp VARCHAR(100),Activo bit,TipoIdTemp int,FechaTemp DATE);
			DECLARE @TemporalUsuario table (NomTemp VARCHAR(100),PasswordTemp VARCHAR(100),TipoTemp Varchar(100),Activo BIT,FechTemp DATE);  
			DECLARE @TemporalPropiedad table (NumTemp INT,ValTemp MONEY,DireccionTemp VARCHAR(250),Activo BIT,FechTemp DATE); 
			/*DECLARE @TemporalPropJurid table (IDPropietario int,Documento Varchar(250),IDTipo int,Activo BIT,Fecha DATE);*/
			SET NOCOUNT ON 

			DECLARE @fechaMin DATE
			DECLARE @fechaMax DATE

			SELECT @Varios = C	
			

			FROM OPENROWSET (BULK 'C:\XML\Operaciones.xml', SINGLE_BLOB) AS Varios(C)
			
			DECLARE @hdoc int

			EXEC sp_xml_preparedocument @hdoc OUTPUT, @Varios

			INSERT INTO @TemporalFechas ([fecha])
			SELECT convert(date, fechaInsercion, 121) [fechaInsercion]
			FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia', 1)

			WITH([fechaInsercion] VARCHAR (40) '@fecha');
			----------------------------------------------------------------
			
			----------------------------------------------------
			-------CREACION TABLA FECHAS Y VARIABLES DATE-------
			----------------------------------------------------

			SELECT @fechaMax = MAX(fecha) FROM @TemporalFechas 
			SELECT @fechaMin = MIN(fecha) FROM @TemporalFechas 
			
			DECLARE @fechaActual date
			SET @fechaActual = @fechaMin;


			----------------------------------------------
			-------INSERCION DATOS VARIABLES TABLAS-------
			----------------------------------------------

			---- INSERT PROPIEDADES ----
			INSERT INTO @TemporalPropiedad (NumTemp ,ValTemp,DireccionTemp ,Activo ,FechTemp )

			SELECT NumFinca,valor,direccion,1,convert(date, fechaLeida, 121) fechaLeida
			FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia/Propiedad', 2)
				WITH(
					NumFinca INT '@NumFinca' ,
					valor  MONEY '@Valor',
					direccion VARCHAR(250) '@Direccion',
					fechaLeida VARCHAR(40) '../@fecha'
				);
			
			------------------------------
			----INSERT DE PROPIETARIOS----

			INSERT INTO @TemporalPropietario (IdentidadTemporal,NomTemp,Activo,TipoIdTemp,FechaTemp)

			SELECT Id,Nom,1,TipoId,convert(date, FechaL, 121) FechaL
			FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia/Propietario', 2)
				WITH(
					Id VARCHAR(20) '@identificacion',
					Nom VARCHAR(100) '@Nombre' ,
					TipoId int '@TipoDocIdentidad',
					FechaL VARCHAR(100) '../@fecha'
				);

			--------------------------
			----INSERT DE USUARIOS----
			
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

/*
			--------------------------
			----INSERT DE PropJurid----

			INSERT INTO @TemporalPropJurid(IDPropietario,Documento,IDTipo ,Activo ,Fecha )

			SELECT IDProp,[TipDocIdRepresentante],[Representante],convert(date, [fechaLeida], 121)[fechaLeida],[docidPersonaJuridica]
			FROM OPENXML (@hdoc, 'Operaciones_por_Dia/OperacionDia/PersonaJuridica',1)
				WITH(	[DocidRepresentante] VARCHAR(100) '@DocidRepresentante',
						[TipDocIdRepresentante] VARCHAR(30) '@TipDocIdRepresentante',
						[docidPersonaJuridica] VARCHAR(100) '@docidPersonaJuridica',
						[fechaLeida] VARCHAR(100)	'../@fecha',
						[Representante]		VARCHAR(100) '@Nombre');


			--------------------------------------------------------*/
			WHILE (@fechaActual <= @fechaMax)
				BEGIN
					SET NOCOUNT ON 
					--------------------------
					----INSERT PROPIEDADES----
					INSERT INTO [dbo].[Propiedad] (NumPropiedad,Valor,Direccion,Activo,Fecha)
					SELECT NumTemp ,ValTemp,DireccionTemp ,1,FechTemp  FROM @TemporalPropiedad 
					WHERE [@TemporalPropiedad].[FechTemp] = @fechaActual ;

					
					------------------------------
					----INSERT DE PROPIETARIOS----*/

					INSERT INTO [dbo].[Propietario] (Identificacion,Nombre,Activo,ID_TDoc,Fecha )

					SELECT IdentidadTemporal,NomTemp,1,TipoIdTemp,FechaTemp FROM @TemporalPropietario
					WHERE [@TemporalPropietario].FechaTemp = @fechaActual;

					
					--------------------------
					----INSERT DE USUARIOS----
			
					INSERT INTO [dbo].[Usuario] (Nombre,Password,TipoUsuario,Activo,Fecha)				
				    SELECT NomTemp ,PasswordTemp,TipoTemp,1,FechTemp FROM @TemporalUsuario
					WHERE [@TemporalUsuario].[FechTemp] = @fechaActual ;
						


			
					/*--------------------------------------
					----INSERT DE PROPIETARIO JURIDICO----
					Declare @ID int
					SET @ID = SELECT Propietario.ID_Propietario
					FROM Propietario
					where  Propietario.Identificacion = [@TemporalPropJurid].DocidRepresentante
			
					INSERT INTO [dbo].[PropJuridico] ([IDPropietario],[IDTipoIdResponsable],[NumIdResponsable],[Responsable])
					SELECT [Propietario].[ID],[TipoId],[NumIdResponsable], [Responsable] FROM @TemporalPropJurid
					INNER JOIN Propietario ON [NumId] = [NumIdJurid]
					WHERE [@TemporalPropJurid].[Fech] = @fechaActual;
					*/
				 ---------------------------------
					-- INSERTS DE TABLAS INTERMEDIAS --
					---------------------------------
			
					--------------------------------------
					----INSERT PROPIEDAD por PROPIETARIO----

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

					--------------------------------------
					--INSERT DE USUARIOS por PROPIEDAD


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

					--------------------------------------
					--INSERT DE CC POR PROPIEDADAES

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
  