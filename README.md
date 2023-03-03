# sql-challenge
UOM_DS_Unit_9_SQL_challenge
Unit 9 SQL Challenge Homework
Robert Bentz

------------------------------------------------------------------------------------

CREATING THE TABLES SQL SCRIPT

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

--------------------------------------------------------------------------------------
QUERY CREATED TABLES TASKS

-- 1. List the employee number, last name, first name, sex and salary of each employee.
--    Will need to do an inner join using employees and salaries table on the emp_no column.

SELECT * FROM employees

SELECT * FROM salaries

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;

-- Outputs table view by itself with salary tacked on.

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
--    Use the employees table and where = 1986 for hire_date. Year is first for hire_date. Use % wildcard?
--    Using hire_date = '1986-%' and hire_date LIKE '1986-%' gives errors? Wrong data type? How to set for DATE?

SELECT * FROM employees

SELECT first_name,
		last_name,
		hire_date
FROM employees
WHERE hire_date > '1985-12-31'
		and hire_date < '1987-01-01';
		
-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
--    departments has dept_no and dept_name.
--    employees has emp_no, last_name, first_name.
--    have to get common denominator between departments and employees tables.
--    ERD shows the table dept_emp is linked to both tables and can bridge.
--    Join table 2 to 1, then table 3 to 1? Table 2 being dept_emp common.  https://stackoverflow.com/questions/43574327/postgresql-inner-join-select-using-three-tables

SELECT departments.dept_no, departments.dept_name, dept_emp.emp_no, employees.last_name, employees.first_name
FROM dept_emp
INNER JOIN departments ON
departments.dept_no=dept_emp.dept_no
INNER JOIN employees ON
dept_emp.emp_no=employees.emp_no;

-- SELECT departments.dept_no, departments.dept_name, departments.emp_no, employees.last_name, employees.first_name
-- FROM employees
-- INNER JOIN departments ON
-- departments.emp_no=employees.emp_no;

-- 4. List the department number for each employee along with that employee's employee number, last name, first name, and department name.
--    This appears to be reordering of task 3?
--    Copy above SQL, reordering the columns?

SELECT departments.dept_no, dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN departments ON
departments.dept_no=dept_emp.dept_no
INNER JOIN employees ON
dept_emp.emp_no=employees.emp_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
--    employees table has necessary columns.
--    Use WHERE with Hercules for first_name AND last_name with B% wildcard.
--    = does not work. Have to use LIKE or NOT LIKE with WHERE?

SELECT * FROM employees

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
--    Use dept_emp table with a Sales filter, along with an inner join on the employees table.
--    Have to get the department name from the departments table. dept_emp is only codes.
--    Sales is d007.
--    [Sales d007 from departments] <--> [emp_no from dept_emp] <--> [last_name, first_name from employees]


SELECT * FROM dept_emp

SELECT * FROM departments

SELECT * FROM employees

SELECT departments.dept_name, dept_emp.emp_no, employees.last_name, employees.first_name
FROM dept_emp
INNER JOIN departments ON
departments.dept_no=dept_emp.dept_no
INNER JOIN employees ON
dept_emp.emp_no=employees.emp_no
WHERE dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
--    See 6. above and use the OR conjunction, reorder columns.

SELECT departments.dept_name, dept_emp.emp_no, employees.last_name, employees.first_name
FROM dept_emp
INNER JOIN departments ON
departments.dept_no=dept_emp.dept_no
INNER JOIN employees ON
dept_emp.emp_no=employees.emp_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
--    Count, order by desc, group?     https://www.w3resource.com/PostgreSQL/postgresql-count-function.php

SELECT last_name,COUNT(*) AS "Last Name Frequency"
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;

-- End of SQL Challenge tasks?
