/*1. 해당 테이블을 ‘ProjectDB’ 라는 이름의 데이터베이스 안에 작성하시오.*/
/*데이터 베이스 생성*/
CREATE DATABASE ProjectDB

/*이용할 데이터 베이스 붚러오기*/
USE ProjectDB

/*테이블 만들기*/
CREATE TABLE tbl_book (
	isbn INT PRIMARY KEY,
	title VARCHAR(40),
	publisher VARCHAR(40),
	price INT);
	
/*테이블 내용 작성*/	
INSERT INTO tbl_book (isbn, title, publisher, price)
	VALUES  (1,'그 비스트돌은 사랑을 한다', '소미미디어', 22000),
		 	(2, '어쩃든 귀여워', '소미미디어',5000),
		 	(3,'스파이 패밀리','학산문화사',17000),
		 	(4,'최대의 아이', '대원',14000),
		 	(5,'귀멸의 칼날', '학산문화사',7000);
		 	
/*테이블 출력*/
SELECT * FROM  tbl_book;

