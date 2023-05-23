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
		


/*새로운 table만들기*/
CREATE TABLE tbl_exam(
	id INT AUTO_INCREMENT PRIMARY KEY,
	familyname VARCHAR (40),
	firstname VARCHAR (40),
	score_korean INT,
	score_math INT,
	score_english INT);
	
INSERT INTO tbl_exam (familyname, firstname, score_korean,score_math, score_english)
	VALUES  ('아야나미','레이',80,88,85),
			('이카리','신지',72,74,76),
			('소류','아스카 랑그레이',40,96,100),
			('구','자윤',100,100,100),
			('이와토','스즈메',74,80,88),
			('정','대만',30,15,16);
			
			
SELECT * FROM tbl_exam;
INSERT INTO tbl_book(isbn,title, publisher) VALUES (7,'니세코이', '학산문화사');
SELECT *FROM tbl_book:

/*산술연산자 사용하기*/
SELECT firstname, (score_korean/score_math) AS nanugi FROM tbl_exam;
SELECT firstname, (score_korean%score_math) AS namerge FROM tbl_exam;
SELECT firstname, (score_korean+score_math+score_english)/3 AS average FROM tbl_exam ORDER BY average DESC;


/*비교 연산자 사용하기*/
SELECT id, firstname, score_english FROM tbl_exam WHERE score_english >= 85;
SELECT id, firstname, score_korean FROM tbl_exam WHERE score_korean <> 100;
SELECT id, firstname, score_korean FROM tbl_exam WHERE score_korean != 40;
SELECT id, firstname, score_korean FROM tbl_exam WHERE firstname='자윤';


/*비교연산자 사용하기 */
SELECT * FROM tbl_exam WHERE ((score_math >85) AND (score_english >=80));
SELECT * FROM tbl_exam WHERE ((score_korean >=80) AND (score_math >=90));
SELECT * FROM tbl_exam WHERE NOT((score_korean + score_math + score_english) >240);


/*문자를 다루는 연산자: 숫자와 글자도 합칠 수 있다. */
SELECT CONCAT(familyname, firstname) AS 'fullname' FROM tbl_exam;
SELECT CONCAT(familyname,' ', firstname) AS fullname FROM tbl_exam;
SELECT CONCAT(familyname, score_korean) AS fullname FROM tbl_exam;
SELECT * FROM tbl_exam WHERE firstname LIKE '%리%';
SELECT * FROM tbl_chara WHERE chara_name LIKE '_자_';

/*SQL 연산자 : IS NULL*/
SELECT title FROM tbl_book WHERE price IS NULL;
SELECT title FROM tbl_book WHERE price IS NOT NULL;







