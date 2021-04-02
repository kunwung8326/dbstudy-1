DROP TABLE employee;
DROP TABLE department;

CREATE TABLE department (
	dept_no NUMBER,
	dept_name VARCHAR2(15) NOT NULL,
	location VARCHAR2(15) NOT NULL
);

CREATE TABLE employee (
	emp_no NUMBER,
	name VARCHAR2(20) NOT NULL,
	depart NUMBER,
	position VARCHAR2(20),
	gender CHAR(2),
	hire_date DATE,
	salary NUMBER
);

ALTER TABLE department ADD CONSTRAINT department_pk PRIMARY KEY(dept_no);
ALTER TABLE employee ADD CONSTRAINT employee_pk PRIMARY KEY(emp_no);
ALTER TABLE employee ADD CONSTRAINT employee_department_fk FOREIGN KEY(depart) REFERENCES department(dept_no);