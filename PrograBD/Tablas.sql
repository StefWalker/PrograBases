
USE [ProyectoBases]

CREATE TABLE Propiedad
(
  ID_Propiedad INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  NumPropiedad INT NOT NULL,
  Valor MONEY NOT NULL,
  Direccion VARCHAR(250) NOT NULL,
  Activo BIT NOT NULL
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
  Identificacion INT NOT NULL,
  Nombre VARCHAR(100) NOT NULL,
  Activo BIT NOT NULL,
  ID_TDoc INT NOT NULL,
  FOREIGN KEY (ID_TDoc) REFERENCES TipoDoc(ID_TDoc)
);

CREATE TABLE Usuario
(
  ID_Usuario INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Nombre VARCHAR(100) NOT NULL,
  Password VARCHAR(100) NOT NULL,
  TipoUsuario VARCHAR(100) NOT NULL,
  Activo BIT NOT NULL
);

CREATE TABLE PropJuridico
(
  ID_Juridico INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  ID_Propietario INT REFERENCES Propietario(ID_Propietario) NOT NULL,
  Documento INT NOT NULL,
  ID_TDoc INT NOT NULL,
  Activo BIT NOT NULL,
  FOREIGN KEY (ID_TDoc) REFERENCES TipoDoc(ID_TDoc)
);

CREATE TABLE ConceptoCobro
(
  ID_CC INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  TipoCC VARCHAR(50) NOT NULL,
  Concepto VARCHAR(100) NOT NULL,
  FechaVencimiento INT NOT NULL,
  Fecha INT NOT NULL,
  Activo BIT NOT NULL
);

CREATE TABLE CC_Fijo
(
  ID_Fijo INT PRIMARY KEY REFERENCES ConceptoCobro(ID_CC) NOT NULL,
  Monto MONEY NOT NULL
);

CREATE TABLE CC_ConsumoAgua
(
  ID_Con INT PRIMARY KEY REFERENCES ConceptoCobro(ID_CC) NOT NULL,
  Valor_m3 MONEY NOT NULL
);

CREATE TABLE CC_Porcentual
(
  ID_Por INT PRIMARY KEY REFERENCES ConceptoCobro(ID_CC) NOT NULL,
  Porcentaje MONEY NOT NULL
);

CREATE TABLE Intereses_Monetarios
(
  ID_IM INT PRIMARY KEY REFERENCES ConceptoCobro(ID_CC) NOT NULL,
  Monto MONEY NOT NULL
);

CREATE TABLE Pro_x_Pro
(
  ID_PxP INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  ID_Propiedad INT NOT NULL,
  ID_Propietario INT NOT NULL,
  Activo BIT NOT NULL,
  FOREIGN KEY (ID_Propiedad) REFERENCES Propiedad(ID_Propiedad),
  FOREIGN KEY (ID_Propietario) REFERENCES Propietario(ID_Propietario)
);

CREATE TABLE Pro_x_Usuario
(
  ID_PxU INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  ID_Propiedad INT NOT NULL,
  ID_Usuario INT NOT NULL,
  Activo BIT NOT NULL,
  FOREIGN KEY (ID_Propiedad) REFERENCES Propiedad(ID_Propiedad),
  FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)
);

CREATE TABLE Pro_x_CC
(
  ID_PxC INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  ID_CC INT NOT NULL,
  ID_Propiedad INT NOT NULL,
  Activo BIT NOT NULL,
  FOREIGN KEY (ID_CC) REFERENCES ConceptoCobro(ID_CC),
  FOREIGN KEY (ID_Propiedad) REFERENCES Propiedad(ID_Propiedad)
);

CREATE TABLE PJur_x_Pro
(
  ID_JxP INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  ID_Juridico INT NOT NULL,
  ID_Propiedad INT NOT NULL,
  Activo BIT NOT NULL,
  FOREIGN KEY (ID_Juridico) REFERENCES PropJuridico(ID_Juridico),
  FOREIGN KEY (ID_Propiedad) REFERENCES Propiedad(ID_Propiedad)
);

/*
CREATE TABLE PropFisico
(
  ID_Fisico INT IDENTITY(1,1),
  ID_Propietario INT NOT NULL,
  PRIMARY KEY (ID_Fisico),
  FOREIGN KEY (ID_Propietario) REFERENCES Propietario(ID_Propietario)
);

CREATE TABLE ServicioPendiente
(
  ID_ServicioPend INT NOT NULL,
  Fec INT NOT NULL,
  PRIMARY KEY (ID_ServicioPend)
);

CREATE TABLE Recibo
(
  ID_Recibo INT NOT NULL,
  Fecha DATE NOT NULL,
  FechaVencimiento DATE NOT NULL,
  Monto INT NOT NULL,
  Pendiente  NOT NULL,
  PRIMARY KEY (ID_Recibo)
);

CREATE TABLE Comprobante_Pago
(
  ID INT NOT NULL,
  Fecha DATE NOT NULL,
  Total INT NOT NULL,
  PRIMARY KEY (ID)
);
*/