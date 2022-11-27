create database H4_LAB2;
use H4_LAB2;

create table escuela(
id_esc integer identity primary key not null,
nombre varchar(100) not null,
direccion varchar(100) not null,
turno varchar(100) not null,
);

INSERT INTO escuela (nombre,direccion,turno)
values
('Sna Simon','Cochabamba','mañana'),
('Andres Bello','El Alto','mañana-tarde'),
('Amor de Dios fe y alegria','El Alto','mañana-tarde'),
('Don Bosco','La Paz','mañana-tarde-noche');


select * 
from escuela;

create table estudiante(
id_est integer identity primary key not null,
nombres varchar (25) not null,
apellidos varchar (30) not null,
edad integer not null,
fono integer not null,
email varchar (100) not null,
direccion varchar (200) not null,
genero varchar (50) not null,
id_esc integer not null,
licencia_conducir bit not null,
foreign key (id_esc) 
references escuela(id_esc)
);

INSERT INTO estudiante (nombres, apellidos, edad, fono, email, direccion, genero,id_esc,licencia_conducir) 
values
('Miguel','Gonzales Veliz', 20, 2832115, 'miguel@gmail.com', 'Av. 6 de Agosto', 'masculino',1,0),
('Sandra','Mavir Uria', 25, 2832116, 'sandra@gmail.com', 'Av. 6 de Agosto', 'femenino',2,0),
('Joel','Adubiri Mondar', 30, 2832117, 'joel@gmail.com', 'Av. 6 de Agosto', 'masculino',3,0),
('Andrea','Arias Ballesteros', 21, 2832118, 'andrea@gmail.com', 'Av. 6 de Agosto', 'femenino',4,0),
('Santos','Montes Valenzuela', 24, 2832119, 'santos@gmail.com', 'Av. 6 de Agosto', 'masculino',1,0),
('Ana','Gonzales Veliz', 20, 2832115, 'ana@gmail.com', 'Av. 6 de Agosto', 'femenino',2,1),
('Pepito','Gonzales Veliz', 20, 2832115, 'pep@gmail.com', 'Av. 6 de Agosto', 'masculino',3,0);

DROP TABLE estudiante;
truncate table estudiante;
truncate table escuela;

select * 
from estudiante;
select * 
from escuela;

--Det.cuantos est.

select count(id_est) AS COUNT 
from estudiante 
where licencia_conducir = 1

select avg(est.id_est) AS AVG
from estudiante as est

select max(est.id_est) AS MAX
from estudiante as est

select min(est.id_est) AS MIN
from estudiante as est

--det.estudiantes menores a 20 que no tengan licencia
select count(id_est)
from estudiante 
where licencia_conducir = 0 and edad < 20

--det.cuantos est de la escuela -Amor de Dios fe y alegria-
select count(E.id_est)
from estudiante as E
	inner join escuela as esc on esc.id_esc = E.id_esc
where esc.nombre ='Amor de Dios fe y alegria'

--det.cuantos est. froman parte de las escuelas que tengan m-t

select count(E.id_est)
from estudiante as E
	inner join escuela as esc on esc.id_esc = E.id_esc
where esc.turno ='mañana-tarde'

--det.cuantos est. mayores a 25 años estan en esc solo en turno tarde
select count(E.id_est)
from estudiante as E
	inner join escuela as esc on esc.id_esc = E.id_esc
where esc.turno like ('%tarde%') and E.edad > 25




----CREAR FUNCIONES 

CREATE FUNCTION retorna_nombre_materia()
	RETURNS varchar (20) as 
	BEGIN 
		RETURN 'Base de Datos I'
	END;
	
	SELECT dbo.retorna_nombre_materia();

ALTER FUNCTION retorna_nombre_materia_v2()    --para modificar algo en la funcion se necesita ALTER
	RETURNS varchar (25) as 
	BEGIN 
		DECLARE @nombre VARCHAR (25); --@ nos permite crear variables
		SET @nombre ='Base de Datos II';
		RETURN @nombre;
	END;

	SELECT dbo.retorna_nombre_materia_v2();

CREATE FUNCTION retorna_nombre_materia_v3(@nombreMateria VARCHAR(25))
	RETURNS varchar (25) as 
	BEGIN 
		DECLARE @nombre VARCHAR (25); 
		SET @nombre = @nombreMateria; --recibe parametros
		RETURN @nombre;
	END;

	SELECT dbo.retorna_nombre_materia_v3('DBA I');

--crear una funcion que no reciba parametros la funcion debe sumar dos numeros cualquiera

CREATE FUNCTION suma_de_dos_numeros()
	RETURNS integer as 
	BEGIN 
		DECLARE @r integer; 
		SET @r = 10+5; 
		RETURN @r;
	END;

	SELECT dbo.suma_de_dos_numeros();

--crear uma fun. qu recibe 3 parametros enteros y debe sumar 

CREATE FUNCTION sumaV1(@a integer,@b integer,@c integer)
	RETURNS integer as 
	BEGIN 
		DECLARE @r integer; 
		SET @r = @a+@b+@c; 
		RETURN @r;
	END;
SELECT dbo.sumaV1(5,6,7);


-------14 DE NOVIEMBRE


--DETERMINAR CUANTOS SON MAYORES A 25 AÑOS

select count(edad)
from estudiante 
where edad > 25

--CREAR UNA FUNCION QUE PERMITA SABER LA CANTIDAD DE EST. MAYORES A CIERTA EDAD

CREATE FUNCTION mayores_a_cierta_edad(@edad integer)
	returns integer as

	begin
		DECLARE @response integer = 0;

		select  @response = count(est.edad)
		from estudiante as est
		where est.edad > @edad;
		return @response;
	end;

SELECT dbo.mayores_a_cierta_edad(25);

--CREAR UNA FUNCION QUE PERMITA SABER LA CANTIDAD DE EST. MAYORES A CIERTA EDAD DEL GENERO FEMENINO Y 
--SEA PARTE DEL COLEGIO ANDRES BELLO. EDAD 20

CREATE FUNCTION mayores_femenino(@edad integer,@genero varchar(50))
	returns integer as

	begin
		DECLARE @response integer = 0;

		select @response = count(est.id_est)
		from estudiante as est
			inner join escuela as esc on esc.id_esc = est.id_esc
		where esc.nombre = 'Andres Bello' and 
			est.edad > @edad and 
			est.genero=@genero

		return @response;
	end;

SELECT dbo.mayores_femenino(20,'femenino');

select * from escuela
select * from estudiante 

--mostrar el ultimo registro 
select est.*
from estudiante as est
where est.id_est=7 

select max(est.id_est)
from estudiante as est
--where est.id_est = maximo_primary_key()

CREATE FUNCTION maximo()
	returns integer as

	begin
		DECLARE @response integer = 0;

		select  @response = max(est.id_est)
	    from estudiante as est

		return @response;
	end;

SELECT dbo.maximo();

----- Nos muestra el registro maximo de la funcion anterior

select est.*
from estudiante as est
where est.id_est = dbo.maximo()


create database H4_LAB3;
USE H4_LAB3;

create function operaciones2(@num1 integer, @num2 integer, @action varchar(20))
	returns integer as
	begin

		if (@action='suma')
			return @num1 + @num2;

		if (@action='resta')
			return @num1 - @num2;

		if (@action='multiplicacion')
			return @num1 * @num2;

		if (@action='division')
			return @num1 / @num2;

	return 1;
	end;
	select dbo.operaciones2(15,5,'suma') as suma;