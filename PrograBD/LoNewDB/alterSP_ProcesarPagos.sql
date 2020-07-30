USE [ProyectoBases]
GO
IF OBJECT_ID('[dbo].[ProcesarPagos]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[ProcesarPagos]  
END 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ProcesarPagos] @Pagos PagosTipo READONLY
AS   
	BEGIN
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON
			DECLARE @idMenor INT, @idMayor INT, @fechaVence DATE, @fechaOperacion DATE, @montoMoratorio MONEY, @contador INT,
					@idComprobante INT, @tasaMoratoria FLOAT, @montoRecibo MONEY, @tipoCC int, @idPropiedad INT
			--TABLA DE IDS DE RECIBOS POR CONCEPTO DE COBRO DE CADA PROPIEDAD 
			DECLARE @idRecibosPagar TABLE(id INT IDENTITY(1,1),idRecibo INT)
			--CONTADOR PARA ITERAR TABLA DE RECIBOS DE CADA PROPIEDAD Y SABER DONDE QUEDE LA ULTIMA VEZ
			SET @contador = 1
			SELECT @idMenor = min([id]), @idMayor=max([id]) FROM @Pagos--SACA ID MAYOR Y MENOR PARA ITERAR LA TABLA
			BEGIN TRAN
				--RECORRE LOS PAGOS DE FINCAS
				WHILE @idMenor<=@idMayor
				BEGIN
					SET @montoMoratorio = 0 --MONTO MORATORIO SE CAMBIA SI ES QUE HAY RECIBO MORATORIO, SINO ES 0
					SET @fechaOperacion = (SELECT fechaOperaciones FROM @Pagos WHERE id = @idMenor)
					SET @tipoCC = (SELECT idTipoRecibo FROM @Pagos WHERE id = @idMenor)--TIPO CC EN EL PAGO
					SET @idPropiedad = (SELECT pr.ID_Propiedad FROM [dbo].[Propiedad] PR --PROPIEDAD A LA QUE SE LE HACE EL PAGO
										INNER JOIN @Pagos P ON P.numFinca = PR.NumPropiedad 
										WHERE P.id = @idMenor)
					
					--VERIFICA SI EXISTE EL COMPROBANTE DE PAGO PARA ESA PROPIEDAD, ESE MISMO DIA
					SET @idComprobante = (SELECT CC.ID_Comprobante FROM Comprobante CC 
												INNER JOIN ReciboXComprobante RP ON RP.ID_Comprobante = CC.ID_Comprobante
												INNER JOIN Recibos R ON R.ID_Recibo = RP.ID_Recibo
												WHERE R.ID_Propiedad = @idPropiedad AND CC.Fecha = @fechaOperacion)
					--SI NO EXISTE ENTONCES LO CREA
					IF @idComprobante IS NULL
					BEGIN
						INSERT INTO Comprobante(Fecha,Monto)
						SELECT @fechaOperacion,0
						SET @idComprobante = IDENT_CURRENT('[dbo].[ComprobantePago]')
					END
					
					--SE INSERTAN LOS RECIBOS DE LA PROPIEDAD EN LA TABLA VARIABLE, Y SE VAN ACUMULANDO, PARA ESO SE USA EL CONTADOR
					--SI ES CONCEPTO DE COBRO 10 (RECONEXION)
					IF @tipoCC = 10
						BEGIN
							INSERT INTO @idRecibosPagar(idRecibo)
							SELECT R.ID_Recibo
							FROM @Pagos P
							INNER JOIN Propiedad PR ON PR.NumPropiedad = P.numFinca 
							INNER JOIN Recibos R ON R.ID_Propiedad = PR.ID_Propiedad
							WHERE P.id = @idMenor AND R.Estado = 0
							AND (R.ID_Concepto = 1	  --GUARDA TODOS LOS RECIBOS DE AGUA PENDIENTES (1)
								OR R.ID_Concepto = 11 --GUARDA TODOS LOS RECIBOS MORATORIOS PENDIENTES (11)
								OR R.ID_Concepto = 10)--GUARDA TODOS LOS RECIBOS DE RECONEXION PENDIENTES (10)
						END
					ELSE--SI ES OTRO CONCEPTO DE COBRO
						BEGIN
							INSERT INTO @idRecibosPagar(idRecibo)
							SELECT R.ID_Recibo
							FROM @Pagos P
							INNER JOIN Propiedad PR ON PR.NumPropiedad = P.numFinca 
							INNER JOIN Recibos R ON R.ID_Propiedad = PR.ID_Propiedad
							WHERE P.id = @idMenor AND R.Estado = 0
							AND (R.ID_Concepto = 11			--GUARDA TODOS LOS RECIBOS MORATORIOS PENDIENTES (11)
								OR	R.ID_Concepto = @tipoCC)--GUARDA TODOS LOS RECIBOS DE DE ESE CONCEPTO DE COBRO PENDIENTES (@TIPOCC)
						END
					
					--MIENTRAS EXISTA UN CONCEPTO DE COBRO SIN PAGAR, RECORRA LOS RECIBOS
					WHILE EXISTS(SELECT idRP.id FROM @idRecibosPagar idRP INNER JOIN Recibos R ON R.ID_Recibo = idRP.idRecibo WHERE R.Estado = 0)
					BEGIN
						--ESTABLECE EL MONTO DEL RECIBO
						SET @montoRecibo = (SELECT R.Monto FROM Recibos R
											INNER JOIN @idRecibosPagar idRP ON R.ID_Recibo = idRP.idRecibo
											WHERE idRP.id = @contador)

						--INSERTA UNA RELACION ENTRE RECIBO Y COMPROBANTE DE PAGO
						INSERT INTO ReciboXComprobante(ID_Comprobante,ID_Recibo)
						SELECT @idComprobante, idRP.idRecibo
						FROM @idRecibosPagar idRP
						WHERE idRP.id = @contador

						--PAGA EL RECIBO ACTUALIZANDO SU ESTADO A PAGADO
						UPDATE Recibos
						SET [estado] = 1
						FROM @idRecibosPagar idRP
						WHERE idRP.idRecibo = Recibos.ID_Recibo AND idRP.id = @contador

						--VERIFICA SI SE DEBE CREAR RECIBO MORATORIO
						--SACA LA FECHA EN LA QUE VENCE EL RECIBO
						SET @fechaVence = (SELECT FechaVencimiento FROM [dbo].[Recibos] R
										   INNER JOIN @idRecibosPagar idRP ON idRP.idRecibo = R.ID_Recibo
										   WHERE @contador = idRP.id)
						--SI LA FECHA EN LA QUE VENCE ES MENOR A LA FECHA EN LA QUE SE ESTA PAGANDO EL RECIBO
						IF @fechaVence < @fechaOperacion
						BEGIN
							--SACA LA TASA MORATORIA DE ESE RECIBO
							SET @tasaMoratoria = (SELECT IM.Monto FROM Intereses_Moratorios IM
													INNER JOIN Recibos R ON R.ID_Concepto = IM.ID_IM 
													INNER JOIN  @idRecibosPagar idRP ON idRP.idRecibo = R.ID_Recibo
													WHERE idRP.id = @contador)
							--AQUI CAMBIA EL MONTO MORATORIO YA QUE SI SE DEBE CREAR RECIBO MORATORIO
							SET @montoMoratorio = (@montoRecibo*@tasaMoratoria/365)*ABS(DATEDIFF(d,@fechaVence,@fechaOperacion))
							
							--CREA UN RECIBO RE TIPO MORATORIO Y LO PAGA
							INSERT INTO Recibos(ID_Concepto,Monto,Estado,ID_Propiedad,Fecha,FechaVencimiento)
							SELECT CC.Concepto, @montoMoratorio, 1, @idPropiedad, @fechaOperacion, DATEADD(d,CC.DiaVencimiento,@fechaOperacion)
							FROM ConceptoCobro CC
							WHERE CC.ID_CC = 11
							
							--INSERTAR UNA RELACION ENTRE EL RECIBO MORATORIO PAGADO Y EL COMPROBANTE DE PAGO
							INSERT INTO ReciboXComprobante(ID_Comprobante,ID_Recibo)
							SELECT @idComprobante, IDENT_CURRENT('[dbo].[Recibos]')	
						END
						--AL FINAL ACTUALIZA EL MONTO DEL COMPORBANTE DE PAGO
						UPDATE Comprobante
						SET Monto = Monto + @montoRecibo+@montoMoratorio--SI NO HUBO RECIBO MORATORIO SUMA 0 MAS EL MONTO POR LOS DEMAS RECIBOS
						WHERE ID_Comprobante = @idComprobante
						SET @contador = @contador+1--INCREMENTA EL CONTADOR
					END
					SET @idMenor = @idMenor+1
				END
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW --600021, 'Error: No se ha podido crear los pago.',1;
		END CATCH
	END
