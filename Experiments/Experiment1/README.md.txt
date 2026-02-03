Experiment 1.1

Student Name: Aradhya Sharma 		UID: 25MCC20042
Branch: MCA  (CCD)				Section/Group: 25MCC-101A
Semester: 2					Date of Performance: 10 JAN 2026
Subject Name: Technical training 		Subject Code: 25CAP-652


Experiment 1.1: Database System Implementation using DDL, DML, and DCL Commands

1. AIM
To design and implement a sample database system using DDL, DML, and DCL commands, ensuring data integrity through constraints and providing secure, read-only access using role-based privileges.

2. OBJECTIVE
* To create database tables using DDL commands with appropriate constraints
* To insert, update, and delete records using DML commands
* To modify database schema using ALTER statements
* To implement role-based access control using DCL commands


3. SOFTWARE REQUIREMENTS
To perform this experiment, the following software is required:
1. Operating System
o Windows 10 / 11, Linux, or macOS
2. Database Management System (DBMS)
o PostgreSQL (version 12 or higher)
3. SQL Client / Interface
o pgAdmin 4 (for PostgreSQL)
OR
o Command Line Interface (psql) 

4. PRACTICAL/ EXPERIMENT STEPS:
* Design the database schema for Department, Employee and Project tables.
* Create tables using appropriate constraints.
* Insert sample records into tables.
* Perform update and delete operations.
* Retrieve data using SELECT queries.
* Create a role and grant/remove privileges.
* Alter and Drop database objects.
5. PROCEDURE FOR EXPERIMENT

1. Table Creation (DDL Commands)

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




2. Data Manipulation (DML Commands)


DELETE FROM employee
WHERE id = 1;

UPDATE employee
SET name = 'Mary'
WHERE id = 2;


3. Schema Modification (DDL Command)


4. Access Control (DCL Commands)

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



6. LEARNING OUTCOMES
* Understood the use of DDL commands to create and modify database schemas
* Gained experience with DML commands for inserting, updating, and deleting data
* Learned to enforce data integrity using primary key, foreign key, check, and unique constraints
* Implemented role-based security using DCL commands
* Ensured secure, read-only access for authorized users

