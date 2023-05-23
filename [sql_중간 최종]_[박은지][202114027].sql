/*1주차 과제*/
CREATE DATABASE ProjectDB;

USE ProjectDB;

CREATE TABLE tbl_book (
	    isbn INT PRIMARY KEY,
		title VARCHAR(40),
		publisher VARCHAR(40),
		price INT);
		
		
INSERT INTO tbl_book (isbn, title, publisher, price)
	VALUES  (1,'그 비스트 돌은 사랑을 한다','소미미디어',22000),
			(2,'어쨌든 귀여워','소미미디어',5000),
			(3,'스파이 패밀리','학산문화사',17000),
			(4,'최애의 아이','대원',14000),
			(5,'귀멸의 칼날',' 학산문화사',7000);
			
SELECT *FROM tbl_book;
DESC tbl_book;

/*2주차 과제*/
SELECT FLOOR(RAND()*(3)+4);
SELECT FLOOR(RAND()*(3)+5);

/*3주차 과제*/
/*테이블 만들기*/

USE ProjectDB;

CREATE TABLE Book(
	bookid INT PRIMARY KEY,
	bookname VARCHAR(40),
	publisher VARCHAR(40),
	price INT);

INSERT INTO Book (bookid, bookname, publisher, price)
VALUES  (1,'축구의 역사','굿스포츠',7000),
		(2,'축구하는 여자','나무수',13000),
		(3,'축구의 이해','대한미디어',22000),
		(4,'골프 바이블','대한미디어',35000),
		(5,'피겨 교본','굿스포츠',8000),
		(6,'역도 단계별기술','굿스포츠',6000),
		(7,'야구의 추억','이상미디어',20000),
		(8,'야구를 부탁해','이상미디어',13000),
		(9,'올림픽 이야기','삼성당',75000),
		(10,'Olympic Champions','Pearson',13000);	
		
		
CREATE TABLE Customer ( 
	custid INT PRIMARY KEY,
	name VARCHAR(40),
	address VARCHAR(50),
	phone VARCHAR(20));
	
	
INSERT INTO Customer (custid, NAME, address, phone)
VALUES  (1,'박지성','영국 맨체스타','000-5000-0001'),
		(2,'김연아','대한민국 서울','000-6000-0001'),
		(3,'장미란','대한민국 강원도','000-7000-0001'),
		(4,'추신수','미국 클리블랜드','000-8000-001'),
		(5,'박세리','대한민국 대전',NULL);
		
CREATE TABLE Orders(
	orderid INT PRIMARY KEY,
	custid INT,
	FOREIGN KEY (custid) REFERENCES Customer(custid),
	bookid INT,
	FOREIGN KEY (bookid) REFERENCES Book(bookid),
	saleprice INT,
	orderdate DATE);
	
INSERT INTO Orders(orderid, custid, bookid,saleprice, orderdate)
VALUES  (1,1,1,6000,DATE('2014-07-01')),
		(2,1,3,21000,DATE('2014-07-03')),
		(3,2,5,8000,DATE('2014-07-03')),
		(4,3,6,6000,DATE('2014-07-04')),
		(5,4,7,20000,DATE('2014-07-05')),
		(6,1,2,12000,DATE('2014-07-07')),
		(7,4,8,13000,DATE('2014-07-07')),
		(8,3,10,12000,DATE('2014-07-08')),
		(9,2,10,7000,DATE('2014-07-09')),
		(10,3,8,13000,DATE('2014-07-10'));
		

CREATE TABLE Imported_book(
	bookid INT,
	bookname VARCHAR(40),
	publisher VARCHAR(40),
	price INT);
	
INSERT INTO Imported_book(bookid, bookname, publisher,price)
VALUES  (21,'Zen Golf','Pearson',12000),
		(22,'Soccer Skills','Human Kinetics',15000);


SELECT bookname FROM Book WHERE publisher='굿스포츠' OR publisher='대한미디어';
SELECT bookname FROM Book WHERE publisher IN ('굿스포츠','대한미디어');

SELECT publisher FROM Book WHERE bookname LIKE '축구의 역사';

SELECT publisher FROM Book WHERE bookname LIKE '%축구%';

SELECT bookname FROM Book WHERE bookname LIKE '_구%';

SELECT * FROM Book GROUP BY bookname;

SELECT * FROM Book ORDER BY price DESC, publisher ASC;

SELECT SUM(saleprice) FROM Orders; 

SELECT  SUM(saleprice) AS '도서의 총 판매액',
		AVG(saleprice)AS '도서의 평균값', 
		MIN(saleprice) AS '도서의 최저가',
		MAX(saleprice) AS '도서의 최고가'
FROM Orders;

SELECT COUNT(*) FROM Orders;

/****주의
(10) 고객별로 주문한 도서의 총 수량과 총 판매액을 구하시오.***/
SELECT custid, COUNT(*), SUM(saleprice) FROM Orders GROUP BY custid; 
SELECT custid,COUNT(*),SUM(saleprice) FROM Orders GROUP BY custid;
SELECT FLOOR(47.4);

SELECT ROUND(4.875,1);

/****주의***/
/*(13) 서점은 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자를 구하시오. (조회 : 주문번호,주문일, 확정일)*/
SELECT custid, orderdate, ADDDATE(orderdate, 10) FROM Orders;

SELECT NAME, phone FROM Customer;

INSERT INTO Book (bookid, bookname, publisher, price)
VALUES(11,'스포츠 의학','한솔의학서적',NULL);

UPDATE Customer SET address='대한민국 부산'  WHERE custid=5;

DELETE FROM Customer WHERE custid=5;

/****주의****/
/*(18) 평균 주문금액 이하의 주문에 대해서 주문번호와 금액을 보이시오*/
SELECT orderid,saleprice FROM Orders WHERE saleprice <= (SELECT AVG(saleprice) FROM Orders);

/***주의***/
/*(19) 주문테이블의 주문번호가 3번인 데이터에 대해 도서제목과, 구매자 이름을 검색하시오.*/
SELECT bookname FROM Book WHERE bookid= (SELECT bookid FROM Orders WHERE orderid=3);
SELECT NAME FROM CUstomer WHERE custid=(SELECT custid FROM Orders WHERE orderid=3);


SELECT * FROM Orders GROUP BY custid HAVING MAX(saleprice) < (SELECT AVG( price) FROM Book);


SELECT *FROM Book WHERE price >= 20000 AND bookname LIKE "%축구%";

SELECT SUM(saleprice)FROM Orders WHERE custid=2;

/****주의
(23) 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하시오. (단, 두 권 이상 구매한 고객만 구하시오.)****/
SELECT custid, COUNT(*) FROM Orders WHERE saleprice >= 8000 GROUP BY custid HAVING COUNT(*)>=2; 

SELECT ROUND(AVG(saleprice),-2) FROM Orders GROUP BY custid;

/****주의
(25) 도서제목에 야구가 포함된 도서를 농구로 변경한 후 도서 목록을 보이시오.****/
SELECT * FROM Book;
SELECT REPLACE(bookname, '야구','농구') FROM Book; 

/****주의
(26) 서점 고객 중에서 같은 성(姓,이름의 성씨)을 가진 사람이 몇 명이나 되는지 성별 인원 수를 구하시오. (SUBSTR함수 사용)****/
SELECT SUBSTR(NAME,1,1),COUNT(*) FROM Customer GROUP BY SUBSTR(NAME,1,1);

/*****주의
(27) 수입도서 목록(Imported_book)을 Book 테이블에 모두 삽입하시오.******/
INSERT INTO Book (bookid, bookname, publisher, price)
SELECT bookid, bookname, publisher,price FROM Imported_book;


INSERT INTO Customer (custid, NAME, address, phone)
VALUES (5,'박세리','대한민국 부산', NULL);

/****주의
(29) Customer 테이블에서 박세리 고객의 주소를 김연아 고객의 주소로 변경하시오***/
UPDATE Customer SET address=(SELECT address FROM Customer WHERE NAME='김연아') WHERE NAME='박세리';

/***주의
(30) 고객별로 주문 금액의 최솟값이 전체 고객의 평균 주문금액보다 큰 금액의 주문 내역에 대해서 주문번호, 고객번호, 금액을 보이시오.***/
SELECT orderid, custid, MIN(saleprice) FROM Orders GROUP BY custid HAVING MIN(saleprice) > (SELECT AVG(saleprice) FROM Orders);


/*4주차 과제*/

CREATE TABLE tbl_gtf_parsing(
	chrom CHAR(5),
	START_bp INT,
	END_bp INT,
	gene_id VARCHAR(30),
	gene_type VARCHAR(50),
	gene_symbol VARCHAR(50)
	);
	
LOAD DATA LOCAL INFILE 'C:/bio_info_lab/MySQL_GTF_parsing_v43.txt'
	INTO TABLE tbl_gtf_parsing FIELDS TERMINATED BY '\t';
	
	
SELECT COUNT(gene_type) FROM tbl_gtf_parsing WHERE gene_type LIKE 'lncRNA';

/***주의
(2) 유전자수가 가장 적은 염색체를 구하시오***/
SELECT chrom,COUNT(gene_id) FROM tbl_gtf_parsing GROUP BY chrom ORDER BY COUNT(gene_id) ASC LIMIT 1;

SELECT COUNT(DISTINCT gene_type) FROM tbl_gtf_parsing;

SELECT gene_symbol, (END_bp - START_bp) FROM tbl_gtf_parsing WHERE (END_bp - START_bp)= (SELECT MAX(END_bp - START_bp) FROM tbl_gtf_parsing);

