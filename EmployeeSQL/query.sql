-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT  employees.emp_no,
		employees.last_name,
		employees.first_name,
		employees.gender,
		salaries.salary
FROM employees
JOIN salaries
	ON employees.emp_no = salaries.emp_no
ORDER BY employees.emp_no ASC;

-- 2. List employees who were hired in 1986.
SELECT  employees.emp_no,
		employees.last_name,
		employees.first_name,
		employees.gender,
		employees.hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986
ORDER BY emp_no ASC;

/*
3. List the manager of each department with the following information: 
department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
*/
CREATE VIEW dept_managers_with_emp_nos AS
	SELECT  departments.dept_no,
			departments.dept_name,
			dept_manager.emp_no
	FROM departments
	JOIN dept_manager
		ON departments.dept_no = dept_manager.dept_no
	ORDER BY dept_manager.emp_no ASC;

CREATE VIEW dept_managers_names_w_emp_nos AS
	SELECT dept_managers_with_emp_nos.*,
			employees.last_name,
			employees.first_name
	FROM dept_managers_with_emp_nos
	JOIN employees
		ON dept_managers_with_emp_nos.emp_no = employees.emp_no;
		
CREATE VIEW dept_managers_bio AS
	SELECT dept_managers_names_w_emp_nos.*,
			dept_emp.from_date,
			dept_emp.to_date
	FROM dept_managers_names_w_emp_nos
	JOIN dept_emp
		ON dept_managers_names_w_emp_nos.emp_no = dept_emp.emp_no;

-- View the compiled results
SELECT  dept_managers_bio.dept_no,
		dept_managers_bio.dept_name,
		dept_managers_bio.last_name,
		dept_managers_bio.first_name,
		dept_managers_bio.emp_no,
		dept_managers_bio.from_date,
		dept_managers_bio.to_date
FROM dept_managers_bio;

-- 4. List the department of each employee with the following information:
-- employee number, last name, first name, and department name.
CREATE VIEW emp_w_dept_nos AS
	SELECT  employees.emp_no,
			employees.last_name,
			employees.first_name,
			dept_emp.dept_no
	FROM employees
	JOIN dept_emp
		ON employees.emp_no = dept_emp.emp_no;

CREATE VIEW emp_w_dept_names AS		
	SELECT  emp_w_dept_nos.emp_no,
			emp_w_dept_nos.last_name,
			emp_w_dept_nos.first_name,
			departments.dept_name
	FROM emp_w_dept_nos
	JOIN departments
		ON emp_w_dept_nos.dept_no = departments.dept_no;

SELECT *
FROM emp_w_dept_names
ORDER BY emp_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name,
		employees.last_name
FROM employees
WHERE employees.first_name = 'Hercules'
	AND employees.last_name LIKE 'B%'
ORDER BY employees.last_name;

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- Using already saved view
SELECT emp_w_dept_names.*
FROM emp_w_dept_names
WHERE dept_name = 'Sales'	
ORDER BY emp_no;

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp_w_dept_names.*
FROM emp_w_dept_names
WHERE dept_name = 'Sales'	
	OR dept_name = 'Development'	
ORDER BY emp_no;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT  employees.last_name,
		COUNT(employees.last_name) AS count_of_last_names
FROM employees
GROUP BY employees.last_name
ORDER BY count_of_last_names DESC;