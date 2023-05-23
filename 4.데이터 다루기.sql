CREATE DATABASE ClassDB;

USE ClassDB;


CREATE TABLE tbl_sanrio ( 
	id INT PRIMARY KEY, 
	familyname VARCHAR(40),
	firstname VARCHAR(40),
	nationality VARCHAR(40),
	birthday DATE,
	height INT,
	weight FLOAT,
	today DATE);
	
INSERT INTO tbl_sanrio ( id, familyname, firstname, nationality, birthday, height, weight, today)
	VALUES  (1, 'HELLO','kitty','  England  ','1974-11-01',30,0.42,'2023-04-04'),
			(2, 'MY','melody','  Mariland  ','1975-01-18',37,0.58,'2023-04-04'),
			(3, 'KEROKERO','keroppi','  Hasunoue  ','1988-07-10',28,0.3789,'2023-04-04'),
			(4, 'POMPOM', 'purin', '  Basket  ','1996-04-16',50,5.5,'2023-04-04'),
			(5, 'CIN','namoroll', '  Cafe  ','2001-03-06',21,1.248,'2023-04-04'),
			(6, 'KU','romi','  Mariland  ','2005-10-31',33,0.45,'2023-04-04');
			
			
SELECT * FROM tbl_sanrio;

SELECT RAND();
SELECT RAND();
SELECT RAND(4);
SELECT RAND(4);

/*수치 함수*/
SELECT ROUND(0.3789,2);

SELECT CEILING(4);
SELECT CEILING(3.1);

SELECT FLOOR(44);
SELECT FLOOR(44.7);


SELECT weight,  ROUND(weight,0) AS result_round_1,
				ROUND(weight,2) AS result_round_2,
				ROUND(weight,-1) AS 'result_round_-1',
				CEILING(weight)AS result_ceiling,
				FLOOR(weight)AS result_floor FROM tbl_sanrio;	
				
/*0이상 N미만의 랜덤 정수값 반환 : 부등호 곱하기 */				
SELECT FLOOR(RAND()*(4)) AS "1이상 4미만의 랜덤 정수값";
/*1이상 N이상의 랜덤 정수값 반환*/
SELECT FLOOR(RAND()*(4)+1) AS"1이상 4이하의 랜덤 정수값";

/*문자열 함수*/
SELECT LENGTH('그대는 내 머리위에 우산');
SELECT CHAR_LENGTH('그대는 내 머리위에 우산');

SELECT LENGTH('우');
SELECT CHAR_LENGTH('우');
SELECT LENGTH('산');

SELECT LENGTH('Let It Go');
SELECT CHAR_LENGTH('Let It Go');

SELECT SUBSTR('abcde',2,3);
SELECT SUBSTR('신지아스카레이',3,3);
SELECT SUBSTR('신지아스카레이',-5,3);
SELECT SUBSTR('신지아스카레이',-3,2);

SELECT SUBSTRING('신지아스카레이',3,3);

SELECT familyname, LENGTH(familyname) AS result FROM tbl_sanrio;
SELECT familyname, SUBSTRING(familyname,-1,1) AS result FROM tbl_sanrio;


SELECT nationality, LENGTH(nationality)AS r_length,
					LPAD(nationality,9,'#') AS r_lpad,
					RPAD(nationality,12,'#')AS r_rpad FROM tbl_sanrio;
					
SELECT nationality, LENGTH(nationality)AS r_length,
					LPAD(nationality,15,'#') AS r_lpad,
					RPAD(nationality,15,'#')AS r_rpad,
					LPAD(nationality,15,' ')AS r_lpad,
					LPAD(nationality,15)AS r_lpad FROM tbl_sanrio;


/*문자열 함수 : TRIM, lTRIM, RTRIM 공백 제거*/
SELECT CONCAT ('***', nationality, '***') AS afterrisk,
CONCAT('***',LTRIM (nationality),'***') AS leftsp,
CONCAT('***',RTRIM(nationality),'***')AS ringtsp,
CONCAT('***',TRIM(nationality),'***') AS rightsp
FROM tbl_sanrio;


/*문자 반환*/
SELECT LEFT('REIASUKA',3), RIGHT('REIASUKA',5);
SELECT UPPER('AbCdEfGhI'), LOWER('AbCdEfGhI');

SELECT firstname, UPPER(firstname)AS big FROM tbl_sanrio;
SELECT familyname, LOWER(familyname) AS small FROM tbl_sanrio;

/*치환, 반복, 역순*/
SELECT familyname,
REPLACE (firstname, "melody","hero academia") AS r_replace FROM tbl_sanrio;

SELECT REPEAT('도솔미솔',4);
SELECT REVERSE('AnimatioN');


/*날짜 함수*/
SELECT NOW();
SELECT SYSDATE();

SELECT DATE(NOW()), TIME(NOW());

SELECT YEAR(NOW()),
		MONTH(NOW()),
		DAY(NOW());
		
SELECT WEEKOFYEAR(NOW());
SELECT DAYOFYEAR(NOW());
SELECT DAYOFYEAR('2023-01-21');
SELECT DAYNAME(NOW());

SELECT DATE ('2023-04-03 22:49:58'),
		TIME('2023-04-03 22:49:28');
				
/*날짜 더하기, 빼기*/				
SELECT ADDDATE('2023-04-04', INTERVAL 4 DAY);
SELECT DATE_ADD('2023-04-04', INTERVAL 4 DAY);

SELECT SUBDATE('2023-04-04', INTERVAL 4 DAY);
SELECT DATE_SUB('2023-04-04', INTERVAL 4 DAY);				


SELECT ADDDATE('2023-04-04', INTERVAL 4 DAY);
SELECT DATE_ADD('2023-04-04', INTERVAL 4 DAY);

SELECT ADDDATE('2023-04-04', INTERVAL 3 MONTH);
SELECT ADDDATE('2023-04-04', INTERVAL 4 YEAR);

SELECT SUBDATE('2023-04-04', INTERVAL 4 DAY);
SELECT DATE_SUB('2023-04-04', INTERVAL 4 DAY);

SELECT SUBDATE('2023-04-04', INTERVAL 3 MONTH);
SELECT SUBDATE('2023-04-04', INTERVAL 4 YEAR);

SELECT birthday, today, DATEDIFF(NOW(), birthday) AS subday FROM tbl_sanrio;
SELECT birthday, today, DATEDIFF(birthday, today) AS subday FROM tbl_sanrio;	

SELECT DATEDIFF('2023-12-31 09:11:00','2023-04-04 10:30:00') AS result_1;
SELECT DATEDIFF('2023-12-31','2021-13-20') AS result_2;		
								
SELECT birthday, TIMESTAMPDIFF(DAY,birthday, today) AS days FROM tbl_sanrio;
SELECT birthday, TIMESTAMPDIFF(YEAR,birthday, today) AS years FROM tbl_sanrio;
SELECT birthday, TIMESTAMPDIFF(SECOND,birthday, today) AS seconds FROM tbl_sanrio;
