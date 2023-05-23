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
		

/*데이터 가져오기*/
SELECT * FROM tbl_book;
SELECT * FROM tbl_chara;

SELECT title, price FROM tbl_book;
SELECT chara_name FROM tbl_chara;

/*조건을 지정해서 데이터 가져오기*/
SELECT * FROM tbl_chara WHERE age > 14 AND age <17;
SELECT * FROM tbl_chara WHERE age BETWEEN 14 AND 17;


SELECT *FROM tbl_chara WHERE age=14 OR age=17;
SELECT *FROM tbl_chara WHERE age IN (14,17);
SELECT *FROM tbl_chara WHERE age NOT IN (14,17);

SELECT *FROM tbl_book WHERE NOT publisher='학산문화사';
SELECT *FROM tbl_chara WHERE chara_name LIKE '구_';
SELECT *FROM tbl_chara WHERE chara_name LIKE '구__';
SELECT *FROM tbl_chara WHERE chara_name LIKE '구___';


SELECT *FROM tbl_chara WHERE chara_name LIKE '구%';
SELECT *FROM tbl_chara WHERE height LIKE '%0';
SELECT *FROM tbl_chara WHERE chara_name LIKE '%이%';

SELECT *FROM tbl_book ORDER BY price ASC;
SELECT *FROM tbl_book ORDER BY price;

SELECT *FROM tbl_chara ORDER BY height DESC;


/*LIMIT 함수: 다른 SQL에서는 TOP으로 쓴다.*/
SELECT *FROM tbl_chara;
SELECT *FROM tbl_chara LIMIT 4;

SELECT publisher FROM tbl_book;
SELECT publisher FROM tbl_book LIMIT 4;

SELECT * FROM tbl_book ORDER BY price DESC;
SELECT *FROM tbl_book ORDER BY price DESC LIMIT 4;

SELECT *FROM tbl_chara WHERE age BETWEEN 14 AND 17;
SELECT *FROM tbl_chara WHERE age BETWEEN 14 AND 17 LIMIT 2;

/*SELECT 활용: 별명 만들기*/
SELECT isbn,price,title AS '제목', publisher AS '출판사' FROM tbl_book;
SELECT isbn,price, title,publisher FROM tbl_book;


/* SELECT문 활용:중복되는 값을 제외하고 선택하기*/
SELECT publisher FROM tbl_book;
SELECT DISTINCT publisher,price FROM tbl_book;
SELECT DISTINCT publisher FROM tbl_book;

INSERT INTO tbl_book(isbn, title, publisher,price) VALUES (6,'극주부도','학산문화사',7000);

SELECT * FROM tbl_book;
SELECT publisher, price FROM tbl_book;
SELECT DISTINCT publisher,price FROM tbl_book;

DELETE FROM tbl_book WHERE title='극주부도';
SELECT *FROM tbl_book;


