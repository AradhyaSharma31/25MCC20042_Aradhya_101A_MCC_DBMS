WORKSHEET 6

Student Name: Aradhya Sharma 	

UID: 25MCC20042

Branch: MCA  (CCD)

Section/Group: 25MCC-101A

Semester: 2

Date of Performance: 24 FEB 2026

Subject Name: Technical training 

Subject Code: 25CAP-652
 
1. AIM

To learn how to create, query, and manage views in PostgreSQL in order to simplify database queries and provide a secure abstraction layer for end users.

________________________________________

2. OBJECTIVES

• To understand data abstraction using SQL views

• To hide complex queries behind virtual tables

• To simplify multi-table queries for reporting

• To implement views for restricted data access

• To strengthen SQL skills used in enterprise systems

________________________________________

3. SOFTWARE REQUIREMENTS

Operating System:

• Windows 10 / 11 / Linux / macOS

Database Management System (DBMS):

• PostgreSQL (version 12 or higher)

SQL Interface:

• pgAdmin 4

OR

• PostgreSQL Command Line Interface (psql)

________________________________________

4. PROCEDURE FOR EXPERIMENT

Step 1: Creating a Simple View for Data Filtering

Objective:

To create a simple view that displays only active employees, hiding the complete employee table structure.

```
CREATE TABLE departments (

    dept_id INT PRIMARY KEY,
    
    dept_name TEXT

);
```
```

CREATE TABLE employees (

    emp_id INT PRIMARY KEY,

    emp_name TEXT,

    salary NUMERIC,

    status TEXT,

    dept_id INT REFERENCES departments(dept_id)

);
```
```

CREATE VIEW active_employees_view AS

SELECT emp_id, emp_name, dept_id

FROM employees

WHERE status = 'Active';

SELECT * FROM active_employees_view;
```
Output:

 <img width="454" height="230" alt="image" src="https://github.com/user-attachments/assets/09a9d8de-6c4d-4af3-9a94-343bf921ef45" />

________________________________________

Step 2: Creating a View for Joining Multiple Tables

Objective:

To simplify retrieval of employee and department information using a join-based view.
```
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
```
Output:

 <img width="368" height="191" alt="image" src="https://github.com/user-attachments/assets/b30cc1e7-ae96-45de-84cc-684d74450c67" />

________________________________________

Step 3: Advanced Summarization View

Objective:

To create an aggregated view that provides department-level statistics automatically.
```
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
```

Output:

 <img width="459" height="117" alt="image" src="https://github.com/user-attachments/assets/031af8db-2b99-47a4-88a1-3431a42dca65" />

________________________________________

Learning Outcome

This experiment demonstrates the effective use of views in PostgreSQL to provide abstraction, simplify complex queries, and enhance data security.

Students gain practical exposure to view-based design patterns commonly used in:

• Payroll systems

• Reporting and analytics platforms

• Enterprise database security

• Placement-oriented technical interviews

