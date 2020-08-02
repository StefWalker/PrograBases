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
			SET NOCOUNT ON 
-----Declaramos una fecha maxima y una minima para saber el inicio y final -------------------------------

			DECLARE @fechaMinima DATE
			DECLARE @fechaMaxima DATE
			DECLARE @DiaDeCobro INT
			DECLARE @Monto MONEY
			DECLARE @VALOR MONEY

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
			
			Declare @cont int
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
/*
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
				*/

			
--Propietario Juridico--------

			INSERT INTO @TemporalPropJurid(IDPropietario,Documento ,Activo ,Fech )

			SELECT IDProp,docu,1,convert(date, [fechaLeida], 121)[fechaLeida]
			FROM OPENXML (@hdoc, 'Operaciones_por_Dia/OperacionDia/PersonaJuridica',1)
				WITH(	IDProp Varchar(250) '@docidPersonaJuridica',
						docu Varchar(250) '@DocidRepresentante',
						fechaLeida VARCHAR(100)	'../@fecha'
				);
				

---CambiosPropiedad--------

			INSERT INTO @TemporalCambios(NumFinca , NuevoValor,Fecha)

			SELECT num, valor, convert(date, [fechaLeida], 121)[fechaLeida]
			FROM OPENXML (@hdoc, 'Operaciones_por_Dia/OperacionDia/CambioPropiedad',1)
				WITH(	num INT '@NumFinca',
						valor MONEY '@NuevoValor',
						fechaLeida VARCHAR(100)	'../@fecha'
				);
				
			/*--------------------------------------------------------*/

-----Inicio del ciclo para insertar los archivos a las tablas reales con fechas------------------------

			WHILE (@fechaActual <= @fechaMaxima)
				BEGIN
					SET NOCOUNT ON 

					SET @DiaDeCobro = Day(@fechaActual);/*
					if(@DiaDeCobro = 25)
						begin
							Set @cont = 0
							IF((Select max(ID_PxC) from Pro_x_CC)is not null)
							begin
								while (@cont <= (Select max(ID_PxC) from Pro_x_CC))
									begin
										IF NOT Exists(select Recibos.ID_Propiedad from Recibos inner join Pro_x_CC on Pro_x_CC.ID_Propiedad = Recibos.ID_Propiedad 
														where Pro_x_CC.ID_PxC = @cont and Pro_x_CC.ID_CC = 1 and Recibos.Estado = 0)
											BEGIN
												Insert INTO Recibos (ID_Propiedad,
																	ID_Concepto,
																	Fecha,
																	Monto,
																	Estado)
												Select Propiedad.ID_Propiedad, 1, @fechaActual, 1 , 0 FROM Propiedad
												Inner Join Pro_x_CC ON Propiedad.ID_Propiedad = Pro_x_CC.ID_Propiedad
												WHERE Pro_x_CC.ID_CC = 1 and Pro_x_CC.ID_PxC = @cont

												Set @cont = @cont + 1
											END
										Set @cont = @cont + 1
									end
							end
						end
					if(@DiaDeCobro = 9 or @DiaDeCobro = 5)
						begin
							Declare @cc int
							if(@DiaDeCobro = 9) begin Set @cc = 3 end
							if(@DiaDeCobro = 5) begin Set @cc = 6 end

							Set @cont = 0
							IF((Select max(ID_PxC) from Pro_x_CC)is not null)
							begin
								while (@cont <= (Select max(ID_PxC) from Pro_x_CC))
									begin
										IF NOT Exists(select Recibos.ID_Propiedad from Recibos inner join Pro_x_CC on Pro_x_CC.ID_Propiedad = Recibos.ID_Propiedad 
														where Pro_x_CC.ID_PxC = @cont and Pro_x_CC.ID_CC = @cc and Recibos.Estado = 0)
											BEGIN
												Insert INTO Recibos (ID_Propiedad,
																	ID_Concepto,
																	Fecha,
																	Monto,
																	Estado)
												Select Propiedad.ID_Propiedad, @cc, @fechaActual, 1 , 0 FROM Propiedad
												Inner Join Pro_x_CC ON Propiedad.ID_Propiedad = Pro_x_CC.ID_Propiedad
												WHERE Pro_x_CC.ID_CC = @cc and Pro_x_CC.ID_PxC = @cont

												Set @cont = @cont + 1
											END
										Set @cont = @cont + 1
									end
							end
						end
					IF(@DiaDeCobro = 8 or @DiaDeCobro = 4 or @DiaDeCobro = 1
						or @DiaDeCobro = 3 or @DiaDeCobro = 7 or @DiaDeCobro = 6)
						begin
							EXEC ProyectoBases.dbo.DiaDeCobro @inDia = @DiaDeCobro, 
															  @inFecha = @fechaActual,
															  @monto = null
						end

					/*
					IF(@DiaDeCobro = 25 or @DiaDeCobro = 8 or @DiaDeCobro = 9 or @DiaDeCobro = 4 or @DiaDeCobro = 1
						or @DiaDeCobro = 3 or @DiaDeCobro = 5 or @DiaDeCobro = 7 or @DiaDeCobro = 6)
						BEGIN TRY
							EXEC ProyectoBases.dbo.DiaDeCobro @inDia = @DiaDeCobro, 
															  @inFecha = @fechaActual,
															  @monto = null
						END TRy
						BEGIN CATCH
							print error_message()
						END CATCH
					*/
					Set @cont = 0
					IF((Select max(ID_Recibo) from Recibos)is not null)
					begin
						while(@cont <= (Select max(ID_Recibo) from Recibos))
							begin
								if((Select ID_Recibo from Recibos WHERE ID_Recibo = @cont and Monto = 1) is not null)
									BEGIN
										if((Select Recibos.ID_Concepto from Recibos where ID_Recibo = @cont) = 3)
											BEGIN
												SET @VALOR = (Select (((Select CC_Porcentual.Porcentaje from CC_Porcentual where CC_Porcentual.ID_Por = 3) * Propiedad.Valor)/100) FROM Recibos
																Inner join Propiedad ON Recibos.ID_Propiedad = Propiedad.ID_Propiedad
																WHERE Recibos.ID_Recibo = @cont)
												IF(@VALOR is not null)
													BEGIN
														UPDATE Recibos
														SET Monto = @VALOR
														FROM Recibos
														where Recibos.ID_Recibo = @cont
													
														Set @cont = @cont + 1
													end
												Set @cont = @cont + 1
											end
										
										if((Select Recibos.ID_Concepto from Recibos where ID_Recibo = @cont) = 6)
											BEGIN
												SET @VALOR = (Select (((Select CC_Porcentual.Porcentaje from CC_Porcentual where CC_Porcentual.ID_Por = 6) * Propiedad.Valor)/100) FROM Recibos
																Inner join Propiedad ON Recibos.ID_Propiedad = Propiedad.ID_Propiedad
																WHERE Recibos.ID_Recibo = @cont)
												IF(@VALOR is not null)
													BEGIN
														UPDATE Recibos
														SET Monto = @VALOR
														FROM Recibos
														where Recibos.ID_Recibo = @cont

														Set @cont = @cont + 1
													end
												Set @cont = @cont + 1
											end
										if((Select Recibos.ID_Concepto from Recibos where ID_Recibo = @cont) = 1)
											BEGIN
												SET @VALOR = (Select (Propiedad.M3Acumulados - Propiedad.M3AcumuladosUltimoRecibo)*CC_ConsumoAgua.Valor_m3 FROM Recibos
																	INNER JOIN Propiedad ON Recibos.ID_Propiedad = Propiedad.ID_Propiedad
																	INNER JOIN CC_ConsumoAgua ON Recibos.ID_Concepto = CC_ConsumoAgua.ID_Con
																	Where Recibos.ID_Recibo = @cont and Recibos.ID_Concepto = 1)
					

													if(@VALOR < (Select CC_ConsumoAgua.MontoMinimoRecibo FROM CC_ConsumoAgua))
														begin
															Set @VALOR = (Select CC_ConsumoAgua.MontoMinimoRecibo FROM CC_ConsumoAgua)

															IF(@VALOR is not null)
																BEGIN
																	UPDATE Recibos
																	SET Monto = @VALOR
																	FROM Recibos
																	where Recibos.ID_Recibo = @cont

																	Set @cont = @cont + 1
																end
														end

												IF(@VALOR is not null)
													BEGIN
														UPDATE Recibos
														SET Monto = @VALOR
														FROM Recibos
														where Recibos.ID_Recibo = @cont

														Set @cont = @cont + 1
													end
												Set @cont = @cont + 1
											end
									end
								Set @cont = @cont + 1
							end
						end
						*/

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

				    INSERT INTO [dbo].[TransConsumo] (LecturaM3,ID_Propiedad,Tipo,Fecha)

					SELECT Lectura,Propiedad.ID_Propiedad,Tipo,FechTemp FROM @TemporalTransConsumo
					Inner JOIN Propiedad
					on [@TemporalTransConsumo].Finca = Propiedad.NumPropiedad
					WHERE [@TemporalTransConsumo].FechTemp = @fechaActual
				
					
----PropJuridico-----
					
					INSERT INTO [dbo].[PropJuridico] (ID_Propietario,Documento,Activo,Fecha)

					SELECT Propietario.ID_Propietario,Documento,1 ,Fech  FROM @TemporalPropJurid
					Inner JOIN Propietario
					on [@TemporalPropJurid].IDPropietario= Propietario.Identificacion
					WHERE [@TemporalPropJurid].Fech = @fechaActual

---Cambios-----
					
					UPDATE Propiedad
					SET Propiedad.Valor = [@TemporalCambios].NuevoValor,
						Propiedad.Fecha = [@TemporalCambios].Fecha
					From @TemporalCambios
					where (Propiedad.NumPropiedad = [@TemporalCambios].NumFinca) AND ([@TemporalCambios].Fecha = @fechaActual);



--Insercion de las otras tablas , las intermedias -------------


-----------Reconexion ---------------------

					INSERT INTO [dbo].[Recibos] (ID_Propiedad,ID_Concepto,Fecha,Monto,Estado)

					SELECT Propiedad.ID_Propiedad, TipoRecibo, fechaLeida, (CC_Fijo.Monto + sum(Recibos.Monto)), 0
					FROM OPENXML (@hdoc, 'Operaciones_por_Dia/OperacionDia/Pago',1)
						WITH(	
							NumFinca INT '@NumFinca',
							TipoRecibo INT '@TipoRecibo',
							fechaLeida VARCHAR(100)	'../@fecha'
						)
						INNER JOIN Propiedad ON Propiedad.NumPropiedad = NumFinca 
						INNER JOIN CC_Fijo ON CC_Fijo.ID_Fijo = TipoRecibo
						INNER JOIN Recibos on Propiedad.ID_Propiedad = Recibos.ID_Propiedad
						where CC_Fijo.ID_Fijo = 10 and TipoRecibo = 10 and fechaLeida = @fechaActual
						Group by Propiedad.ID_Propiedad, TipoRecibo, fechaLeida, CC_Fijo.Monto

----Comprobante-----

/*
					INSERT INTO [dbo].[Comprobante] (ID_Recibo, NumPropiedad, TipoRecibo, Fecha, Monto)

					SELECT MIN(Recibos.ID_Recibo), Propiedad.NumPropiedad, Recibos.ID_Concepto, @fechaActual, Recibos.Monto
					FROM OPENXML (@hdoc, 'Operaciones_por_Dia/OperacionDia/Pago',1)
						WITH(	
							NumFinca INT '@NumFinca',
							TipoRecibo INT '@TipoRecibo',
							fechaLeida VARCHAR(100)	'../@fecha'
						)
						INNER JOIN Recibos ON TipoRecibo = Recibos.ID_Concepto
						INNER JOIN Propiedad ON Propiedad.ID_Propiedad = Recibos.ID_Propiedad
						INNER JOIN ConceptoCobro ON Recibos.ID_Concepto = ConceptoCobro.ID_CC
						INNER JOIN Intereses_Moratorios ON ConceptoCobro.ID_CC = Intereses_Moratorios.ID_IM
						WHERE (Propiedad.NumPropiedad = NumFinca) AND (fechaLeida = @fechaActual) AND (Recibos.Estado = 0) AND (@fechaActual > DATEADD(DAY,ConceptoCobro.DiaVencimiento,Recibos.Fecha)) 
						GROUP BY Propiedad.NumPropiedad, Recibos.ID_Concepto, Recibos.Monto, ConceptoCobro.DiaVencimiento, Intereses_Moratorios.Monto



					INSERT INTO [dbo].[Comprobante] (ID_Recibo, NumPropiedad, TipoRecibo, Fecha, Monto)

					SELECT MIN(Recibos.ID_Recibo), Propiedad.NumPropiedad, Recibos.ID_Concepto, @fechaActual, Recibos.Monto
					FROM OPENXML (@hdoc, 'Operaciones_por_Dia/OperacionDia/Pago',1)
						WITH(	
							NumFinca INT '@NumFinca',
							TipoRecibo INT '@TipoRecibo',
							fechaLeida VARCHAR(100)	'../@fecha'
						)
						INNER JOIN Recibos ON TipoRecibo = Recibos.ID_Concepto
						INNER JOIN Propiedad ON Propiedad.ID_Propiedad = Recibos.ID_Propiedad
						INNER JOIN ConceptoCobro ON Recibos.ID_Concepto = ConceptoCobro.ID_CC
						WHERE (Propiedad.NumPropiedad = NumFinca) AND (fechaLeida = @fechaActual) AND (Recibos.Estado = 0) AND (@fechaActual <= DATEADD(DAY,ConceptoCobro.DiaVencimiento,@fechaActual)) 
						GROUP BY Propiedad.NumPropiedad, Recibos.ID_Concepto, Recibos.Monto
							  

						UPDATE [dbo].[Recibos]
						SET Recibos.Estado = 1
						From Recibos
						INNER JOIN Comprobante
						ON Recibos.ID_Recibo = Comprobante.ID_Recibo

						Set @Valor = (Select sum(Recibos.Monto) From Recibos
						INNER JOIN Recibos AS C ON c.ID_Propiedad = Recibos.ID_Propiedad
						Where c.ID_Concepto = 10 and Recibos.Estado = 0)



						UPDATE [dbo].[Recibos]
						SET Recibos.Estado = 1
						From Recibos
						INNER JOIN Recibos AS C ON c.ID_Propiedad = Recibos.ID_Propiedad
						Where c.ID_Concepto = 10 and Recibos.Estado = 0
						*/
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


--ProxProJur--------------------

					INSERT INTO [dbo].[PJur_x_Pro] (ID_Juridico,ID_Propiedad,Activo,Fecha)

					SELECT PropJuridico.ID_Juridico, Propiedad.ID_Propiedad,1, @fechaActual
					FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia/PropiedadVersusPropietario', 1)
						WITH(
							Finca VARCHAR(20) '@NumFinca' ,
							Ident VARCHAR(20) '@identificacion',
							fechaLeida VARCHAR(100) '../@fecha'
						)
						INNER JOIN Propiedad ON Finca = Propiedad.NumPropiedad
						INNER JOIN PropJuridico ON Ident = PropJuridico.Documento
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

						--PAGO DE LOS RECIBOS  
						DECLARE @Pagos PagosTipo  
						INSERT INTO @Pagos(numFinca,idTipoRecibo,fechaOperaciones)  
							SELECT [NumFinca],[TipoRecibo],[fechaDeIngreso9]
							FROM OPENXML (@hdoc, 'Operaciones_por_Dia/OperacionDia/Pago',1)  
								WITH (	[NumFinca]		VARCHAR(30)	'@NumFinca',  
										[TipoRecibo]	INT			'@TipoRecibo',
										[fechaDeIngreso9]	VARCHAR(100)	'../@fecha')
								WHERE [fechaDeIngreso9] = @fechaActual
						EXEC [dbo].[ProcesarPagos] @Pagos
						DELETE @Pagos
						
						--ACTUALIZACION DE VALOR PROPIEDAD
						DECLARE @nuevosValProp ValorPropiedadTipo  
						INSERT INTO @nuevosValProp(numFinca,nuevoValor)  
							SELECT [NumFinca],[nuevoValor]
							FROM OPENXML (@hdoc, 'Operaciones_por_Dia/OperacionDia/CambioPropiedad ',1)  
								WITH (	[NumFinca]			INT		'@NumFinca',  
										[nuevoValor]		MONEY			'@NuevoValor',
										[fechaDeIngreso10]	VARCHAR(100)	'../@fecha')
								WHERE [fechaDeIngreso10] = @fechaActual
						EXEC [dbo].[ProcActualizarValProp] @nuevosValProp,@fechaActual
						DELETE FROM @nuevosValProp
						DELETE @nuevosValProp

						
						--REGISTRO CONSUMO DE AGUA||
						DECLARE @consumo ConsumoTipo  
						INSERT INTO @consumo(numFinca,LecturaM3,Fecha,descripcion,idTipo)  
							SELECT [NumFinca],[LecturaM3],CONVERT(DATE,[fechaDeIngreso11],121)[fechaDeIngreso11],[descripcion],[idTipo]
							FROM OPENXML (@hdoc, 'Operaciones_por_Dia/OperacionDia/TransConsumo',1)  
								WITH (	[NumFinca]		INT	    	'@NumFinca',  
										[LecturaM3]		INT			'@LecturaM3',
										[idTipo]		INT			'@id',
										[descripcion]	VARCHAR(100)	'@descripcion',
										[fechaDeIngreso11] DATE			'../@fecha')
								WHERE [fechaDeIngreso11] = @fechaActual
						EXEC [dbo].[ProcesaConsumo] @consumo
						DELETE @consumo
							/*
						--ORDENES DE CORTA
						EXEC [dbo].[CorteAgua]  @fechaActual
						EXEC [dbo].[ProcReconexionAgua] @fechaActual*/
						
					--GENERACION DE RECIBOS
						EXEC [dbo].[RecibosGenerator] @fechaActual



					SELECT @fechaActual = DATEADD(DAY,1,@fechaActual);

				END
		COMMIT
	  END TRY

	  BEGIN CATCH 
	  print error_message()
		ROLLBACK;
		THROW 70001,'Error en la insercion de Operaciones',1;
	  END CATCH

	  Declare @contador int = 0
	  while(@contador <= (Select MAX(ID_TCons) FROM TransConsumo))
		BEGIN
		  UPDATE Propiedad
		  SET M3AcumuladosUltimoRecibo = M3Acumulados,
			  M3Acumulados = TransConsumo.LecturaM3
		  FROM TransConsumo
		  WHERE (TransConsumo.ID_Propiedad = Propiedad.ID_Propiedad) AND (TransConsumo.ID_TCons = @contador)

		  Set @contador = @contador + 1
		END

  END 
  