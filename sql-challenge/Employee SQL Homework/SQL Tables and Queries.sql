----Data Engineering - Create six tables and import csv files

CREATE TABLE Departments (
    dept_no VARCHAR(10)   NOT NULL,
    dept_name VARCHAR(50)   NOT NULL
);

CREATE TABLE Department_Emp (
    emp_no INT   NOT NULL,
    dept_no VARCHAR(10)   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL
);


CREATE TABLE Department_Manager (
    dept_no VARCHAR(10)   NOT NULL,
    emp_no INT   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL
);

CREATE TABLE Employees (
    emp_no INT   NOT NULL,
    birth_date date   NOT NULL,
    first_name VARCHAR(50)   NOT NULL,
    last_name VARCHAR(50)   NOT NULL,
    gender VARCHAR(10)   NOT NULL,
    hire_date date   NOT NULL
);

----Drop table if table exists - update made to original Employees table
DROP TABLE Employees

CREATE TABLE Salaries (
	emp_no INT   NOT NULL,
	salaries INT   NOT NULL,
	from_date date   NOT NULL,
    to_date date   NOT NULL
    
);

CREATE TABLE Titles (
	emp_no INT   NOT NULL,
    title VARCHAR(50)   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
); 

----View all six tables

SELECT * FROM Departments
SELECT * FROM Titles
SELECT * FROM Department_Emp
SELECT * FROM Department_Manager
SELECT * FROM Employees
SELECT * FROM Salaries

----Data Analysis
----Task #1 List the employee number, first name, last name, gender and salary

SELECT
	Employees.emp_no,
	Employees.last_name,
	Employees.first_name,
	Employees.gender,
	Salaries.salaries
	
FROM Employees
INNER JOIN Salaries ON
Employees.emp_no=Salaries.emp_no;

----Task # 2 List employees hired in 1986

SELECT * FROM EMPLOYEES
	WHERE hire_date >= '01/01/1986'
	AND hire_date <= '12/31/1986'

----Task #3 List department name and number / manager name, employee number, title / to and from employment dates

SELECT
	departments.dept_no,
	Departments.dept_name,
	Department_Manager.emp_no,
	Employees.last_name,
	Employees.first_name,
	Titles.title,
	Titles.from_date,
	Titles.to_date

	
FROM (((Departments
INNER JOIN Department_Manager ON
Departments.dept_no=Department_Manager.dept_no)
INNER JOIN Employees ON
Department_Manager.emp_no=Employees.emp_no)
INNER JOIN Titles ON
Employees.emp_no=Titles.emp_no)
WHERE title LIKE 'Manager';

----Take # 4 List department name, employee number last and first name 

SELECT 
	Department_Emp.emp_no,
	Employees.last_name,
	Employees.first_name,
	Departments.dept_name

FROM ((Department_Emp
INNER JOIN Departments ON
Departments.dept_no=Department_Emp.dept_no)
INNER JOIN Employees ON
Department_Emp.emp_no=Employees.emp_no);
	  

----Task #5 List all employees with the first name Hercules and the last name begins with "B"

SELECT * FROM Employees
WHERE last_name LIKE 'B%'
AND first_name = 'Hercules'

----Task #6 List all employees in sales department including name, employee number and department name

SELECT 
	Departments.dept_name ,
	Department_Emp.emp_no,
	Employees.last_name,
	Employees.first_name
	
FROM ((Departments
INNER JOIN Department_Emp ON
Departments.dept_no=Department_Emp.dept_no)
INNER JOIN Employees ON
Department_Emp.emp_no=Employees.emp_no)
WHERE dept_name LIKE 'Sales';

----Task #7 List employees in Sales and Development departments - employee number, name and department name

SELECT 
	Departments.dept_name ,
	Department_Emp.emp_no,
	Employees.last_name,
	Employees.first_name
	
FROM ((Departments
INNER JOIN Department_Emp ON
Departments.dept_no=Department_Emp.dept_no)
INNER JOIN Employees ON
Department_Emp.emp_no=Employees.emp_no)
WHERE dept_name='Sales' OR dept_name='Development';

----Task #8 List in descending order frequency count of employees last names

SELECT 
	last_name,
	COUNT (last_name)
FROM
	Employees
GROUP BY
	last_name
ORDER BY
	COUNT DESC;
	

----BONUS - export SQL DB to Pandas





