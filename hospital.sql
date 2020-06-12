create database hospitalsystem;
USE hospitalsystem;

--Table Doctor
CREATE TABLE Doctor (
doctor_id int primary key identity ,
fname varchar(50),
age tinyint,
gender varchar(50),
phone DECIMAL(38,0),
Specialization varchar(200)
);



--End Table
--Start Table Room
CREATE TABLE Room(
room_id int Primary key identity,
number DECIMAL,
[location] varchar(50),
department varchar(50)
);

--End Table


--Start patient Table
CREATE TABLE patient(
patient_id int primary key identity,
fname varchar(50),
age tinyint,
gender varchar(50),
phone DECIMAL(38,0),
Disease varchar(200),
doctor_id int,
room_id int,
 FOREIGN KEY (doctor_id)  REFERENCES Doctor(doctor_id),
 FOREIGN KEY(room_id) REFERENCES Room(room_id));

--End Table


--Start table team

CREATE TABLE team (
team_id int Primary key identity,
fname varchar(50),
adr varchar(50),
department varchar(50),
doctor_id int,
FOREIGN KEY (doctor_id)  REFERENCES Doctor(doctor_id)
);



--End  Table


-- insert into doctor
insert into Doctor (fname,age,gender,phone,Specialization) values('amira',25,'female',5327282,'Cardiology' );
insert into Doctor (fname,age,gender,phone,Specialization) values ('mohammed',46,'male',5532282,'Hematology' );
insert into Doctor (fname,age,gender,Phone,Specialization) values ('Reem',39,'female',5788882 ,'Endocrinology');
insert into Doctor (fname,age,gender,phone,Specialization) values('Yara',52,'female',73635358,'Internal Medicine' );
insert into Doctor (fname,age,gender,phone,Specialization) values('yasser',45,'male',65783948,'Nephrology' );
insert into Doctor (fname,age,gender,phone,Specialization) values('taha',30,'male',65785948,'Hematology' );
insert into Doctor (fname,age,gender,phone,Specialization) values('taha',30,null,65785948,'Hematology' );

-- insert into room
insert into Room (number,[location],department) values (1,'2d','a' );
insert into Room (number,[location],department) values (1,'2d','b' );
insert into Room (number,[location],department) values (3,'2d','a' );
insert into Room (number,[location],department) values (9,'2d','b' );
insert into Room (number,[location],department) values (5,'3d','a' );
insert into Room (number,[location],department) values (6,'2d','c' );
insert into Room (number,[location],department) values (5,'2d','a' );
insert into Room (number,[location],department) values (8,null,null );
-- insert into patient
insert into patient (fname,age,gender,phone,Disease ) values('Nour',20,'female',5327282,'asthma' );
insert into patient (fname,age,gender,phone,Disease ) values('yasser',64,'male',5327282,'asthma' );
insert into patient (fname,age,gender,phone,Disease ) values('youseif',20,'male',028327282,'appendicitis' );
insert into patient (fname,age,gender,phone ,Disease) values('amr',20,'male',79989282,'asthma' );
insert into patient (fname,age,gender,phone ,Disease) values('alaa',25,'female',9383849,'bleeding' );
insert into patient (fname,age,gender,phone ,Disease) values('ahmed',30,'male',88459893,'appendicitis' );
insert into patient (fname,age,gender,phone ,Disease) values('taha',3,'male',88493893,'cancer' );
insert into patient (fname,age,gender,phone ,Disease) values('taha',23,'male',88493893,'cancer' );
insert into patient (fname,age,gender,phone ,Disease) values('tahani',null,null,null,null );
-- insert into team
insert into team (fname,adr,department) values (' Dr amiras staff','2A','Cardiology');
insert into team (fname,adr,department) values (' Dr Reems staff','3A','Hematology' );
insert into team (fname,adr,department) values (' Dr yaras staff','4A','Endocrinology');
insert into team (fname,adr,department) values (' Dr mohammeds staff','5A','Internal Medicine');
insert into team (fname,adr,department) values (' Dr yasser staff','6A','Nephrology' );
insert into team (fname,adr,department) values (null,'9A',null);

--


SELECT  *FROM Room 
   WHERE room_id IN (SELECT patient_id 
         FROM patient 
         WHERE age < 45) ;
--




--

--End  Table
Select* FROM team



--Quries:
SELECT * FROM patient;
SELECT * FROM Doctor;
SELECT * FROM room;
SELECT * FROM team;
SELECT age FROM patient;
SELECT DISTINCT gender
FROM Doctor
SELECT [location], department
FROM Room
ORDER BY number;
SELECT number
FROM Room
WHERE number <9
ORDER BY number
SELECT DISTINCT department
FROM Room
SELECT  age*3 
FROM  patient
WHERE age > 12
ORDER BY phone;
SELECT DISTINCT gender
FROM Doctor
SELECT MIN(age)
FROM Doctor ;
SELECT MAX(age)
FROM Doctor ;
SELECT  AVG(age) 
FROM Doctor ;
SELECT MIN(age) AS minage, MAX(age)AS maxage , AVG(age) AS avgage
FROM patient ;
SELECT number, [location] , adr
FROM Room,team ;
SELECT * FROM patient
WHERE fname='Nour' OR fname = 'amr' ;
SELECT * FROM Doctor
WHERE fname ='amira' AND Specialization = 'Cardiology' ;
SELECT * FROM Doctor
WHERE not fname = 'reem';
SELECT  COUNT(fname)
FROM team;
SELECT age FROM patient    
UNION                               
SELECT age FROM Doctor;
SELECT SUM(age)
FROM Doctor;

SELECT * 
FROM Doctor
WHERE phone NOT IN(
  SELECT phone
  FROM patient
   );



--









--SubQuery
SELECT fname,age,gender,phone,Disease,doctor_id,
  ( SELECT count(*) 
    FROM Room
    WHERE patient.patient_id = Room.room_id
  ) AS NumberOrders
FROM patient;

--


SELECT * FROM Room 
   WHERE room_id IN (SELECT patient_id 
         FROM patient 
         WHERE age > 45) ;
--



SELECT fname, age FROM patient                 
WHERE age < (SELECT AVG(age) FROM Doctor)



--select Statements using Count and Group Functions:
SELECT Disease, COUNT(patient_id) AS total
FROM patient
GROUP BY Disease
SELECT number, COUNT(*) 
FROM Room 
GROUP BY number 
ORDER BY 2 DESC;
SELECT age, COUNT(*) FROM Doctor 
GROUP BY age;

SELECT phone, COUNT(*) FROM patient 
GROUP BY phone;

SELECT department , COUNT(*) 
FROM Room
GROUP BY department 


SELECT age  , count(*) FROM patient
GROUP BY age;
----------
--join
SELECT Room.room_id , patient.patient_id
FROM Room
INNER JOIN patient ON Room.room_id = patient.patient_id  where patient.age between  2  and 60



SELECT Doctor.doctor_id , patient.patient_id
FROM Doctor
LEFT JOIN patient ON Doctor.doctor_id = patient.patient_id  

SELECT
	number,
	adr
FROM
	team
FULL OUTER JOIN Room ON Room.room_id = team.team_id


SELECT Specialization
FROM Doctor
RIGHT JOIN patient
ON Doctor.gender = patient.gender;
SELECT number
FROM patient,Room 
WHERE Room.room_id=patient.patient_id;
-------------------------------------
--UPDATE
UPDATE patient
SET gender='male'
WHERE fname='Nour';



UPDATE Doctor
SET age = 49
WHERE fname='Yara';


UPDATE Room
SET number = 2, [location]= '4d'
WHERE room_id = 2;


UPDATE team
SET adr = '6b'
WHERE fname='Dr yasser staff';


UPDATE patient
SET Disease = 'cancer'
WHERE fname='yasser';
----------------------------------------

--delete
	DELETE FROM patient
WHERE age = 23
	DELETE FROM Doctor
WHERE gender LIKE null

DELETE FROM patient
WHERE fname = 'tahani'
	DELETE FROM team
WHERE adr = '9A'
	DELETE FROM Room
WHERE number = 8