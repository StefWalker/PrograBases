USE [ProyectoBases]
CREATE TYPE PagosTipo AS TABLE (id INT IDENTITY(1,1),numFinca INT,idTipoRecibo INT, fechaOperaciones VARCHAR(100)) 
CREATE TYPE ConsumoTipo AS TABLE (id INT IDENTITY(1,1),idTipo INT,numFinca INT,LecturaM3 INT, Fecha DATE,descripcion varchar(30)) 
CREATE TYPE ValorPropiedadTipo AS TABLE (id INT IDENTITY(1,1),numFinca INT,nuevoValor MONEY) 
CREATE TYPE RecibosTipo AS TABLE (id INT IDENTITY(1,1), idRecibo int) 
CREATE TYPE ArreglosTipo AS TABLE (ID INT IDENTITY(1,1), numFinca int, plazo int, fecha DATE)


DROP TYPE PagosTipo
DROP TYPE ConsumoTipo
DROP TYPE ValorPropiedadTipo
DROP TYPE RecibosTipo
DROP TYPE ArreglosTipo