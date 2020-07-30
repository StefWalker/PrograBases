USE [ProyectoBases]
CREATE TYPE PagosTipo AS TABLE (id INT IDENTITY(1,1),numFinca VARCHAR(30),idTipoRecibo INT, fechaOperaciones VARCHAR(100)) 
CREATE TYPE ConsumoTipo AS TABLE (id INT IDENTITY(1,1),idTipo INT,numFinca VARCHAR(30),LecturaM3 INT, Fecha DATE,descripcion varchar(30)) 
CREATE TYPE ValorPropiedadTipo AS TABLE (id INT IDENTITY(1,1),numFinca VARCHAR(30),nuevoValor MONEY) 




CREATE TYPE PropiedadDelUsuarioTipo AS TABLE (id INT IDENTITY(1,1),idUsuario INT,idPropiedad INT,Fecha DATE) 

CREATE TYPE PropiedadDelPropietarioTipo AS TABLE (id INT IDENTITY(1,1),idPropietario INT,idPropiedad INT,Fecha DATE) 

CREATE TYPE UsuarioTipo AS TABLE (id INT IDENTITY(1,1),nombre varchar(100),contrasenna varchar(30),tipoDeUsuario varchar(30),Fecha DATE) 
CREATE TYPE PropietarioTipo AS TABLE (id INT IDENTITY(1,1),nombre varchar(100),valorDocId INT,identificacion varchar(30),Fecha DATE) 


DROP TYPE PagosTipo
DROP TYPE ConsumoTipo
DROP TYPE ValorPropiedadTipo