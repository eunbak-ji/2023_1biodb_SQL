/*데이터 베이스 생성*/
CREATE DATABASE ClassDB;

/*데이터 베이스 선택*/
USE ClassDB;

/*테이블 작성*/
CREATE TABLE tbl_book(
	code INT,
	title VARCHAR(30),
	price INT);
	
/*제약조건: 어느 속성 뒤에 써도 OK, 몇번을 써도 OK 
(제약조건을 달고 싶은 속성 뒤에다가 제약조건 넣기기*/
CREATE TABLE tbl_book(
	code INT NOT NULL,
	title VARCHAR(30),
	price INT); 
	
/*UNIQUE 제약조건*/
CREATE TABLE tbl_book(
	code INT UNIQUE,
	title VARCHAR(30),
	price INT);
	
/*UNIQUE 제약조건에 이름 설정*/
CREATE TABLE tbl_book(
	code INT,
	title VARCHAR(30),
	price INT,
	CONSTRAINT only_code UNIQUE (code));

/*PRIMARY KEY = NOT NULL + UNIQUE*/	
CREATE TABLE tbl_book(
	code INT,
	title VARCHAR(30),
	price INT PRIMARY KEY);
	
/*기본키(primary key)는 속성을 두개 가지고 있을 수 있다.*/	
CREATE TABLE tbl_book(
	code INT,
	title VARCHAR(30),
	price INT,
	PRIMARY KEY(title, price));
	
/*DEFAULT 제약조건*/
CREATE TABLE tbl_book(
	code INT,
	title VARCHAR(30),
	price INT DEFAULT '4400');