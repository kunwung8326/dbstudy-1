DROP TABLE customer;
DROP TABLE bank;

CREATE TABLE bank
(
    bank_code VARCHAR2(20),
    bank_name VARCHAR2(30)
);
CREATE TABLE customer
(
    no NUMBER,
    name VARCHAR2(30) NOT NULL,
    phone VARCHAR2(30),
    age NUMBER,
    bank_code VARCHAR2(20)
);

-- 테이블 변경
-- ALTER TABLE 테이블 (ADD, REMOVE, MODIFY 등)

ALTER TABLE bank ADD CONSTRAINT bank_pk PRIMARY KEY(bank_code);
ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY(no);
ALTER TABLE customer ADD CONSTRAINT customer_phone_uq UNIQUE(phone);
ALTER TABLE customer ADD CONSTRAINT customer_age_ck CHECK(age BETWEEN 0 AND 100);
ALTER TABLE customer ADD CONSTRAINT customer_bank_fk FOREIGN KEY(bank_code) REFERENCES bank(bank_code);










