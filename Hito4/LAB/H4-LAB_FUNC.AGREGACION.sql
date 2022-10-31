create database hito4_funciones;
use hito4_funciones;


--MANEJO DE FUNCIONES
--funcion de agregacion esta ubicada en la clausula SELECT
--te devuelve solo una fila 


create table estudiante(
id_est integer identity primary key not null,
nombres varchar (25) not null,
apellidos varchar (30) not null,
edad integer not null,
fono integer not null,
email varchar (100) not null,
direccion varchar (200) not null,
genero varchar (50) not null,
id_escuela integer not null,
licencia_conducir bit not null,
foreign key (id_escuela) references escuela(id_esc)
);

INSERT INTO estudiante (nombres, apellidos, edad, fono, email, direccion, genero,id_escuela,licencia_conducir) values
('Miguel','Gonzales Veliz', 20, 2832115, 'miguel@gmail.com', 'Av. 6 de Agosto', 'masculino',1,0),
('Sandra','Mavir Uria', 25, 2832116, 'sandra@gmail.com', 'Av. 6 de Agosto', 'femenino',2,0),
('Joel','Adubiri Mondar', 30, 2832117, 'joel@gmail.com', 'Av. 6 de Agosto', 'masculino',2,0),
('Andrea','Arias Ballesteros', 21, 2832118, 'andrea@gmail.com', 'Av. 6 de Agosto', 'femenino',3,0),
('Santos','Montes Valenzuela', 24, 2832119, 'santos@gmail.com', 'Av. 6 de Agosto', 'masculino',3,0);

drop table estudiante;

select * from estudiante;

truncate table estudiante;

--det. cuantos estudiantes registrados tienen.

select count(*) as numero_de_estudiante
from estudiante;

select count(est.id_est)
from estudiante AS est;

--det: la minima edad de los est.
select min(edad)
from estudiante;

--det.cantidad 
select count (*)
from estudiante
where genero = 'femenino';


--para agregar a la tabla est.

alter table estudiante add licencia_conducir bit;

INSERT INTO estudiante (nombres, apellidos, edad, fono, email, direccion, genero,licencia_conducir,id_escuela) 
values('Ana','Gonzales Veliz', 20, 2832115, 'ana@gmail.com', 'Av. 6 de Agosto', 'femenino',1,2),
('Pepito','Gonzales Veliz', 20, 2832115, 'pep@gmail.com', 'Av. 6 de Agosto', 'masculino',0,1);

--det. cant. de est.

select count (est.licencia_conducir)
from estudiante as est


select count (est.id_est)
from estudiante as est

--det. promedio de las edades

select avg (est.edad)
from estudiante as est


-- obtener la mayor edad de f y m.
select max(edad)
from estudiante
where genero = 'femenino' or genero = 'masculino';

select max(edad)
from estudiante
where genero = 'masculino';


--det. cantidad de est. que inicien con M en el apellido

select count (est.apellidos)
from estudiante as est
where est.apellidos like '%el%' and est.genero ='masculino'

select count (est.id_est)
from estudiante as est
where est.apellidos like '%el%' and est.genero ='masculino'


--det. cuantos est. tienen una edad mayor a 20 y menor a 30, que tengan licencia de conducir 

select count(est.licencia_conducir)
from estudiante as est
where est.edad > 20 and est.edad < 30 and est.licencia_conducir = 1

select * from estudiante;

select count(est.id_est)
from estudiante as est
where est.edad between 21 and 29 and est.licencia_conducir = 1


--agregar

create table escuela(
id_esc integer identity primary key not null,
nombre varchar(100) not null,
direccion varchar(100) not null,
turno varchar(100) not null,

);

INSERT INTO escuela (nombre,direccion,turno) values
('Escuela1','av.6 de marzo','mañana'),
('Escuela2','av.6 de marzo','tarde'),
('Escuela3','av.6 de marzo','noche');

drop table escuela;

select * from escuela;
select * from estudiante;
