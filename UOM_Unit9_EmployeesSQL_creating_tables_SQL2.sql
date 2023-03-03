CREATE TABLE departments
	(dept_no CHAR(4) NOT NULL,
	dept_name VARCHAR(20) NOT NULL,
	PRIMARY KEY (dept_no));
	
DROP TABLE departments
	
SELECT * FROM departments

CREATE TABLE dept_emp
	(emp_no INT NOT NULL,
	dept_no CHAR(4) NOT NULL,
	PRIMARY KEY (emp_no, dept_no));     -- Is not importing, fails. Import CSV worked using no primary key???
	
SELECT * FROM dept_emp

DROP TABLE dept_emp

CREATE TABLE dept_manager
	(dept_no CHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (emp_no));
	
DROP TABLE dept_manager

SELECT * FROM dept_manager

CREATE TABLE employees
	(emp_no INT NOT NULL,
	emp_title_id CHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR (20) NOT NULL,
	last_name VARCHAR (20) NOT NULL,
	sex CHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no));
	
DROP TABLE employees

SELECT * FROM employees

CREATE TABLE salaries
	(emp_no INT NOT NULL,
	salary INT NOT NULL,
	PRIMARY KEY (emp_no));
	
DROP TABLE salaries

SELECT * FROM salaries

CREATE TABLE titles
	(title_id CHAR(5) NOT NULL,
	title VARCHAR(20) NOT NULL,
	PRIMARY KEY (title_id));
	
DROP TABLE titles

SELECT * FROM titles



	
	
	
	
	
	
	