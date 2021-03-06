USE [ProyectoBases]
GO
/****** Object:  StoredProcedure [dbo].[ConfirmacionAP]    Script Date: 5/8/2020 07:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ConfirmacionAP] @inMontoTotal INT  ,@inID_Propiedad INT,@inPlazo INT --verificar como le pasaba yo lo money 
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE  @Monto Money,
				@intereses money 
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

--Intereses 
		SET @Monto = (convert(varchar,cast(@inMontoTotal as money),1))
		SET @intereses =(Select CT.Valor/100 FROM ConfigTable CT where CT.Tipo= 'Decimal')

		Set @contador = (Select max(id) from tmp)
		SET @i=(Select min(id) from tmp)
		SET @Fecha = GETDATE()
		SET @Cuota = @Monto*((@intereses * (POWER((1 + @intereses),@inPlazo)))/ ((POWER((1+@intereses),@inPlazo))-1))
		BEGIN TRAN



-- Agrega Comprobante de Pago 
			Insert Into Comprobante( --Añadir medio de pago 'AP# ' + CAST(@idAP AS VARCHAR(10))
				Fecha,
				Monto,
				NumFinca,
				MedioPago
				)
			values (
				GETDATE(),
				@Monto,
				@inID_Propiedad,
				'AP#' + CAST(@ID_AP AS VARCHAR(10))
			)

SET @ID_Comprobante = IDENT_CURRENT('[dbo].[Comprobante]')

-- Crea el AP
			INSERT INTO AP (
				ID_Propiedad,
				ID_Comprobante,
				MontoInicial,
				Saldo,
				TasaInteres,
				PlazoInicial,
				Cuota,
				FechaCreacion
			)
			VALUES  (
				@inID_Propiedad,
				@ID_Comprobante,
				@Monto,
				0,
				@intereses,
				@inPlazo,
				@cuota,
				GETDATE()
			)

--ID _AP para comprobante 

			SET @ID_AP = IDENT_CURRENT('[dbo].[AP]')

			/*
-- Enlazar el Comprobante con el AP
			UPDATE AP
			set AP.ID_Comprobante = @ID_Comprobante
			where AP.ID_Propiedad = @inID_Propiedad
			*/
----Crear recibo , monto le ponemos 0 , estADO PAGO , tipo 12 
			INSERT INTO Recibos(
					ID_Propiedad,
					ID_Concepto,
					Fecha,
					Monto,
					FechaVencimiento,
					Estado
			)
			Values (@inID_Propiedad,12,GETDATE(),0,GETDATE(),1)

---Guardo el idRecibo
			SET @IDRecibo = (SELECT max(A.ID_Recibo) FROM Recibos A)

-- Enlace del comprobante con los recibos
			while (@i <= @contador)
			BEGIN
				Set @IDRecibo = (Select idRecibo FROM tmp where tmp.id = @i)

				UPDATE Recibos
				SET Recibos.Estado = 1
				where Recibos.ID_Recibo= @IDRecibo
										
				Insert INTO  ReciboXComprobante (
					ID_Recibo, 
					ID_Comprobante
				)
				Select @IDRecibo,@ID_Comprobante
			
				Set @i = @i+1	
			END 

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

			Select A.ID_AP,2,A.MontoInicial,A.MontoInicial * @intereses/12,A.PlazoInicial,GETDATE(),@IDRecibo
			from AP A
			where A.ID_AP = @ID_AP

-- Actualizacion en AP
			UPDATE AP
			SET AP.Saldo = @Monto
			where AP.ID_AP = @ID_AP
		DELETE FROM tmp;
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
