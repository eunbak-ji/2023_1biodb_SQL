/* 1. 해당 테이블을 ‘ProjectDB’ 라는 이름의 데이터베이스 안에 작성하시오. */


/*데이터베이스 생성 */
CREATE DATABASE ProjectDB;

/*데이터베이스 선택*/
USE ProjectDB;

/* 테이블 작성 (도서) */
CREATE TABLE tbl_book (
	isbn INT PRIMARY KEY,
	title VARCHAR(40),
	publisher VARCHAR(40),
	price INT);

/*데이터 등록하기*/
INSERT INTO tbl_book (isbn,title,publisher,price) VALUES (1,'그 비스크 돌은 사랑을 한다','소미미디어',22000);
INSERT INTO tbl_book (isbn,title,publisher,price) VALUES (2,'어쨌든 귀여워','소미미디어',5000);
INSERT INTO tbl_book (isbn,title,publisher,price) VALUES (3,'스파이 패밀리','학산문화사',17000);
INSERT INTO tbl_book (isbn,title,publisher,price) VALUES (4,'최애의 아이','대원',14000);
INSERT INTO tbl_book (isbn,title,publisher,price) VALUES (5,'귀멸의 칼날','학산문화사',7000);