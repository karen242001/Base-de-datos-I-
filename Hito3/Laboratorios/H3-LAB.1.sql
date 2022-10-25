CREATE DATABASE CLASE;
USE CLASE

CREATE TABLE LETRAS_A(
letra char NOT NULL
);

INSERT INTO LETRAS_A(letra)
VALUES('D');
INSERT INTO LETRAS_A(letra)
VALUES('E');
INSERT INTO LETRAS_A(letra)
VALUES('F');
INSERT INTO LETRAS_A(letra)
VALUES('H');
INSERT INTO LETRAS_A(letra)
VALUES('B');

DROP TABLE LETRAS_A;
DROP TABLE LETRAS_B;
SELECT * FROM LETRAS_A
SELECT * FROM LETRAS_B

CREATE TABLE LETRAS_B(
letra char NOT NULL  
);
INSERT INTO LETRAS_B(letra)
VALUES('A');
INSERT INTO LETRAS_B(letra)
VALUES('E');
INSERT INTO LETRAS_B(letra)
VALUES('T');
INSERT INTO LETRAS_B(letra)
VALUES('H');


SELECT let_a.letra, let_b.letra
FROM LETRAS_A AS let_a
	INNER JOIN LETRAS_B AS let_b ON let_b.letra=let_a.letra

CREATE TABLE   NUMEROS_A(
num char not null
);
INSERT INTO NUMEROS_A(num)
VALUES('1');
INSERT INTO NUMEROS_A(num)
VALUES('2');
INSERT INTO NUMEROS_A(num)
VALUES('3');
INSERT INTO NUMEROS_A(num)
VALUES('4');
INSERT INTO NUMEROS_A(num)
VALUES('5');
INSERT INTO NUMEROS_A(num)
VALUES('6');
INSERT INTO NUMEROS_A(num)
VALUES('7');

DROP TABLE NUMEROS_A;
DROP TABLE NUMEROS_B;
SELECT * FROM NUMEROS_A
SELECT * FROM NUMEROS_B

CREATE TABLE  NUMEROS_B(
num char not null
);

INSERT INTO NUMEROS_B(num)
VALUES('4');
INSERT INTO NUMEROS_B(num)
VALUES('5');
INSERT INTO NUMEROS_B(num)
VALUES('6');
INSERT INTO NUMEROS_B(num)
VALUES('7');
INSERT INTO NUMEROS_B(num)
VALUES('8');
INSERT INTO NUMEROS_B(num)
VALUES('9');

SELECT num_a.num, num_b.num
FROM NUMEROS_A AS num_a
	INNER JOIN NUMEROS_B AS num_b ON num_b.num=num_a.num
	WHERE num_b.num>5 AND num_a.num>5

SELECT num_a.num, num_b.num
FROM NUMEROS_A AS num_a
	INNER JOIN NUMEROS_B AS num_b ON num_b.num=num_a.num
	
-----------


create table notas_p1(
not_1 integer not null
);
insert into notas_p1 (not_1) values (51),(40),(60),(75),(30);

create table notas_p2(
not_2 integer not null
);
insert into notas_p2(not_2) values (60),(51),(100);

create table notas_p3(
not_3 integer not null
);
insert into notas_p3(not_3) values (20),(21),(23),(51),(60),(48);

--MOSTRAR >=51 
SELECT not1.not_1,not2.not_2,not3.not_3
FROM notas_p1 AS not1
	INNER JOIN notas_p2 AS not2 ON  not2.not_2=not1.not_1
	INNER JOIN notas_p3 AS not3 ON  not1.not_1=not3.not_3
WHERE not1.not_1 >= 51 AND not2.not_2 >=51 AND not3.not_3 >=51



SELECT not1.not_1,not2.not_2,not3.not_3
FROM notas_p1 AS not1
	INNER JOIN notas_p2 AS not2 ON  not2.not_2 = not1.not_1
	INNER JOIN notas_p3 AS not3 ON  not1.not_1 = not3.not_3
WHERE not1.not_1 < 51 AND not2.not_2 < 51 AND not3.not_3 < 51