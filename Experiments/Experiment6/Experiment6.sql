CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name TEXT
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name TEXT,
    salary NUMERIC,
    status TEXT,
    dept_id INT REFERENCES departments(dept_id)
);

INSERT INTO departments VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Finance');

INSERT INTO employees VALUES
(101, 'Amit',   42000, 'Active',   1),
(102, 'Priya',  36000, 'Inactive', 2),
(103, 'Rahul',  55000, 'Active',   2),
(104, 'Neha',   30000, 'Active',   1),
(105, 'Arjun',  48000, 'Active',   3),
(106, 'Rohit',  39000, 'Inactive', 3);

CREATE VIEW active_employees_view AS
SELECT emp_id, emp_name, dept_id
FROM employees
WHERE status = 'Active';

SELECT * FROM active_employees_view;

CREATE VIEW employee_department_view AS
SELECT 
    e.emp_id,
    e.emp_name,
    d.dept_name,
    e.salary
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;

SELECT * FROM employee_department_view;

CREATE VIEW department_summary_view AS
SELECT
    d.dept_name,
    COUNT(e.emp_id) AS total_employees,
    AVG(e.salary)::NUMERIC(20, 2) AS avg_salary,
    SUM(e.salary) AS total_salary
FROM departments d
JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

SELECT * FROM department_summary_view;