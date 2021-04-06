CREATE TABLE department
(
    dept_no NUMBER,
    dept_name VARCHAR2(10),
    location VARCHAR2(10)
);
CREATE TABLE employee
(
    emp_no NUMBER,
    name VARCHAR2(10),
    depart NUMBER,
    position VARCHAR2(10),
    gender VARCHAR2(1),
    hire_date DATE,
    salary NUMBER
);

ALTER TABLE department ADD CONSTRAINT department_pk PRIMARY KEY(dept_no);
ALTER TABLE employee ADD CONSTRAINT employee_pk PRIMARY KEY(emp_no);
ALTER TABLE employee ADD CONSTRAINT employee_department_fk FOREIGN KEY(depart) REFERENCES department(dept_no);


INSERT INTO department 
    (dept_no, dept_name, location) 
VALUES 
    (1, '영업부', '대구');
INSERT INTO department(dept_no, dept_name, location) VALUES (2, '인사부', '서울');
INSERT INTO department(dept_no, dept_name, location) VALUES (3, '총무부', '대구');
INSERT INTO department(dept_no, dept_name, location) VALUES (4, '기획부', '서울');

INSERT INTO employee 
    (emp_no, name, depart, position, gender, hire_date, salary)
VALUES
    (1001, '구창민', 1, '과장', 'M', '95-05-01', 5000000);
INSERT INTO employee(emp_no, name, depart, position, gender, hire_date, salary) VALUES (1002, '김민서', 1, '사원', 'M', '17-09-01', 2500000);
INSERT INTO employee(emp_no, name, depart, position, gender, hire_date, salary) VALUES (1003, '이은영', 2, '부장', 'F', '90-09-01', 5500000);
INSERT INTO employee(emp_no, name, depart, position, gender, hire_date, salary) VALUES (1004, '한성일', 2, '과장', 'M', '93-04-01', 5000000);

COMMIT;


-- 카테젼 곱
-- 두 테이블의 조인 조건(관계)이 잘못되거나 없을 때 나타난다.
SELECT
       e.emp_no
     , e.name
     , d.dept_name
     , e.position
     , e.hire_date
     , e.salary
  FROM employee e, department d;

SELECT
       e.emp_no
     , e.name
     , d.dept_name
     , e.position
     , e.hire_date
     , e.salary
  FROM employee e 
 CROSS JOIN department d;


-- 내부 조인
-- INNER JOIN
-- 양쪽 테이블에 모두 존재하는 데이터만 조인하는 것
SELECT
       e.emp_no
     , e.name
     , d.dept_name
     , e.position
     , e.hire_date
     , e.salary
  FROM employee e INNER JOIN department d
    ON e.depart = d.dept_no;

SELECT
       e.emp_no
     , e.name
     , d.dept_name
     , e.position
     , e.hire_date
     , e.salary
  FROM employee e, department d
 WHERE e.depart = d.dept_no;


-- 외부조인 연습을 위한 데이터 추가

-- '참조 무결성'에 의해 아래 데이터를 삽입되지 않는다.
-- 잠시 외래키 제약조건(employee_department_fk)을 비활성화한다.
ALTER TABLE employee DISABLE CONSTRAINT employee_department_fk;

-- 이제 외래키 제약조건이 없기 때문에 아래 데이터는 입력이 가능하다.
INSERT INTO employee 
    (emp_no, name, depart, position, gender, hire_date, salary)
VALUES
    (1005, '김미나', 5, '사원', 'F', '18-05-01', 1800000);


-- 외부조인
-- 모든 사원의 emp_no, name, dept_name, position을 출력하시오.
SELECT
       e.emp_no
     , e.name
     , d.dept_name
     , e.position
  FROM employee e LEFT OUTER JOIN department d
    ON e.depart = d.dept_no;

SELECT
       e.emp_no
     , e.name
     , d.dept_name
     , e.position
  FROM employee e, department d
 WHERE e.depart = d.dept_no(+);

SELECT
       e.emp_no
     , e.name
     , d.dept_name
     , e.position
  FROM department d RIGHT OUTER JOIN employee e
    ON d.dept_no = e.depart;

SELECT
       e.emp_no
     , e.name
     , d.dept_name
     , e.position
  FROM department d, employee e
 WHERE d.dept_no(+) = e.depart;


-- 문제. 아래와 같이 조회하시오.
-- department 테이블의 데이터는 모두 조회하고, employee 테이블의 데이터는 일치하는 것만 조회하시오.
/*
    dept_no   사원수
    1         2
    2         2
    3         0
    4         0
*/
SELECT
       d.dept_no
     , COUNT(e.depart) AS 사원수
  FROM department d LEFT OUTER JOIN employee e
    ON d.dept_no = e.depart
 GROUP BY d.dept_no;
