CREATE DATABASE universidad2
USE universidad2

DROP TABLE IF EXISTS incripcion;
DROP TABLE IF EXISTS estudiantes;
DROP TABLE IF EXISTS materias;

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

 FOREIGN KEY (ID_MAT) REFERENCES materias (id_mat ),
 FOREIGN KEY (ID_EST ) REFERENCES estudiantes (id_est ),
 FOREIGN KEY (ID_PER) REFERENCES periodo (id_per )
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


--QUE ESTUDIANTES (NOM.APE.DIRECCION) FORMAN PARTE DE LA ESCUELA SAN FELIPE

SELECT est.nombres,est.apellidos,est.direccion
FROM estudiantes AS est
	INNER JOIN escuela AS esc ON esc.id_esc =est.ID_ESC
WHERE esc.nombre= 'San Felipe Asturias II';