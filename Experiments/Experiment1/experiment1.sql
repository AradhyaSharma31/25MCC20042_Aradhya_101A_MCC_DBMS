CREATE TABLE department (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(100),
    created_at DATE DEFAULT CURRENT_DATE
);

CREATE TABLE project (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    due_date DATE NOT NULL,
    budget DECIMAL(10,2),
    status VARCHAR(20) CHECK (status IN ('Planned', 'Ongoing', 'Completed')),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(id)
);


CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT CHECK (age >= 18),
    salary DECIMAL(10,2),
    mobile VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(50) UNIQUE,
    designation VARCHAR(50),
    hire_date DATE DEFAULT CURRENT_DATE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(id)
);

INSERT INTO department (id, name, description) VALUES
(1, 'HR', 'Human Resources'),
(2, 'IT', 'Information Technology'),
(3, 'Finance', 'Finance and Accounting');

INSERT INTO project (id, name, due_date, budget, status, dept_id) VALUES
(101, 'Recruitment Drive', '2026-03-31', 50000, 'Ongoing', 1),
(102, 'ERP System', '2026-06-30', 250000, 'Planned', 2),
(103, 'Annual Audit', '2026-01-31', 75000, 'Completed', 3);

INSERT INTO employee (id, name, age, salary, mobile, email, designation, dept_id) VALUES
(1, 'Alice Johnson', 28, 45000, '9876543210', 'alice@company.com', 'HR Executive', 1),
(2, 'Bob Smith', 32, 65000, '9876543211', 'bob@company.com', 'Software Engineer', 2),
(3, 'Charlie Brown', 40, 70000, '9876543212', 'charlie@company.com', 'Accountant', 3);

DELETE FROM employee
WHERE id = 1;

UPDATE employee
SET name = 'Bob'
WHERE id = 2;

ALTER TABLE department ADD total_employees INT;

CREATE ROLE reporting_user
LOGIN
PASSWORD 'report123';

GRANT SELECT ON department TO reporting_user;
GRANT SELECT ON project TO reporting_user;
GRANT SELECT ON employee TO reporting_user;

GRANT USAGE ON SCHEMA public TO reporting_user;

REVOKE INSERT, UPDATE, DELETE ON department FROM reporting_user;
REVOKE INSERT, UPDATE, DELETE ON employee FROM reporting_user;
REVOKE INSERT, UPDATE, DELETE ON project FROM reporting_user;