/*DB생성*/
CREATE DATABASE ProjectDB;

USE ProjectDB;

/*Book, Customer, Orders 데이터 생성*/
CREATE TABLE Book (
	bookid      INT PRIMARY KEY,
	bookname    VARCHAR(40),
	publisher   VARCHAR(40),
	price       INT);

CREATE TABLE  Customer (
	custid      INT PRIMARY KEY,
	name        VARCHAR(40),
	address     VARCHAR(50),
	phone       VARCHAR(20));

CREATE TABLE Orders (
	orderid INT PRIMARY KEY,
	custid INT,
	bookid INT,
	FOREIGN KEY (custid) REFERENCES Customer(custid),
	FOREIGN KEY (bookid) REFERENCES Book(bookid),
	saleprice INT,
	orderdate DATE);

INSERT INTO Book VALUES(1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO Book VALUES(2, '축구아는 여자', '나무수', 13000);
INSERT INTO Book VALUES(3, '축구의 이해', '대한미디어', 22000);
INSERT INTO Book VALUES(4, '골프 바이블', '대한미디어', 35000);
INSERT INTO Book VALUES(5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO Book VALUES(6, '역도 단계별기술', '굿스포츠', 6000);
INSERT INTO Book VALUES(7, '야구의 추억', '이상미디어', 20000);
INSERT INTO Book VALUES(8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO Book VALUES(9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO Book VALUES(10, 'Olympic Champions', 'Pearson', 13000);

INSERT INTO Customer VALUES (1, '박지성', '영국 맨체스타', '000-5000-0001');
INSERT INTO Customer VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');
INSERT INTO Customer VALUES (3, '장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO Customer VALUES (4, '추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO Customer VALUES (5, '박세리', '대한민국 대전',  NULL);


INSERT INTO Orders VALUES (1, 1, 1, 6000, DATE('2014-07-01'));
INSERT INTO Orders VALUES (2, 1, 3, 21000, DATE('2014-07-03'));
INSERT INTO Orders VALUES (3, 2, 5, 8000, DATE('2014-07-03'));
INSERT INTO Orders VALUES (4, 3, 6, 6000, DATE('2014-07-04'));
INSERT INTO Orders VALUES (5, 4, 7, 20000, DATE('2014-07-05'));
INSERT INTO Orders VALUES (6, 1, 2, 12000, DATE('2014-07-07'));
INSERT INTO Orders VALUES (7, 4, 8, 13000, DATE( '2014-07-07'));
INSERT INTO Orders VALUES (8, 3, 10, 12000, DATE('2014-07-08'));
INSERT INTO Orders VALUES (9, 2, 10, 7000, DATE('2014-07-09'));
INSERT INTO Orders VALUES (10, 3, 8, 13000, DATE('2014-07-10'));


/* Imported_book 테이블*/

CREATE TABLE Imported_Book (
	bookid      INT ,
	bookname    VARCHAR(40),
	publisher   VARCHAR(40),
	price       INT);
	
INSERT INTO Imported_Book VALUES(21, 'Zen Golf', 'Pearson', 12000);
INSERT INTO Imported_Book VALUES(22, 'Soccer Skills', 'Human Kinetics', 15000);



/* (1) 출판사가 ‘굿스포츠’ 혹은 ‘대한미디어’인 도서를 검색하시오. (IN, OR 두 경우 모두) */
SELECT * FROM Book WHERE publisher IN ('굿스포츠','대한미디어');
SELECT * FROM Book WHERE publisher='굿스포츠' OR publisher='대한미디어';

/* (2) ‘축구의 역사’를 출간한 출판사를 검색하시오. */
SELECT bookname, publisher FROM Book WHERE bookname LIKE '축구의 역사'; 

/* (3) 도서이름에 ‘축구’가 포함된 출판사를 검색하시오. */
SELECT bookname, publisher FROM Book WHERE bookname LIKE '%축구%'; 

/* (4) 도서이름의 왼쪽 두 번째 위치에 ‘구’라는 문자열을 갖는 도서를 검색하시오. */
SELECT * FROM Book WHERE bookname LIKE '_구%'; 

/* (5) 도서를 이름순으로 검색하시오. */
SELECT * FROM Book ORDER BY bookname;

/* (6) 도서를 가격의 내림차순으로 검색하고, 가격이 같으면 출판사의 오름차순으로 검색하시오. */
SELECT * FROM Book ORDER BY price DESC, publisher ASC; 

/* (7) 고객이 주문한 도서의 총 판매액을 구하시오. */
SELECT SUM(saleprice) FROM Orders;

/* (8) 고객이 주문한 도서의 총 판매액, 평균값, 최저가, 최고가를 구하시오. */
SELECT SUM(saleprice) AS Total, 
		AVG(saleprice) AS Average, 
		MIN(saleprice) AS Minimum, 
		Max(saleprice) AS Maximum 
FROM Orders; 

/* (9) 서점의 도서 판매 건수를 구하시오. */
SELECT COUNT(*) FROM Orders;

/* (10) 고객별로 주문한 도서의 총 수량과 총 판매액을 구하시오. */
SELECT custid, COUNT(*) AS 도서수량, SUM(saleprice) AS 총액 FROM Orders GROUP BY custid;

/* (11) 47.4보다 큰 정수 중에서 가장 작은 정수를 구하시오. */
SELECT CEILING(47.);

/* (12) 4.875를 소수 첫째 자리까지 반올림한 값을 구하시오. */
SELECT ROUND(4.875,1);

/* (13) 서점은 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자를 구하시오.  
	(조회 : 주문번호,주문일, 확정일) */
SELECT orderid AS 주문번호, orderdate AS 주문일, ADDDATE(orderdate,10) AS 확정일 FROM Orders;

/* (14) 이름, 전화번호가 포함된 고객목록을 보이시오. */
SELECT NAME,phone FROM Customer;

/* (15) Book 테이블에 새로운 도서 ‘스포츠 의학’ 을 삽입하시오. 
스포츠 의학은 한솔의학서적에서 출간했으며, 가격은 미정이다. */
INSERT INTO Book (bookid, bookname,publisher) VALUES(14, '스포츠 의학', '한솔의학서적');

/* (16) Customer 테이블에서 고객번호가 5인 고객의 주소를 ‘대한민국 부산'으로 변경하시오. */
UPDATE Customer SET address='대한민국 부산' WHERE custid=5;

/* (17) Customer 테이블에서 고객번호가 5인 고객을 삭제하시오. */
DELETE FROM Customer WHERE custid=5;

/* (18) 평균 주문금액 이하의 주문에 대해서 주문번호와 금액을 보이시오. */
SELECT orderid, saleprice
	FROM Orders
	WHERE saleprice <= (SELECT AVG(saleprice) FROM Orders) ;

/* (19) 주문테이블의 주문번호가 3번인 데이터에 대해 도서제목과, 구매자 이름을 검색하시오. */
SELECT NAME FROM Customer WHERE custid = (
	SELECT custid FROM Orders WHERE orderid=3);
SELECT bookname FROM Book WHERE bookid = (
	SELECT bookid FROM Orders WHERE orderid=3);
	
/* (20) 주문테이블에서 고객별로 주문금액의 최대값이 전체 도서의 평균 가격보다 낮은 도서를 조회하시오. */
SELECT * FROM Orders
	GROUP BY custid ;
	HAVING max(saleprice) < (SELECT avg(saleprice) FROM Orders);

/* (21) 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 검색하시오. */
SELECT * FROM Book WHERE price >=20000;

/* (22) 2번 김연아 고객이 주문한 도서의 총 판매액을 구하시오. */
SELECT SUM(saleprice) FROM Orders WHERE custid=2;


/* (23) 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하시오. 
	(단, 두 권 이상 구매한 고객만 구하시오.) */
SELECT custid, COUNT(*) AS 도서수량 
	FROM Orders 
	WHERE saleprice >=8000
	GROUP BY custid
	HAVING COUNT(*) >= 2;

/* (24) 고객별 평균 주문 금액을 백원 단위까지 반올림한 값을 구하시오. */
SELECT custid, ROUND(AVG(saleprice),-2) AS 평균주문가격 FROM Orders GROUP BY custid;

/* (25) 도서제목에 야구가 포함된 도서를 농구로 변경한 후 도서 목록을 보이시오. */
SELECT REPLACE(bookname,'야구','농구') FROM Book;

/* (26) 서점 고객 중에서 같은 성(姓,이름의 성씨)을 가진 사람이 
	몇 명이나 되는지 성별 인원 수를 구하시오. (SUBSTR함수 사용)  */
SELECT substr(NAME,1,1) AS 성, COUNT(*) AS 인원 FROM Customer GROUP BY substr(NAME,1,1);

/* (27) 수입도서 목록(Imported_book)을 Book 테이블에 모두 삽입하시오. */
INSERT INTO Book(bookid, bookname, price, publisher)
	SELECT bookid, bookname, price, publisher FROM Imported_book;
	
/* (28) Customer 테이블에 새로운 고객 
	(이름:박세리, 주소:대한민국 부산, 전화번호:없음(null))을 삽입하시오. */
INSERT INTO Customer VALUES (5, '박세리', '대한민국 부산', NULL);

/* (29) Customer 테이블에서 박세리 고객의 주소를 김연아 고객의 주소로 변경하시오. */
SELECT * FROM Customer;
UPDATE Customer
	SET address=(SELECT address FROM Customer WHERE NAME='김연아')
	WHERE NAME = '박세리';	
SELECT * FROM Customer;

/* (30) 고객별로 주문 금액의 최솟값이 
	전체 고객의 평균 주문금액보다 큰 금액의 주문 내역에 대해서 
	주문번호, 고객번호, 금액을 보이시오. */
SELECT orderid, custid, min(saleprice)
	FROM Orders
	GROUP BY custid
	HAVING min(saleprice) > (SELECT AVG(saleprice) FROM Orders);




