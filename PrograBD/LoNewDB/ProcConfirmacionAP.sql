CREATE PROC ConfirmacionAP @inMontoTotal MONEY ,@inID_Propiedad INT,@inPlazo INT --verificar como le pasaba yo lo money 
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE  @intereses money 
				,@ID_AP int
				,@ID_Comprobante int
				,@cuota money
				,@Fecha date,
				@i int
				,@contador int,
				@IDRecibo int;


	
-- Valida la propiedad
		IF (@inID_Propiedad <= 0 or @inID_Propiedad IS NULL )
		BEGIN
			RETURN -1
		END
		--Calcular los intereses 
		Set @contador = (Select max(id) from tmp)
		SET @i=1
		SET @Fecha = GETDATE()
		SET @cuota= @inMontoTotal * ( (@intereses*(1 + @intereses)*@inPlazo)/((1+@intereses)*@inPlazo - 1))
		BEGIN TRAN

-- Crea el AP
			INSERT INTO AP (
				ID_Propiedad,
				MontoInicial,
				Saldo,
				TasaInteres,
				PlazoInicial,
				Cuota,
				FechaCreacion
			)
			VALUES  (
				@inID_Propiedad,
				@inMontoTotal,
				0,
				@intereses,
				@inPlazo,
				@cuota,
				GETDATE()
			)

--ID _AP para comprobante 

			SELECT @ID_AP = max(A.ID_AP)
			from AP A

-- Agrega Comprobante de Pago 
			Insert Into Comprobante( --Añadir medio de pago 'AP# ' + CAST(@idAP AS VARCHAR(10))
				Fecha,
				Monto,
				NumFinca)
			values (
				GETDATE(),
				@inMontoTotal,
				@inID_Propiedad
			)

-- Guarda ID Comprobante 
			SELECT @ID_Comprobante = max(C.ID_Comprobante)
			from Comprobante C

-- Enlazar el Comprobante con el AP
			UPDATE AP
			set AP.ID_Comprobante = @ID_Comprobante
			where AP.ID_Propiedad = @inID_Propiedad

-- Enlace del comprobante con los recibos
			while (@i <= @contador)
			BEGIN
				Set @IDRecibo = (Select ID_Recibo FROM Recibos INNER JOIN tmp on tmp.idRecibo = Recibos.ID_Recibo where tmp.id = @i)
										
				Insert INTO  ReciboXComprobante (
					ID_Recibo, 
					ID_Comprobante
				)
				Values (
					@IDRecibo,
					@ID_Comprobante
				)
				Set @i = @i+1	
			END 

----Crear recibo , monto le ponemos 0 , estADO PAGO , tipo 12 
--Movimiento Inicial, un debito al saldo inicial 
				
			INSERT INTO MovimientoAP(
				ID_AP,
				TipoMov,
				InteresMes,
				Amortizacion,
				plazoResta,
				Fecha,
				ID_Recibo
			)
			Select A.ID_AP,2,A.MontoInicial,A.MontoInicial * @intereses/12,A.PlazoInicial,GETDATE(),
			from AP A
			where A.Id = @idAP

-- Actualizacion en AP
			UPDATE dbo.AP
			SET AP.Saldo = @montoTotal
			where AP.ID_AP = @ID_AP

		COMMIT
		RETURN 1 -- Exito
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT >0
			ROLLBACK TRAN
		PRINT('Hubo un error, logro terminar la Confirmacion de AP');
		RETURN @@ERROR * -1
	END CATCH
END;
