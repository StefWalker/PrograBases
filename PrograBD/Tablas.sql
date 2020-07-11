
USE [ProyectoBases]

CREATE TABLE Propiedad
(
  ID_Propiedad INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  NumPropiedad INT NOT NULL,
  Valor MONEY NOT NULL,
  Direccion VARCHAR(250) NOT NULL,
  Activo BIT NOT NULL DEFAULT 1,
  Fecha DATE NOT NULL DEFAULT GETDATE(),
  M3Acumulados INT NOT NULL DEFAULT 0,
  M3AcumuladosUltimoRecibo INT NOT NULL DEFAULT 0
);

CREATE TABLE TipoDoc
(
  ID_TDoc INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  TipoDoc INT NOT NULL,
  Tipo VARCHAR(100) NOT NULL
);

CREATE TABLE Propietario
(
  ID_Propietario INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Identificacion VARCHAR(250) NOT NULL,
  Nombre VARCHAR(100) NOT NULL,
  Activo BIT NOT NULL  DEFAULT 1,
  ID_TDoc INT NOT NULL,
  Fecha DATE NOT NULL DEFAULT GETDATE(),
  FOREIGN KEY (ID_TDoc) REFERENCES TipoDoc(ID_TDoc)
);

CREATE TABLE Usuario
(
  ID_Usuario INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Nombre VARCHAR(100) NOT NULL,
  Password VARCHAR(100) NOT NULL,
  TipoUsuario VARCHAR(100) NOT NULL,
  Activo BIT NOT NULL  DEFAULT 1,
  Fecha DATE NOT NULL DEFAULT GETDATE()
);

CREATE TABLE PropJuridico
(
  ID_Juridico INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  ID_Propietario INT REFERENCES Propietario(ID_Propietario) NOT NULL,
  Documento VARCHAR(250) NOT NULL,
  ID_TDoc INT NOT NULL DEFAULT 4,
  Activo BIT NOT NULL  DEFAULT 1,
  Fecha DATE NOT NULL DEFAULT GETDATE(),
  FOREIGN KEY (ID_TDoc) REFERENCES TipoDoc(ID_TDoc)
);

CREATE TABLE ConceptoCobro
(
  ID_CC INT PRIMARY KEY NOT NULL,
  TipoCC VARCHAR(50) NOT NULL,
  Concepto VARCHAR(100) NOT NULL,
  FechaVencimiento INT NOT NULL,
  Fecha DATE NOT NULL DEFAULT GETDATE(),
  Activo BIT NOT NULL  DEFAULT 1
);

CREATE TABLE CC_Fijo
(
  ID_Fijo INT PRIMARY KEY REFERENCES ConceptoCobro(ID_CC) NOT NULL,
  Monto MONEY NOT NULL
);

CREATE TABLE CC_ConsumoAgua
(
  ID_Con INT PRIMARY KEY REFERENCES ConceptoCobro(ID_CC) NOT NULL,
  Valor_m3 MONEY NOT NULL,
  MontoMinimoRecibo INT NOT NULL
);

CREATE TABLE CC_Porcentual
(
  ID_Por INT PRIMARY KEY REFERENCES ConceptoCobro(ID_CC) NOT NULL,
  Porcentaje MONEY NOT NULL
);

CREATE TABLE Intereses_Moratorios
(
  ID_IM INT PRIMARY KEY REFERENCES ConceptoCobro(ID_CC) NOT NULL,
  Monto MONEY NOT NULL
);

CREATE TABLE Pro_x_Pro
(
  ID_PxP INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  ID_Propiedad INT NOT NULL,
  ID_Propietario INT NOT NULL,
  Activo BIT NOT NULL  DEFAULT 1,
  Fecha DATE NOT NULL DEFAULT GETDATE(),
  FOREIGN KEY (ID_Propiedad) REFERENCES Propiedad(ID_Propiedad),
  FOREIGN KEY (ID_Propietario) REFERENCES Propietario(ID_Propietario)
);

CREATE TABLE Pro_x_Usuario
(
  ID_PxU INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  ID_Propiedad INT NOT NULL,
  ID_Usuario INT NOT NULL,
  Activo BIT NOT NULL  DEFAULT 1,
  Fecha DATE NOT NULL DEFAULT GETDATE(),
  FOREIGN KEY (ID_Propiedad) REFERENCES Propiedad(ID_Propiedad),
  FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)
);

CREATE TABLE Pro_x_CC
(
  ID_PxC INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  ID_CC INT NOT NULL,
  ID_Propiedad INT NOT NULL,
  Activo BIT NOT NULL  DEFAULT 1,
  Fecha DATE NOT NULL DEFAULT GETDATE(),
  FOREIGN KEY (ID_CC) REFERENCES ConceptoCobro(ID_CC),
  FOREIGN KEY (ID_Propiedad) REFERENCES Propiedad(ID_Propiedad)
);

CREATE TABLE PJur_x_Pro
(
  ID_JxP INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  ID_Juridico INT NOT NULL,
  ID_Propiedad INT NOT NULL,
  Activo BIT NOT NULL  DEFAULT 1,
  Fecha DATE NOT NULL DEFAULT GETDATE(),
  FOREIGN KEY (ID_Juridico) REFERENCES PropJuridico(ID_Juridico),
  FOREIGN KEY (ID_Propiedad) REFERENCES Propiedad(ID_Propiedad)
);

CREATE TABLE Bitacora
(
  ID_Bitacora int identity (1, 1) PRIMARY KEY NOT NULL,
  IdEntityType INT NOT NULL,
  EntityId INT NOT NULL, 
  jsonAntes VARCHAR (500) NOT NULL,
  jsonDespues VARCHAR (500) NOT NULL,
  insertedAt DATETIME NOT NULL, 
  insertedby VARCHAR (20) NOT NULL, 
  insertedIn VARCHAR(20) NOT NULL,
  FOREIGN KEY (IdEntityType) REFERENCES TipoEntidad(ID_Entidad)
);

CREATE TABLE TipoTrans
(
	ID_Trans INT NOT NULL,
	Nombre VARCHAR(20) NOT NULL
);

CREATE TABLE TransConsumo
(
	ID_TCons INT Identity (1,1) PRIMARY KEY NOT NULL,
	LecturaM3 INT NOT NULL,
	Descripcion VARCHAR(150),
	ID_Finca INT NOT NULL,
	Tipo INT NOT NULL,
	FOREIGN KEY (ID_Finca) REFERENCES Propiedad(ID_Propiedad)
);

CREATE TABLE Recibos
(
	ID_Recibo INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	ID_Propiedad INT NOT NULL,
	ID_Concepto INT NOT NULL,
	Fecha Date NOT NULL DEFAULT GETDATE(),
	Monto INT NOT NULL,
	Estado INT NOT NULL DEFAULT 0,
	FOREIGN KEY (ID_Concepto) REFERENCES ConceptoCobro(ID_CC),
	FOREIGN KEY (ID_Propiedad) REFERENCES Propiedad(ID_Propiedad)
);

CREATE TABLE TipoEntidad
(
	ID_Entidad INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Nombre Varchar(50) NOT NULL
);

/*------------------------------------------------------------------------------*/
IF OBJECT_ID('AcumuladoUpdate') IS NOT NULL
BEGIN 
DROP PROC AcumuladoUpdate 
END
GO
CREATE PROCEDURE AcumuladoUpdate
	 @inNumPropiedad INT,
	 @inLectura int,
	 @monto int,
	 @ID_propiedad int
AS
IF((Select ID_Propiedad FROM Propiedad Where NumPropiedad = @inNumPropiedad) IS NOT NULL)
BEGIN
	SET @ID_propiedad = (Select ID_Propiedad FROM Propiedad Where NumPropiedad = @inNumPropiedad)
	SET @monto = (Select (M3AcumuladosUltimoRecibo + M3Acumulados) From Propiedad WHERE ID_Propiedad = @ID_propiedad)
	SET @monto = @monto*(Select Valor_m3 from CC_ConsumoAgua)
	BEGIN TRY
			UPDATE Propiedad
			SET  M3AcumuladosUltimoRecibo = M3Acumulados,
				 M3Acumulados = @inLectura
			WHERE  (NumPropiedad = @inNumPropiedad)
			End TRY
			BEGIN CATCH
				RAISERROR('Error en la actualizacion de datos fallida', 16, 1) WITH NOWAIT;
				PRINT error_message()
			END CATCH
			BEGIN TRY
				IF(@monto < (SELECT MontoMinimoRecibo From CC_ConsumoAgua))
				Begin
					SET @monto = (SELECT MontoMinimoRecibo From CC_ConsumoAgua)
				End
				INSERT INTO Recibos(
					ID_Propiedad,
					ID_Concepto,
					Monto
				)
				VALUES
				(
					@ID_propiedad,
					1,
					@monto
				)
			END TRY 
			BEGIN CATCH
				RAISERROR('Error en la actualizacion de datos fallida', 16, 1) WITH NOWAIT;
				PRINT error_message()
			END CATCH
END
ELSE
BEGIN
	PRINT ('La propiedad a buscar no se encuentra en la base de datos')
END
GO
