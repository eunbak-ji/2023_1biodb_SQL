CREATE DATABASE ClassDB;

USE ClassDB;


CREATE TABLE tbl_book(
	isbn INT PRIMARY KEY,
	title VARCHAR(40),
	publisher VARCHAR(40),
	price INT);
	
CREATE TABLE tbl_chara (
	id INT PRIMARY KEY,
	chara_name VARCHAR(40),
	age INT,
	height FLOAT);
	
CREATE TABLE tbl_sanrio ( 
	id INT PRIMARY KEY, 
	familyname VARCHAR(40),
	firstname VARCHAR(40),
	nationality VARCHAR(40),
	birthday DATE,
	height INT,
	weight FLOAT,
	today DATE);
	
CREATE TABLE tbl_exam(
	id INT AUTO_INCREMENT PRIMARY KEY,
	familyname VARCHAR (40),
	firstname VARCHAR (40),
	score_korean INT,
	score_math INT,
	score_english INT);
	
	
/*데이터 INSERT 방법: INSERT INTO 테이블이름 (속성1, 속성2,속성3,...) VALUES/VALUE (값1, 값2,값3,...)*/
INSERT INTO tbl_book (isbn,title,publisher,price) VALUES (1,'그 비스트 돌은 사랑을 한다','소미미디어',22000);
INSERT INTO tbl_book (isbn,title,publisher,price) VALUES (2,'어쩃든 귀여워','소미미디어',5000);
INSERT INTO tbl_book (isbn,title,publisher,price) VALUES (3,'스파이 패밀리','학산문화사',17000);
INSERT INTO tbl_book (isbn,title,publisher,price) VALUES (4,'최대의 아이','대원',14000);
INSERT INTO tbl_book (isbn,title,publisher,price) VALUES (5,'귀멸의 칼날','학산문화사',7000);


/*데이터 INSERT 방법: 
INSERT INTO 테이블 이름(속성1, 속성2, 속성3,...)
VALUE (값1, 값2,값3,...),(값4,값5,값6,...)*/
INSERT INTO tbl_chara (id,chara_name,age,height)
VALUES  (1,'아스카 랑그레이',14,157),(2,'우지마츠 지야',15,157),
		(3,'오이카와 토오루',18,184.3),
		(4,'구자윤',17,170),
		(5,'샬롯 링링',68,880),
		(6,'이와토 스즈메',17,155),(7,'구교환',40,174),
		(8,'구데타마',9,4.6);
		


INSERT INTO tbl_sanrio ( id, familyname, firstname, nationality, birthday, height, weight, today)
	VALUES  (1, 'HELLO','kitty','  England  ','1974-11-01',30,0.42,'2023-04-04'),
			(2, 'MY','melody','  Mariland  ','1975-01-18',37,0.58,'2023-04-04'),
			(3, 'KEROKERO','keroppi','  Hasunoue  ','1988-07-10',28,0.3789,'2023-04-04'),
			(4, 'POMPOM', 'purin', '  Basket  ','1996-04-16',50,5.5,'2023-04-04'),
			(5, 'CIN','namoroll', '  Cafe  ','2001-03-06',21,1.248,'2023-04-04'),
			(6, 'KU','romi','  Mariland  ','2005-10-31',33,0.45,'2023-04-04');
			

INSERT INTO tbl_exam (familyname, firstname, score_korean,score_math, score_english)
	VALUES  ('아야나미','레이',80,88,85),
			('이카리','신지',72,74,76),
			('소류','아스카 랑그레이',40,96,100),
			('구','자윤',100,100,100),
			('이와토','스즈메',74,80,88),
			('정','대만',30,15,16);
			

INSERT INTO tbl_exam(firstname, score_korean, score_math,score_english)
	VALUES ('코로센세',100,100,100);
	
SELECT * FROM tbl_exam;

/*집계함수, ','를 이용해서 함께 쓸 수 있다.: null이 아닌 행의 개수를 반환한다.*/
SELECT COUNT(*) FROM tbl_exam;
SELECT COUNT(familyname) FROM tbl_exam;
SELECT COUNT(firstname) FROM tbl_exam;
SELECT COUNT(familyname) AS "name cnt" FROM tbl_exam;
SELECT COUNT(familyname), COUNT(firstname) FROM tbl_exam;

SELECT COUNT(score_korean) FROM tbl_exam;
SELECT COUNT(DISTINCT score_korean) FROM tbl_exam;

/*MIN,MAX 함수*/
SELECT MIN(score_math) FROM tbl_exam;
SELECT MAX(score_math) FROM tbl_exam;

/*한글에서 max에서는 순서가 늦은것, min은 빠른것*/
SELECT MAX(firstname) FROM tbl_exam;
SELECT MIN(firstname) FROM tbl_exam;

SELECT MAX (score_korean+score_math+score_english)
AS max_sum FROM tbl_exam;

SELECT score_math, COUNT(firstname)FROM tbl_exam GROUP BY score_math;
SELECT publisher, COUNT(publisher)FROM tbl_book GROUP BY publisher;

SELECT publisher, MIN(price)FROM tbl_book GROUP BY publisher HAVING MIN(price)>5500;


SELECT CAST('2023%09%11' AS DATE);
SELECT CAST('20230911' AS DATE);



