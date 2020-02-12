COPY employees
FROM 'D:\BOOTCAMP\git_repos\sql-challenge\data\employees.csv'
WITH (FORMAT CSV, HEADER);

SELECT *
FROM employees;

COPY departments
FROM 'D:\BOOTCAMP\git_repos\sql-challenge\data\departments.csv'
WITH (FORMAT CSV, HEADER);

SELECT *
FROM departments;

COPY titles
FROM 'D:\BOOTCAMP\git_repos\sql-challenge\data\titles.csv'
WITH (FORMAT CSV, HEADER);

SELECT *
FROM titles;

COPY salaries
FROM 'D:\BOOTCAMP\git_repos\sql-challenge\data\salaries.csv'
WITH (FORMAT CSV, HEADER);

SELECT *
FROM salaries;

COPY dept_emp
FROM 'D:\BOOTCAMP\git_repos\sql-challenge\data\dept_emp.csv'
WITH (FORMAT CSV, HEADER);

SELECT *
FROM dept_emp;

COPY dept_manager
FROM 'D:\BOOTCAMP\git_repos\sql-challenge\data\dept_manager.csv'
WITH (FORMAT CSV, HEADER);

SELECT *
FROM dept_manager;