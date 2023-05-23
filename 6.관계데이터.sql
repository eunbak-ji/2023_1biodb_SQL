/*DB생성*/
CREATE DATABASE ClassDB;

USE ClassDB;

/*Book, Customer, Orders 데이터 생성*/
CREATE TABLE Book (
	bookid      INT PRIMARY KEY,
	bookname    VARCHAR(40),
		publisher   VARCHAR(40),
	price       INT
	);

CREATE TABLE  Customer (
	custid      INT PRIMARY KEY,
	name        VARCHAR(40),
	address     VARCHAR(50),
	phone       VARCHAR(20)
	);

CREATE TABLE Orders (
	orderid INT PRIMARY KEY,
	custid INT,
	bookid INT,
	FOREIGN KEY (custid) REFERENCES Customer(custid),
	FOREIGN KEY (bookid) REFERENCES Book(bookid),
	saleprice INT,
	orderdate DATE
	);

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
	price       INT
	);
INSERT INTO Imported_Book VALUES(21, 'Zen Golf', 'Pearson', 12000);
INSERT INTO Imported_Book VALUES(22, 'Soccer Skills', 'Human Kinetics', 15000);


/*BIO DATA*/
CREATE TABLE tbl_gtf_parsing (
chrom CHAR(5),
START_bp INT,
END_bp INT,
gene_id VARCHAR(30),
gene_type VARCHAR(50),
gene_symbol VARCHAR(50));

		
/*한글 파일안에 들어가 있는 경우 오류 발생의 여지가 있음.*/		
LOAD DATA LOCAL INFILE 'C:/bio_info_lab/MySQL_GTF_parsing_v43.txt' 
	INTO TABLE tbl_gtf_parsing FIELDS TERMINATED BY '\t';
	
SELECT COUNT(gene_type) FROM tbl_gtf_parSing WHERE gene_type='lncRNA';
SELECT chrom, COUNT(gene_id) FROM tbl_gtf_parsing GROUP BY chrom ORDER BY cnt DESC LIMIT 1;
	