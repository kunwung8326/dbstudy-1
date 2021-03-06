DROP TABLE BOARD;
DROP TABLE MEMBERS;

-- 1. 다음 칼럼 정보를 이용하여 MEMBERS 테이블을 생성하시오.
--    1) 회원번호: NO, NUMBER
--    2) 회원아이디: ID, VARCHAR2(30), 필수, 중복 불가
--    3) 회원패스워드: PW, VARCHAR2(30), 필수
--    4) 회원포인트: POINT, NUMBER, 기본값 1000
--    5) 회원등급: GRADE, VARCHAR2(10), 도메인('VIP', 'GOLD', 'SILVER', 'BRONZE')
--    6) 회원이메일: EMAIL, VARCHAR2(100), 중복 불가
CREATE TABLE MEMBERS
(
    NO NUMBER,
    ID VARCHAR2(30) NOT NULL UNIQUE,
    PW VARCHAR2(30) NOT NULL,
    POINT NUMBER DEFAULT 1000,
    GRADE VARCHAR2(10) CHECK(GRADE IN('VIP', 'GOLD', 'SILVER', 'BRONZE')),
    EMAIL VARCHAR2(100) UNIQUE
);

-- 2. 새로운 칼럼을 추가하시오.
--    1) 회원주소: ADDRESS VARCHAR2(200)
--    2) 회원가입일: REGDATE DATE
ALTER TABLE MEMBERS ADD ADDRESS VARCHAR2(200);
ALTER TABLE MEMBERS ADD REGDATE DATE;

-- 3. 추가된 회원주소 칼럼을 다시 삭제하시오.
ALTER TABLE MEMBERS DROP COLUMN ADDRESS;

-- 4. 회원등급 칼럼의 타입을 VARCHAR2(20)으로 수정하시오.
ALTER TABLE MEMBERS MODIFY GRADE VARCHAR2(20);

-- 5. 회원패스워드 칼럼의 이름을 PWD로 수정하시오.
ALTER TABLE MEMBERS RENAME COLUMN PW TO PWD;

-- 6. 회원번호 칼럼에 기본키를 설정하시오.
ALTER TABLE MEMBERS ADD CONSTRAINT MEMBERS_PK PRIMARY KEY(NO);

-- 7. 다음 칼럼 정보를 이용하여 BOARD 테이블을 생성하시오.
--    1) 글번호: BOARD_NO, NUMBER
--    2) 글제목: TITLE, VARCHAR2(1000), 필수
--    3) 글내용: CONTENT, VARCHAR2(4000), 필수
--    4) 조회수: HIT, VARCHAR2(1)
--    5) 작성자: WRITER, VARCHAR2(30)
--    6) 작성일자: POSTDATE, DATE
CREATE TABLE BOARD
(
    BOARD_NO NUMBER,
    TITLE VARCHAR2(1000) NOT NULL,
    CONTENT VARCHAR2(4000) NOT NULL,
    HIT VARCHAR2(1),
    WRITER VARCHAR2(30),
    POSTDATE DATE
);

-- 8. 조회수 칼럼의 타입을 NUMBER로 수정하시오.
ALTER TABLE BOARD MODIFY HIT NUMBER;

-- 9. 글내용 칼럼의 필수 제약조건을 제거하시오.
ALTER TABLE BOARD MODIFY CONTENT VARCHAR2(4000) NULL;

-- 10. 글번호에 기본키와 작성자 칼럼에 MEMBERS 테이블의 회원아이디를 참조하는 외래키를 설정하시오.
ALTER TABLE BOARD ADD CONSTRAINT BOARD_PK PRIMARY KEY(BOARD_NO);
ALTER TABLE BOARD ADD CONSTRAINT BOARD_MEMBERS_FK FOREIGN KEY(WRITER) REFERENCES MEMBERS(ID);



DESC user_constraints;  -- 제약조건을 저장하고 있는 테이블

SELECT table_name
     , constraint_name
  FROM user_constraints;

-- 제약조건 이름 변경하기
ALTER TABLE BOARD RENAME CONSTRAINT SYS_C007287 TO BOARD_TITLE_NN;

-- 테이블 이름 변경하기
-- BOARD -> BOARDS
RENAME BOARD TO BOARDS;
