CREATE DATABASE universidad2
USE universidad2;

DROP TABLE IF EXISTS escuela;
DROP TABLE IF EXISTS estudiantes;
DROP TABLE IF EXISTS materias;
DROP TABLE IF EXISTS kardex;
DROP TABLE IF EXISTS periodo;

CREATE TABLE materias(
 id_mat INTEGER IDENTITY PRIMARY KEY NOT NULL,
 nom_mat VARCHAR (100) NOT NULL,
 cod_mat VARCHAR (100) NOT NULL
);
INSERT INTO materias (nom_mat, cod_mat) 
VALUES ('Introduccion a la Arquitectura','ARQ-101');
INSERT INTO materias (nom_mat, cod_mat) 
VALUES ('Urbanismo y Diseno','ARQ-102');
INSERT INTO materias (nom_mat, cod_mat) 
VALUES ('Dibujo y Pintura Arquitectonico','ARQ-103');
INSERT INTO materias (nom_mat, cod_mat) 
VALUES ('Matematica discreta','ARQ-104');
INSERT INTO materias (nom_mat, cod_mat) 
VALUES ('Fisica Basica','ARQ-105');
SELECT * FROM materias;

CREATE TABLE escuela(
 id_esc INTEGER IDENTITY PRIMARY KEY NOT NULL,
 nombre VARCHAR (100) NOT NULL,
 direccion VARCHAR (100) NOT NULL
);

INSERT INTO escuela (nombre, direccion) 
VALUES ('San Felipe Asturias II', 'Zona Illampu Av. Prol. San Lorenzo');
SELECT * FROM escuela;

CREATE TABLE periodo(
 id_per INTEGER IDENTITY PRIMARY KEY NOT NULL,
 ano_gestion INTEGER NOT NULL,
 semestre VARCHAR (100) NOT NULL
);
INSERT INTO periodo (ano_gestion, semestre) 
VALUES (2016, 'Semestre 1');
INSERT INTO periodo (ano_gestion, semestre) 
VALUES (2016, 'Semestre 2');
INSERT INTO periodo (ano_gestion, semestre) 
VALUES (2017, 'Semestre 1');
INSERT INTO periodo (ano_gestion, semestre) 
VALUES (2017, 'Semestre 2');
INSERT INTO periodo (ano_gestion, semestre) 
VALUES (2018, 'Semestre 1');
SELECT * FROM periodo;

CREATE TABLE estudiantes(
 id_est INTEGER IDENTITY PRIMARY KEY NOT NULL,
 nombres VARCHAR (100) NOT NULL,
 apellidos VARCHAR (100) NOT NULL,
 sexo VARCHAR (10) NOT NULL,
 direccion VARCHAR (200) NOT NULL,
 telefono INTEGER NOT NULL,
 email VARCHAR (50) NOT NULL,
 edad INTEGER NOT NULL,
 ID_ESC INTEGER,
 FOREIGN KEY (ID_ESC) REFERENCES escuela (id_esc)
);

INSERT INTO estudiantes (nombres, apellidos, sexo, direccion, telefono, email, edad, ID_ESC) 
VALUES('Ximena', 'Arias Ballesteros', 'femenino', 'Av. 6 de Agosto', 79617575, 'xime@gmail.com', 25, 1);
INSERT INTO estudiantes (nombres, apellidos, sexo, direccion, telefono, email, edad, ID_ESC) 
VALUES('Saul', 'Montes Valenzuela', 'masculino', 'Av. 6 de Agosto', 79617576, 'saul@gmail.com', 24, 1);
INSERT INTO estudiantes (nombres, apellidos, sexo, direccion, telefono, email, edad, ID_ESC) 
VALUES('Carla', 'Mavir Uria', 'femenino', 'Av. 6 de Agosto', 79617577, 'carla@gmail.com', 28, 1);
INSERT INTO estudiantes (nombres, apellidos, sexo, direccion, telefono, email, edad, ID_ESC) 
VALUES('Joel', 'Castillo Fuentes', 'masculino', 'Av. 6 de Agosto', 79617578, 'joel@gmail.com', 21, 1);
INSERT INTO estudiantes (nombres, apellidos, sexo, direccion, telefono, email, edad, ID_ESC) 
VALUES('Augusto', 'Copar Copar', 'femenino', 'Av. 6 de Agosto', 79617579, 'augusto@gmail.com', 20, 1);

SELECT * FROM estudiantes;


DROP TABLE materias;
DROP TABLE escuela;
DROP TABLE periodo;
DROP TABLE estudiantes;
DROP TABLE kardex;

CREATE TABLE kardex(
 id_kar INTEGER IDENTITY PRIMARY KEY NOT NULL,
 nota_num INTEGER NOT NULL,
 nota_alfabe VARCHAR (100) NOT NULL,
 estado VARCHAR (10) NOT NULL,
 ID_MAT INTEGER,
 ID_EST INTEGER,
 ID_PER INTEGER,

 FOREIGN KEY (ID_MAT) REFERENCES materias(id_mat),
 FOREIGN KEY (ID_EST ) REFERENCES estudiantes(id_est),
 FOREIGN KEY (ID_PER) REFERENCES periodo(id_per)
);

insert into kardex(nota_num,nota_alfabe,estado,ID_MAT,ID_EST,ID_PER)
	values('51','cincuenta y uno','aprobado',1,1,1); 
insert into kardex(nota_num,nota_alfabe,estado,ID_MAT,ID_EST,ID_PER)
	values('31','treinta y uno','reprobado',2,2,2);
insert into kardex(nota_num,nota_alfabe,estado,ID_MAT,ID_EST,ID_PER)
	values('61','sesenta y uno','aprobado',3,3,3);  
insert into kardex(nota_num,nota_alfabe,estado,ID_MAT,ID_EST,ID_PER)
	values('41 ','cuarenta y uno','reprobado',4,4,4);
insert into kardex(nota_num,nota_alfabe,estado,ID_MAT,ID_EST,ID_PER)
	values('81','ochenta y uno','aprobado',5,4,5);

SELECT * FROM kardex;
SELECT * FROM estudiantes;

select nombres,apellidos 
from estudiantes
where edad>=24 and sexo = 'femenino' or edad>=24 and sexo = 'masculino'; 

select nombres,apellidos 
from estudiantes
where edad>=24 and sexo = 'femenino';

select nombres,apellidos 
from estudiantes
where edad>=24 and sexo = 'masculino';

SELECT est.nombres,est.apellidos,kar.nota_num
FROM estudiantes AS est
	INNER JOIN kardex AS kar ON kar.id_est=est.id_est
WHERE kar.nota_num>=51


SELECT est.nombres,est.apellidos,kar.nota_num,est.edad
FROM estudiantes AS est
	INNER JOIN kardex AS kar ON kar.id_est=est.id_est
WHERE kar.nota_num<51 and sexo = 'masculino'



--03/10/2022
--QUE ESTUDIANTES (NOM.APE.DIRECCION) FORMAN PARTE DE LA ESCUELA SAN FELIPE

SELECT est.nombres,est.apellidos,est.direccion
FROM estudiantes AS est
	INNER JOIN escuela AS esc ON esc.id_esc =est.ID_ESC
WHERE esc.nombre='San Felipe Asturias II';

--OTRA MANERA

SELECT est.nombres,est.apellidos,esc.direccion
FROM escuela AS esc
	INNER JOIN estudiantes AS est ON esc.id_esc =est.ID_ESC
WHERE esc.nombre='San Felipe Asturias II';

--QUE ESTUDIANTES (NOM.APE.EDAD/MAYOR 22.GENERO/FEMENINOyMASCULINO.DIRECCION) FORMAN PARTE DE LA ESCUELA SAN FELIPE

SELECT est.nombres,est.apellidos,est.edad,est.sexo,est.direccion
FROM estudiantes AS est
	INNER JOIN escuela AS esc ON esc.id_esc =est.ID_ESC
WHERE est.edad > 22 
	AND est.sexo ='FEMENINO' 
	AND esc.nombre='San Felipe Asturias II';

--MOSTRAR NOM Y APE DE TODOS LOS ESTUDIANTES APROBADOS EN LA MATERIA DE FISICA BASICA

SELECT est.nombres,est.apellidos
FROM kardex AS kar
	INNER JOIN estudiantes AS est ON kar.ID_EST = est.id_est
	INNER JOIN materias AS mat ON kar.ID_MAT = mat.id_mat
WHERE kar.nota_num >51 AND mat.nom_mat='Fisica Basica';


--mostrar los nom y ape, mayores a 25 

SELECT est.nombres,est.apellidos,est.edad
FROM estudiantes AS est
	INNER JOIN escuela AS esc ON esc.id_esc =est.ID_ESC
WHERE est.edad > 25;

-- mostrar el semestre y año del estudiante con celula sea igual a 6775688

SELECT per.semestre,per.ano_gestion
FROM kardex AS kar
	INNER JOIN periodo AS per ON kar.ID_PER = per.id_per 
WHERE kar.ID_EST = '6775688';




--10/10/2022

DROP TABLE nombres_dba_i;
DROP TABLE nombres_dba_ii;

CREATE TABLE nombres_dba_i(
nombres varchar (100) not null,
sis_est varchar (100)  PRIMARY KEY
);

insert into nombres_dba_i (nombres, sis_est)
values ('William', 'SIS_123');
insert into nombres_dba_i (nombres, sis_est)
values ('Victor','SIS_120');
insert into nombres_dba_i (nombres, sis_est)
values ('Mijail','SIS_100');
insert into nombres_dba_i (nombres, sis_est)
values ('Brayan','SIS_101');
insert into nombres_dba_i (nombres, sis_est)
values ('Karen','SIS_111');
insert into nombres_dba_i (nombres, sis_est)
values ('Ariel','SIS_110');


CREATE TABLE nombres_dba_ii(
nombres varchar (100) not null,
sis_est varchar (100)  PRIMARY KEY
);

insert into nombres_dba_ii (nombres, sis_est)
values ('Victor','SIS_120');
insert into nombres_dba_ii (nombres, sis_est)
values ('Brayan','SIS_101');
insert into nombres_dba_ii (nombres, sis_est)
values ('Samuel','SIS_103');
insert into nombres_dba_ii(nombres, sis_est)
values ('Ana','SIS_131');

SELECT dba1.nombres,dba1.sis_est,dba2.nombres,dba2.sis_est
FROM nombres_dba_i AS dba1
	INNER JOIN nombres_dba_ii AS dba2 ON dba2.sis_est=dba1.sis_est;   