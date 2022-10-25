CREATE DATABASE defensa_hito3_unifranzitos;
USE defensa_hito3_unifranzitos;


create table campeonato(
id_campeonato varchar(50) PRIMARY KEY not null,
nombre_campeonato varchar(50) not null,
sede varchar(50) not null,
);
select * from campeonato

insert into campeonato (id_campeonato,nombre_campeonato,sede)
values ('camp-111','Campeonato Unifranz','El Alto');
insert into campeonato (id_campeonato,nombre_campeonato,sede)
values ('camp-222','Campeonato Unifranz','Cochabamba');

create table equipo(
id_equipo varchar(50) PRIMARY KEY not null,
nombre_equipo varchar(50) not null,
categoria varchar(50) not null,
id_camp varchar(50) not null,

nombre_equipo varchar(50) not null,

FOREIGN KEY (id_camp) REFERENCES campeonato(id_campeonato),
FOREIGN KEY (nombre_equipo ) REFERENCES premios(posicion)
);

drop table equipo 
insert into equipo (id_equipo,nombre_equipo,categoria,id_camp)
values ('equ-111','Google','VARONES','camp-111');
insert into equipo (id_equipo,nombre_equipo,categoria,id_camp)
values ('equ-222','408 Not found','VARONES','camp-111');
insert into equipo (id_equipo,nombre_equipo,categoria,id_camp)
values ('equ-333','girls unifranz','MUJERES','camp-111');

select * from equipo

create table jugador(
id_jugador varchar(50) PRIMARY KEY not null,
nombres varchar(50) not null,
apellidos varchar(50) not null,
ci varchar(50) not null,
edad integer not null,
id_equ varchar(50) not null,
FOREIGN  KEY (id_equ) REFERENCES equipo (id_equipo)		
);


insert into jugador(id_jugador,nombres,apellidos,ci,edad,id_equ )
values ('jug-111','Carlos','Villa','8997811LP', 19,'equ-222');
insert into jugador(id_jugador,nombres,apellidos,ci,edad,id_equ )
values ('jug-222','Pedro','Salas','8997822LP', 20,'equ-222');
insert into jugador(id_jugador,nombres,apellidos,ci,edad,id_equ )
values ('jug-333','Saul','Araj','8997833LP', 21,'equ-222');
insert into jugador(id_jugador,nombres,apellidos,ci,edad,id_equ )
values ('jug-444','Sandra','Solis','8997844LP', 20,'equ-333');
insert into jugador(id_jugador,nombres,apellidos,ci,edad,id_equ )
values ('jug-555','Ana','Mica','8997855LP', 23,'equ-333');

select * from jugador

--1
select *
from jugador
where nombres like 'S%' AND apellidos like '%S' ;

--2

select jug.nombres, jug.apellidos, jug.edad
from jugador as jug
	inner join equipo as eq on jug.id_equ = eq.id_equipo
where jug.edad <=20 and nombre_equipo='408 Not found';

--3

select j.nombres, j.apellidos, j.edad, e.id_equipo,e.nombre_equipo
from campeonato as c
	inner join equipo as e on e.id_camp= c.id_campeonato 
	inner join jugador as j on j.id_equ=e.id_equipo
where j.edad >20 and id_equ='equ-333' and c.sede='El Alto';
 

--4


select count (*)
from jugador 
where jugador = 'equ-222'




--5

create table premios(
posicion varchar (50) primary key not null,
id_equipo varchar (50) not null,

foreign key (id_equipo) references equipo(id_equipo)
);
drop table premios 

insert into premios (posicion,id_equipo)
values ('Primer lugar', 'equ-222');
insert into premios (posicion,id_equipo)
values ('Segundo lugar', 'equ-333');

select * from premios 

--3
select j.nombres, j.apellidos
from premios as p
	inner join equipo as e on e.id_equipo = p.id_equipo
	inner join jugador as j on j.id_equ = e.id_equipo
where e.categoria ='VARONES' and p.posicion ='Primer lugar' 