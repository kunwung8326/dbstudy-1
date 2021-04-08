DROP TABLE ORDERS;
DROP TABLE CUSTOMER;
DROP TABLE BOOK;

-- 1. 다음 설명을 읽고 적절한 테이블을 생성하되, 기본키/외래키는 별도로 설정하지 마시오.

-- 1) BOOK 테이블
--    (1) BOOK_ID : 책 아이디, 숫자 (최대 11자리), 필수
--    (2) BOOK_NAME : 책 이름, 가변 길이 문자 (최대 100)
--    (3) PUBLISHER : 출판사, 가변 길이 문자 (최대 50)
--    (4) PRICE : 가격, 숫자 (최대 6자리)
CREATE TABLE BOOK
(
    BOOK_ID NUMBER(11) NOT NULL,
    BOOK_NAME VARCHAR2(100),
    PUBLISHER VARCHAR2(50),
    PRICE NUMBER(6)
);

-- 2) CUSTOMER 테이블
--    (1) CUSTOMER_ID : 고객 아이디, 숫자 (최대 11자리), 필수
--    (2) CUSTOMER_NAME : 고객 이름, 가변 길이 문자 (최대 20)
--    (3) ADDRESS : 고객 주소, 가변 길이 문자 (최대 50)
--    (4) PHONE : 고객 전화, 가변 길이 문자 (최대 20)
CREATE TABLE CUSTOMER
(
    CUSTOMER_ID NUMBER(11) NOT NULL,
    CUSTOMER_NAME VARCHAR2(20),
    ADDRESS VARCHAR2(50),
    PHONE VARCHAR2(20)
);

-- 3) ORDERS 테이블
--    (1) ORDER_ID : 주문 아이디, 숫자 (최대 11자리), 필수
--    (2) CUSTOMER_ID : 고객 아이디, 숫자 (최대 11자리)
--    (3) BOOK_ID : 책 아이디, 숫자 (최대 11자리)
--    (4) SALES_PRICE : 판매 가격, 숫자 (최대 6자리)
--    (5) ORDER_DATE : 주문일, 날짜
CREATE TABLE ORDERS
(
    ORDER_ID NUMBER(11) NOT NULL,
    CUSTOMER_ID NUMBER(11),
    BOOK_ID NUMBER(11),
    SALES_PRICE NUMBER(6),
    ORDER_DATE DATE
);

-- 4) 아래 INSERT 문은 변경 없이 그대로 사용한다.
INSERT ALL
    INTO BOOK(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES (1, '축구의역사', '굿스포츠', 7000)
    INTO BOOK(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES (2, '축구아는 여자', '나무수', 13000)
    INTO BOOK(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES (3, '축구의 이해', '대한미디어', 22000)
    INTO BOOK(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES (4, '골프 바이블', '대한미디어', 35000)
    INTO BOOK(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES (5, '피겨 교본', '굿스포츠', 6000)
    INTO BOOK(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES (6, '역도 단계별 기술', '굿스포츠', 6000)
    INTO BOOK(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES (7, '야구의 추억', '이상미디어', 20000)
    INTO BOOK(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES (8, '야구를 부탁해', '이상미디어', 13000)
    INTO BOOK(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES (9, '올림픽 이야기', '삼성당', 7500)
    INTO BOOK(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES (10,'올림픽 챔피언', '피어슨', 13000)
SELECT * FROM DUAL;

INSERT ALL
    INTO CUSTOMER(CUSTOMER_ID, CUSTOMER_NAME, ADDRESS, PHONE) VALUES (1, '박지성', '영국 맨체스타', '000-5000-0001')
    INTO CUSTOMER(CUSTOMER_ID, CUSTOMER_NAME, ADDRESS, PHONE) VALUES (2, '김연아', '대한민국 서울', '000-6000-0001')
    INTO CUSTOMER(CUSTOMER_ID, CUSTOMER_NAME, ADDRESS, PHONE) VALUES (3, '장미란', '대한민국 강원도', '000-7000-0001')
    INTO CUSTOMER(CUSTOMER_ID, CUSTOMER_NAME, ADDRESS, PHONE) VALUES (4, '추신수', '미국 텍사스', '000-8000-0001')
    INTO CUSTOMER(CUSTOMER_ID, CUSTOMER_NAME, ADDRESS, PHONE) VALUES (5, '박세리', '대한민국 대전', NULL)
SELECT * FROM DUAL;

INSERT ALL 
    INTO ORDERS(ORDER_ID, CUSTOMER_ID, BOOK_ID, SALES_PRICE, ORDER_DATE) VALUES (1, 1, 1, 6000, '2014-07-01')
    INTO ORDERS(ORDER_ID, CUSTOMER_ID, BOOK_ID, SALES_PRICE, ORDER_DATE) VALUES (2, 1, 3, 21000, '2014-07-03')
    INTO ORDERS(ORDER_ID, CUSTOMER_ID, BOOK_ID, SALES_PRICE, ORDER_DATE) VALUES (3, 2, 5, 8000, '2014-07-03')
    INTO ORDERS(ORDER_ID, CUSTOMER_ID, BOOK_ID, SALES_PRICE, ORDER_DATE) VALUES (4, 3, 6, 6000, '2014-07-04')
    INTO ORDERS(ORDER_ID, CUSTOMER_ID, BOOK_ID, SALES_PRICE, ORDER_DATE) VALUES (5, 4, 7, 20000, '2014-07-05')
    INTO ORDERS(ORDER_ID, CUSTOMER_ID, BOOK_ID, SALES_PRICE, ORDER_DATE) VALUES (6, 1, 2, 12000, '2014-07-07')
    INTO ORDERS(ORDER_ID, CUSTOMER_ID, BOOK_ID, SALES_PRICE, ORDER_DATE) VALUES (7, 4, 8, 13000, '2014-07-07')
    INTO ORDERS(ORDER_ID, CUSTOMER_ID, BOOK_ID, SALES_PRICE, ORDER_DATE) VALUES (8, 3, 10, 12000, '2014-07-08')
    INTO ORDERS(ORDER_ID, CUSTOMER_ID, BOOK_ID, SALES_PRICE, ORDER_DATE) VALUES (9, 2, 10, 7000, '2014-07-09')
    INTO ORDERS(ORDER_ID, CUSTOMER_ID, BOOK_ID, SALES_PRICE, ORDER_DATE) VALUES (10, 3, 8, 13000, '2014-07-10')
SELECT * FROM DUAL;

-- 2. BOOK, CUSTOMER, ORDERS 테이블들의 적절한 칼럼에 기본키를 추가하시오.
ALTER TABLE BOOK ADD CONSTRAINT BOOK_PK PRIMARY KEY(BOOK_ID);
ALTER TABLE CUSTOMER ADD CONSTRAINT CUSTOMER_PK PRIMARY KEY(CUSTOMER_ID);
ALTER TABLE ORDERS ADD CONSTRAINT ORDERS_PK PRIMARY KEY(ORDER_ID);

-- 3. 외래키가 필요한 테이블을 선정하고 적절한 칼럼에 외래키를 추가하시오.
ALTER TABLE ORDERS ADD CONSTRAINT ORDERS_BOOK_FK FOREIGN KEY(BOOK_ID) REFERENCES BOOK(BOOK_ID);
ALTER TABLE ORDERS ADD CONSTRAINT ORDERS_CUSTOMER_FK FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID);

-- 4. 2014년 7월 4일부터 7월 7일 사이에 주문 받은 도서를 제외하고 나머지 모든 주문 정보를 조회하시오.
SELECT order_id
     , book_id
     , customer_id
     , sales_price
     , order_date
  FROM orders
 WHERE order_date NOT BETWEEN '14/07/04' AND '14/07/07';

SELECT o.order_id
     , b.book_name
     , c.customer_name
     , o.sales_price
     , o.order_date
  FROM customer c, book b, orders o
 WHERE c.customer_id = o.customer_id
   AND b.book_id = o.book_id
   AND order_date NOT BETWEEN '14/07/04' AND '14/07/07';


-- 5. 박지성의 총 구매액(SALES_PRICE)을 조회하시오.
-- 1) 조인
SELECT c.customer_name
     , SUM(o.sales_price) AS 총구매액
  FROM customer c INNER JOIN orders o
    ON c.customer_id = o.customer_id
 WHERE c.customer_name = '박지성'  -- WHERE절이 없으면 전체 구매자 정보가 확인된다.
 GROUP BY c.customer_name;

-- 2) 서브쿼리
-- 박지성의 구매내역만을 인라인 뷰(FROM절)로 가져와서 처리
SELECT p.customer_name
     , SUM(p.sales_price)
  FROM (SELECT o.sales_price
             , c.customer_name
          FROM customer c, orders o
         WHERE c.customer_id = o.customer_id
           AND c.customer_name = '박지성') p
 GROUP BY p.customer_name;

-- 3) 서브쿼리
-- 박지성의 구매내역의 합계를 스칼라 서브쿼리로 처리
SELECT c.customer_name
     , (SELECT SUM(o.sales_price)
          FROM orders o
         WHERE c.customer_id = o.customer_id) AS 총구매액
  FROM customer c
 WHERE c.customer_name = '박지성';


-- 6. 박지성이 구매한 도서의 수를 조회하시오.
SELECT c.customer_name
     , COUNT(o.order_id) AS 총구매횟수
  FROM customer c INNER JOIN orders o
    ON c.customer_id = o.customer_id
 WHERE c.customer_name = '박지성'  -- WHERE절이 없으면 전체 구매자 정보가 확인된다.
 GROUP BY c.customer_name;


-- 7. 박지성이 구매한 도서를 발간한 출판사(PUBLISHER)의 수를 조회하시오.
SELECT c.customer_name
     , COUNT(DISTINCT b.publisher) AS 출판사수
  FROM customer c INNER JOIN orders o
    ON c.customer_id = o.customer_id INNER JOIN book b
    ON b.book_id = o.book_id
 WHERE c.customer_name = '박지성'
 GROUP BY c.customer_name;


-- 8. 고객별로 분류하여 각 고객의 이름과 각 고객별 총 구매액을 조회하시오. 주문 이력이 없으면 0으로 조회하시오.
SELECT c.customer_name
     , NVL(SUM(o.sales_price), 0) AS 총구매액
  FROM customer c LEFT OUTER JOIN orders o
    ON c.customer_id = o.customer_id
 GROUP BY c.customer_name;
     
SELECT c.customer_name
     , NVL(SUM(o.sales_price), 0) AS 총구매액
  FROM customer c, orders o
 WHERE c.customer_id = o.customer_id(+)
 GROUP BY c.customer_name;


-- 9. 주문한 이력이 없는 고객의 이름을 조회하시오.
-- SELECT FROM WHERE customer_id NOT IN(주문한 customer_id);
SELECT
       c.customer_name
  FROM customer c
 WHERE c.customer_id NOT IN(SELECT DISTINCT o.customer_id
                              FROM orders o);


-- 10. 고객별로 총 구매횟수를 조회하시오. 주문 이력이 없으면 0으로 조회하시오.
SELECT c.customer_id
     , c.customer_name
     , COUNT(o.order_id) AS 구매횟수
  FROM customer c LEFT OUTER JOIN orders o
    ON c.customer_id = o.customer_id
 GROUP BY c.customer_id, c.customer_name;
