create database UNIFRANZITOS;
use UNIFRANZITOS;

CREATE TABLE CAMPEONATO(
id_campeonato varchar(12) primary key,
nombre_campeonato varchar(30) not null,
sede varchar(20) not null
);

select * from CAMPEONATO
drop table CAMPEONATO

Insert into CAMPEONATO (id_campeonato,nombre_campeonato,sede)
values ('camp-111','Campeonato Unifranz','El Alto');
Insert into CAMPEONATO (id_campeonato,nombre_campeonato,sede)
values ('camp-222','Campeonato Unifranz','Cochabamba');


CREATE TABLE EQUIPO(
id_equipo varchar(12) primary key,
nombre_equipo varchar(30) not null,
categoria varchar(8) not null,
id_campeonato varchar(12),
FOREIGN KEY (id_campeonato) REFERENCES CAMPEONATO (id_campeonato)
);

select * from EQUIPO
drop table EQUIPO

insert into EQUIPO (id_equipo,nombre_equipo,categoria,id_campeonato)
values ('equ-111','Google','VARONES','camp-111');
insert into EQUIPO (id_equipo,nombre_equipo,categoria,id_campeonato)
values ('equ-222','408 Not found','VARONES','camp-111');
insert into EQUIPO (id_equipo,nombre_equipo,categoria,id_campeonato)
values ('equ-333','girls unifranz','MUJERES','camp-111');



CREATE TABLE JUGADOR(
id_jugador varchar(12) primary key,
nombres varchar (30) not null,
apellidos varchar (50) not null,
ci varchar(15) not null,
edad  integer not null,
id_equipo varchar (12),
FOREIGN KEY (id_equipo) REFERENCES EQUIPO (id_equipo)
);

select * from JUGADOR
drop table JUGADOR

insert into JUGADOR(id_jugador,nombres,apellidos,ci,edad,id_equipo)
values ('jug-111','Carlos','Villa','8997811LP', 19,'equ-222');
insert into JUGADOR(id_jugador,nombres,apellidos,ci,edad,id_equipo)
values ('jug-222','Pedro','Salas','8997822LP', 20,'equ-222');
insert into JUGADOR(id_jugador,nombres,apellidos,ci,edad,id_equipo)
values ('jug-333','Saul','Araj','8997833LP', 21,'equ-222');
insert into JUGADOR(id_jugador,nombres,apellidos,ci,edad,id_equipo)
values ('jug-444','Sandra','Solis','8997844LP', 20,'equ-333');
insert into JUGADOR(id_jugador,nombres,apellidos,ci,edad,id_equipo)
values ('jug-555','Ana','Mica','8997855LP', 23,'equ-333');

--3. Manejo de consultas

--3.1. Mostrar que jugadores que son del equipo equ-222

Select * 
from JUGADOR 
where id_equipo='equ-222';

--3.2. Mostrar que jugadores(nombres, apellidos) que juegan en la sede de El Alto.

Select J.nombres,J.apellidos
from CAMPEONATO as C
	inner join EQUIPO as E on E.id_campeonato = C.id_campeonato 
	inner join JUGADOR as J on J.id_equipo = E.id_equipo 
where C.sede ='El Alto';

--3.3. Mostrar aquellos jugadores mayores o igual a 21 años que sean de la categoría VARONES.

select J.nombres,J.apellidos,J.edad,E.categoria
from EQUIPO as E
	inner join JUGADOR as J on J.id_equipo= E.id_equipo
where E.categoria = 'VARONES' and J.edad >= 21;


--3.4. Mostrar a todos los estudiantes en donde su apellido empiece con la letra S.
--3.4.1. Podría utilizar la instrucción LIKE
--3.4.1. Podría utilizar la instrucción LIKE

select *
from JUGADOR
where apellidos like 'S%';

--3.5. Mostrar que equipos forman parte del campeonato camp-111 y además sean de la categoría MUJERES.

Select E.nombre_equipo,J.nombres,J.apellidos
from CAMPEONATO as C
	inner join EQUIPO as E on E.id_campeonato = C.id_campeonato 
	inner join JUGADOR as J on J.id_equipo = E.id_equipo 
where C.id_campeonato ='camp-111'AND E.categoria = 'MUJERES';

--3.6. Mostrar el nombre del equipo del jugador con id_jugador igual a jug-333

select E.nombre_equipo,J.id_jugador
from EQUIPO as E
	inner join JUGADOR as J on J.id_equipo= E.id_equipo
where J.id_jugador = 'jug-333';

--3.7. Mostrar el nombre del campeonato del jugador con id_jugador igual a jug-333

Select C.nombre_campeonato,J.nombres,J.apellidos,J.id_jugador
from CAMPEONATO as C
	inner join EQUIPO as E on E.id_campeonato = C.id_campeonato 
	inner join JUGADOR as J on J.id_equipo = E.id_equipo 
where J.id_jugador = 'jug-333';

--3.9. ¿Qué estrategia utilizaría para determinar cuántos equipos inscritos hay?
--3.9.1. Podría utilizar la función de agregación COUNT

select count (nombre_equipo) AS Cantidad_de_Equipos
from EQUIPO;

--3.10. ¿Qué estrategia utilizaría para determinar cuántos jugadores 
--pertenecen a la categoría VARONES o Categoria MUJERES.
--3.10.1. Para esto puede utilizar la función de agregación COUNT

select count (nombres) AS Cantidad_de_Varones
from CAMPEONATO as C
	inner join EQUIPO as E on E.id_campeonato = C.id_campeonato 
	inner join JUGADOR as J on J.id_equipo = E.id_equipo 
where E.categoria = 'VARONES';

select count (nombres) AS Cantidad_de_Mujeres
from CAMPEONATO as C
	inner join EQUIPO as E on E.id_campeonato = C.id_campeonato 
	inner join JUGADOR as J on J.id_equipo = E.id_equipo 
where E.categoria = 'MUJERES';